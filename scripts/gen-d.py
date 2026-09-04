#!/usr/bin/env python3
"""gen-d.py — `quad-roblox/src/D/init.luau` 코드 생성기 (M5 단위 ②).

두 단계(round14 Q5 (a) — 덤프를 재사용 가능한 형태로 남긴다):
  normalize <raw-API-Dump.json> <clientVersionUpload>
      → quad-roblox/dump/api-surface.json  (커밋되는 정규화 산출물 —
        M7 FrameModifier 생성기가 같은 파일을 재사용, Parent 제외는 여기 덤프 층)
  emit
      → quad-roblox/src/D/init.luau        (커밋되는 최종 산출물)

raw 덤프 취득(재생성 때만 네트워크 필요 — 테스트 경로 의존 아님):
  VER=$(curl -s https://clientsettings.roblox.com/v2/client-version/WindowsStudio64 \
        | python3 -c "import json,sys;print(json.load(sys.stdin)['clientVersionUpload'])")
  curl -s -o /tmp/API-Dump.json "https://setup.rbxcdn.com/$VER-API-Dump.json"
  python3 scripts/gen-d.py normalize /tmp/API-Dump.json "$VER"
  python3 scripts/gen-d.py emit

결정의 소스(전부 round14 §4 확정):
  H-295 (a) JSON API Dump 주 소스 + 유한 타입명 매핑
  H-296 (a) 범위 = creatable ∧ (GuiObject∪UIComponent∪LayerCollector 하위)
            + 명시 화이트리스트 {Folder, Camera, WorldModel}
  H-297 (a) ReadOnly/Deprecated/NotScriptable/Hidden/보안≠None 프로퍼티 제외
  H-298 (a) 스칼라 = T | State<T> | Tween<T> | None, 이벤트 = 콜백 |
            State<콜백> | None, children = NewChild(types.luau) — None 표현은
            H-300 (a)로 확정(센티널 마커 필드 → QuadTypes.None)
  H-142     Parent는 덤프 층에서 제외(Q5 (a) — M7 목록과 공유되는 자리)
드롭된 항목은 전부 normalized의 dropped에 남긴다 — 조용한 절단 금지.
"""

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SURFACE = ROOT / "quad-roblox" / "dump" / "api-surface.json"
OUT = ROOT / "quad-roblox" / "src" / "D" / "init.luau"

SCOPE_ROOTS = ("GuiObject", "UIComponent", "LayerCollector")
SCOPE_EXTRA = {"Folder", "Camera", "WorldModel"}  # H-296 (a) 화이트리스트(vide 반례)
# H-301(실측 보강): 클래스 수준 제외 — Deprecated(GuiMain)·NotBrowsable(내부 UI)·
# MemoryCategory Internal(AdGui)은 사용자 표면이 아니고, RelativeGui는 태그론 안
# 드러나지만 Studio 실측에서 RobloxScript capability 없이 생성 불가였다
CLASS_TAG_EXCLUDE = {"Deprecated", "NotBrowsable"}
CLASS_DENY = {"RelativeGui"}  # 실측: lacking capability RobloxScript
PROP_TAG_EXCLUDE = {"ReadOnly", "Deprecated", "NotScriptable", "Hidden"}
EVENT_TAG_EXCLUDE = {"Deprecated", "Hidden"}
PRIMITIVES = {
    "int": "number", "int64": "number", "float": "number", "double": "number",
    "bool": "boolean", "string": "string",
}
# DataType 중 이름 그대로가 아닌 것/버리는 것만 여기 — 나머지는 defs의 같은 이름
# ContentId는 핀 고정된 globalTypes(luau-lsp 1.69.0)가 옛 이름 `Content`로만
# 알고 있다 — defs를 올릴 때 이 매핑을 재검토할 것
DATATYPE_RENAME = {"OptionalCoordinateFrame": "CFrame", "ContentId": "Content"}
DATATYPE_SKIP = {"QDir", "QFont", "BinaryString", "ProtectedString", "SystemAddress"}

RESERVED = {
    "and", "break", "do", "else", "elseif", "end", "false", "for", "function",
    "if", "in", "local", "nil", "not", "or", "repeat", "return", "then",
    "true", "until", "while",
}


def load_classes(raw):
    return {c["Name"]: c for c in raw["Classes"]}


def is_desc(classes, name, root):
    while name in classes:
        if name == root:
            return True
        name = classes[name].get("Superclass")
    return False


def map_type(vt, dropped, ctx):
    cat, name = vt["Category"], vt["Name"]
    if cat == "Primitive":
        if name in PRIMITIVES:
            return PRIMITIVES[name]
    elif cat == "DataType":
        if name in DATATYPE_SKIP:
            dropped.append(f"{ctx}: DataType {name} (skip-listed)")
            return None
        return DATATYPE_RENAME.get(name, name)
    elif cat == "Enum":
        return f"Enum.{name}"
    elif cat == "Class":
        return name
    elif cat == "Group" and name == "Array":
        # 덤프가 요소 타입을 안 실음(Touch* 이벤트의 touchPositions 등) —
        # 거짓 정밀도 대신 { any }로 받아 이벤트 자체는 살린다
        return "{ any }"
    dropped.append(f"{ctx}: unmapped {cat}/{name}")
    return None


def defs_knows(defs_text, luau_type):
    if luau_type in ("number", "boolean", "string", "{ any }"):
        return True
    if luau_type.startswith("Enum."):
        return f"{luau_type.split('.', 1)[1]}:" in defs_text or luau_type in defs_text
    return f"declare extern type {luau_type} " in defs_text or f"declare extern type {luau_type}<" in defs_text


def chain_members(classes, name):
    seen = set()
    node = name
    while node in classes:
        for m in classes[node]["Members"]:
            key = (m["MemberType"], m["Name"])
            if key in seen:
                continue  # 하위 클래스의 오버라이드가 이김
            seen.add(key)
            yield m
        node = classes[node].get("Superclass")


DEFS = ROOT / "scripts" / "roblox-defs" / "globalTypes.d.luau"


def normalize(raw_path, version):
    raw = json.loads(Path(raw_path).read_text())
    classes = load_classes(raw)
    # 핀 고정 defs보다 새로운 API는 타입을 못 쓴다 — defs에 이름이 없으면
    # 떨어뜨리고 dropped에 남긴다(defs를 올리면 자동 복귀)
    defs_text = DEFS.read_text()
    dropped = []
    surface = {}
    for name, c in sorted(classes.items()):
        tags = set(c.get("Tags") or [])
        if "NotCreatable" in tags or "Service" in tags:
            continue
        if not (name in SCOPE_EXTRA or any(is_desc(classes, name, r) for r in SCOPE_ROOTS)):
            continue
        if tags & CLASS_TAG_EXCLUDE or c.get("MemoryCategory") == "Internal" or name in CLASS_DENY:
            dropped.append(f"{name}: class excluded (H-301 — deprecated/internal/capability-gated)")
            continue
        if f"declare extern type {name} " not in defs_text:
            dropped.append(f"{name}: class newer than pinned defs (whole class dropped)")
            continue
        props, events = [], []
        for m in chain_members(classes, name):
            mtags = set(m.get("Tags") or [])
            if m["MemberType"] == "Property":
                if m["Name"] == "Parent":
                    continue  # H-142 — 덤프 층 제외(Q5 (a))
                if mtags & PROP_TAG_EXCLUDE:
                    continue
                sec = m.get("Security") or {}
                if sec.get("Write") != "None" or sec.get("Read") != "None":
                    continue
                t = map_type(m["ValueType"], dropped, f"{name}.{m['Name']}")
                if t is not None and not defs_knows(defs_text, t):
                    dropped.append(f"{name}.{m['Name']}: type {t} newer than pinned defs")
                    t = None
                if t is not None:
                    props.append({"name": m["Name"], "type": t})
            elif m["MemberType"] == "Event":
                if mtags & EVENT_TAG_EXCLUDE:
                    continue
                if m.get("Security") != "None":
                    continue
                params, ok = [], True
                for p in m.get("Parameters") or []:
                    t = map_type(p["Type"], dropped, f"{name}.{m['Name']}({p['Name']})")
                    if t is not None and not defs_knows(defs_text, t):
                        dropped.append(f"{name}.{m['Name']}({p['Name']}): type {t} newer than pinned defs")
                        t = None
                    if t is None:
                        ok = False
                        break
                    pname = p["Name"]
                    if pname in RESERVED or not pname.isidentifier():
                        pname = "_" + pname
                    params.append({"name": pname, "type": t})
                if ok:
                    events.append({"name": m["Name"], "params": params})
        props.sort(key=lambda p: p["name"])
        events.sort(key=lambda e: e["name"])
        surface[name] = {"props": props, "events": events}
    out = {
        "dumpVersion": version,
        "apiVersion": raw.get("Version"),
        "scopeRule": "creatable AND (GuiObject|UIComponent|LayerCollector descendant) OR {Folder,Camera,WorldModel} (H-296 a)",
        "classes": surface,
        "dropped": sorted(set(dropped)),
    }
    SURFACE.parent.mkdir(parents=True, exist_ok=True)
    SURFACE.write_text(json.dumps(out, indent=1, sort_keys=True) + "\n")
    print(f"normalize: {len(surface)} classes, {len(out['dropped'])} dropped notes -> {SURFACE}")


def luau_event_sig(ev):
    args = ", ".join(f"{p['name']}: {p['type']}" for p in ev["params"])
    return f"({args}) -> ()"


def emit():
    data = json.loads(SURFACE.read_text())
    classes = data["classes"]
    L = []
    L.append("--!strict")
    L.append("--[[")
    L.append("\tGENERATED FILE — do not edit by hand. `scripts/gen-d.py` (M5 단위 ②).")
    L.append(f"\tdump: {data['dumpVersion']} (API {data['apiVersion']}); 재생성 방법은 생성기 헤더.")
    L.append("\t표면 계약: bind-system-plan.md 인스턴스 생성 절(New 커링·①~④ 파이프라인·")
    L.append("\tD는 캐스트 별칭·Parent 제외 H-142), claim-plan §7-12(<Class>Param<E> 공유),")
    L.append("\tround14 H-295~H-298·H-300. 유니언: 스칼라 T | State<T> | Tween<T> | None,")
    L.append("\t이벤트 콜백 | State<콜백> | None (None 표현은 H-300 (a) — QuadTypes.None).")
    L.append("\t이벤트 필드의 런타임 핸들러는 Handlers/Event.luau(M10, 2026-09-03 구현됨 —")
    L.append("\t`base/event-plan.md`); M5엔 타입이 먼저 왔다(ROADMAP M5 체크박스의 계약).")
    L.append("\tOnChange(M10, 2026-09-03 역전 — base/onchange-plan.md): 배열부 디스크립터.")
    L.append("\tPropTypes(스코프 전체 프로퍼티 이름 → 타입, 클래스 간 충돌 이름은 any) +")
    L.append("\tOnChangeFn(`K & keyof<PropTypes>` / `index<PropTypes, K>` — 이름 오타·콜백")
    L.append("\t타입·무주석 추론까지, luau-test 30) + 클래스별 <Class>OnChange 유니언이 E에")
    L.append("\t합류(클래스 밖 이름은 생성자 자리에서 거부).")
    L.append("\tModifier(M7 단위 ③, round17): 클래스별 <Class>Modifier(필드 setter — 값은")
    L.append("\tField<T | Tween<T>> = V | State<V> | None | 변환 함수, 자기 타입 반환; 예약 메소드")
    L.append("\tApply/Peek/Overridden; 이벤트는 제외 — 함수 인자는 변환 함수라 콜백과 겹친다)")
    L.append("\t+ D.Modifier.<Class>() 캐스트 별칭(런타임은 quad.Modifier 하나, round17 Q3 (a))")
    L.append("\t+ children엔 마커 `{ read __quadModifier: true }`로(NewChild, types.luau) — <Class>Modifier를")
    L.append("\t유니언에 직접 넣으면 큰 클래스에서 too complex(실측); State<Modifier>는 7절이 error라 제외.")
    L.append("]]")
    L.append("")
    L.append('local QuadTypes = require("../luau_packages/quad_types")')
    L.append('local Types = require("./types")')
    L.append("")
    L.append("type State<T> = QuadTypes.State<T>")
    L.append("type Tween<T> = Types.Tween<T>")
    L.append("type NewChild = Types.NewChild")
    L.append("type None = QuadTypes.None")
    L.append("type MapperDescriptor = QuadTypes.MapperDescriptor")
    L.append("type MapperRoot = QuadTypes.MapperRoot")
    L.append("-- Modifier 필드 setter의 값 타입(modifier-plan 4·4-1·10절): 리터럴 V | State<V> |")
    L.append("-- None(unsetter) | 변환 함수(old는 '현재 저장된 그대로' — V | State<V> | None | nil)")
    L.append("export type Field<V> = V | State<V> | None | ((old: V | State<V> | None | nil) -> V | State<V> | None | nil)")
    L.append("")
    names = sorted(classes.keys())
    for name in names:
        c = classes[name]
        L.append(f"export type {name}Param<E> = {{")
        L.append("\t[number]: E,")
        for p in c["props"]:
            t = p["type"]
            L.append(f"\t{p['name']}: ({t} | State<{t}> | Tween<{t}> | None)?,")
        for ev in c["events"]:
            sig = luau_event_sig(ev)
            L.append(f"\t{ev['name']}: (({sig}) | State<{sig}> | None)?,")
        L.append("}")
        L.append("")
    # OnChange 타이핑(onchange-plan 2026-09-03 역전, luau-test 30 실측):
    #  - PropTypes: 스코프 전체 (이름 → 타입). 같은 이름이 클래스마다 다른
    #    타입이면 `any`(index<>가 유니언을 주면 주석 콜백이 반공변으로 거부됨 —
    #    실측 6건: Style/CanvasSize/Color/Offset/Transparency/Padding).
    #  - 이름 싱글톤 유니언을 `K &`로 직접 교차하면 "too complex"(실측) —
    #    `keyof<PropTypes>`는 같은 유니언이지만 index<>와 짝일 때만 통과했다.
    prop_types = {}
    for name in names:
        for p in classes[name]["props"]:
            prop_types.setdefault(p["name"], set()).add(p["type"])
    L.append("-- OnChange — PropTypes(D 스코프 전체 프로퍼티 이름 → 타입; 클래스 간 충돌은 any)")
    L.append("export type PropTypes = {")
    for pname in sorted(prop_types):
        ts = sorted(prop_types[pname])
        L.append(f"\t{pname}: {ts[0] if len(ts) == 1 else 'any'},")
    L.append("}")
    L.append("export type OnChangeDescriptor<K> = { Name: K, Callback: (index<PropTypes, K>) -> () }")
    L.append("export type OnChangeFn = <K>(name: K & keyof<PropTypes>, fn: (index<PropTypes, K>) -> ()) -> OnChangeDescriptor<K>")
    L.append("")
    for name in names:
        c = classes[name]
        L.append(f"export type {name}OnChange =")
        members = [f'\t{{ Name: "{p["name"]}", Callback: ({p["type"]}) -> () }}' for p in c["props"]]
        # 리뷰 반영: 프로퍼티가 0개인 클래스(지금은 없음 — 최소 Folder 4개)가
        # 생기면 우변 없는 별칭이 찍혀 파일 전체가 깨진다 → never
        L.append("\n\t| ".join(members) if members else "\tnever")
        # 배열 원소 유니언은 클래스당 별칭 하나 — D/DMapper 타입과 런타임 캐스트
        # 네 자리가 같은 별칭을 참조한다(손 나열 드리프트 방지, 리뷰 반영)
        # <Class>Modifier — 프로퍼티만(이벤트 제외: setter의 함수 인자는 변환 함수라
        # 콜백과 구분 불가 — modifier-plan 4절), 예약 메소드 셋은 이름 충돌 시 드롭
        reserved = {"Apply", "Peek", "Overridden"}
        L.append(f"export type {name}Modifier = {{")
        L.append("\tread __quadModifier: true, -- 마커(H-300 관례) — children 유니언은 이 마커만 본다(아래 Elem 주석)")
        L.append(f"\tPeek: <T>(self: {name}Modifier, key: string) -> T | State<T> | None | nil,")
        L.append(f"\tApply: <U>(self: {name}Modifier, factory: ({name}Modifier) -> U) -> U,")
        L.append(f"\tOverridden: (self: {name}Modifier, ...any) -> any,")
        for p in c["props"]:
            if p["name"] in reserved:
                # 런타임 `__index`가 예약 메소드를 먼저 잡아 그런 setter는 존재할 수
                # 없다 — 조용한 절단 금지(파일 머리 규칙): 생성 자체를 실패시킨다
                raise SystemExit(f"{name}.{p['name']}: property collides with a reserved Modifier method")
            t = p["type"]
            L.append(f"\t{p['name']}: (self: {name}Modifier, value: Field<{t} | Tween<{t}>>) -> {name}Modifier,")
        L.append("}")
        # ⚠️ <Class>Modifier는 Elem에 직접 넣지 않는다 — 재귀 메소드 수십 개짜리
        # 테이블 타입이 유니언에 들어가면 큰 클래스의 캐스트 자리에서 솔버가
        # "too complex"(2026-09-04 실측 — 한도 플래그 대조는 typing-limits 8.8절이 소스). 대신 NewChild가
        # 마커 `{ read __quadModifier: true }`를 담아 폭 서브타이핑으로 통과시킨다
        # (types.luau) — 클래스 소속은 setter 호출 자리(<Class>Modifier 메소드 집합)가 맡는다.
        L.append(f"export type {name}Elem = NewChild | {name}OnChange | State<{name}OnChange>")
        L.append(f"export type {name}MapperElem = {name}Elem | MapperDescriptor")
        L.append("")
    L.append("-- D 네임스페이스 타입(H-305 (d′)) — `UseProvider` 확장 `RobloxExtension`이")
    L.append("-- 싣는 풀 타입 표면. 아래 런타임 별칭 캐스트와 1:1 — 손 나열 금지 계약대로")
    L.append("-- 생성기가 같이 찍는다.")
    L.append("export type DMapper = {")
    L.append("\tRoot: MapperRoot,")
    for name in names:
        L.append(
            f"\t{name}: (key: string | MapperRoot) -> ({name}Param<{name}MapperElem>) -> MapperDescriptor,"
        )
    L.append("}")
    L.append("export type DModifier = {")
    for name in names:
        L.append(f"\t{name}: (...({name}Modifier | {{ [string]: any }})) -> {name}Modifier,")
    L.append("}")
    L.append("export type D = {")
    L.append("\tNew: <T>(className: string) -> (props: any) -> T,")
    L.append("\tMapper: DMapper,")
    L.append("\tModifier: DModifier,")
    for name in names:
        L.append(f"\t{name}: ({name}Param<{name}Elem>) -> {name},")
    L.append("}")
    L.append("")
    L.append("--[[ InitD(quad) — `UseProvider` 확장(`RobloxExtension.D`)으로 실린다")
    L.append("\t(round14 H-299의 module.D 직접 대입 채널을 H-305 (d′)가 병합 채널로 이동).")
    L.append("\tNew의 ①~④ 순서는 bind-system-plan 파이프라인 의사코드가 계약. ]]")
    L.append("return function(quad: any): D")
    L.append("\tlocal function New<T>(className: string): (props: any) -> T")
    L.append("\t\tlocal function stage(props: any): T")
    L.append("\t\t\tlocal inst = Instance.new(className) -- ①")
    L.append("\t\t\tquad.nativeClaim(inst) -- ② 생성 직후 무조건, ③④보다 먼저")
    L.append("\t\t\t-- ③④ — flatten(Modifier 소진)은 drive의 첫 pre-pass(round17 Q4 (a),")
    L.append("\t\t\t-- 2026-09-04): New와 Claim이 같은 호출 자리를 쓴다")
    L.append("\t\t\tquad.Dispatch.drive(inst, props)")
    L.append("\t\t\treturn inst :: any")
    L.append("\t\tend")
    L.append("\t\t-- H-238: 범위 밖 클래스의 D.New(name)(props) 경로도 blame이 사용자")
    L.append("\t\t-- 줄에 닿아야 한다 — 스테이지를 만들 때 태그(별칭도 이 경로로 만들어져")
    L.append("\t\t-- 전부 태그됨; 리뷰 발견 반영)")
    L.append("\t\tquad.errorNamespace.setFuncLevel(stage, QuadTypes.ERROR_LEVEL_SURFACE)")
    L.append("\t\treturn stage")
    L.append("\tend")
    L.append("\t-- D.Mapper — Claim용 디스크립터 생성기(claim-plan §2; 본체는 quad-base")
    L.append("\t-- Claim.luau의 newMapperClass — 여기선 클래스별 캐스트 별칭만, D.<Class> 동형)")
    L.append("\tlocal Mapper: { [string]: any } = { Root = quad.MapperRoot }")
    L.append("\t-- D.Modifier — 클래스별 타입드 Modifier 생성자(round17 §0 Q3 (a)): 런타임은")
    L.append("\t-- quad.Modifier 하나, 캐스트 별칭만 클래스별(D.Mapper와 같은 모양)")
    L.append("\tlocal ModifierNS: { [string]: any } = {}")
    L.append("\tlocal D: { [string]: any } = { New = New, Mapper = Mapper, Modifier = ModifierNS }")
    for name in names:
        L.append(f'\tD.{name} = (New("{name}") :: any) :: ({name}Param<{name}Elem>) -> {name}')
    for name in names:
        L.append(
            f'\tMapper.{name} = (quad.newMapperClass("{name}") :: any) :: (key: string | MapperRoot) -> ({name}Param<{name}MapperElem>) -> MapperDescriptor'
        )
    for name in names:
        L.append(f"\tModifierNS.{name} = (quad.Modifier :: any) :: (...({name}Modifier | {{ [string]: any }})) -> {name}Modifier")
    L.append("\tquad.errorNamespace.setFuncLevel(New, QuadTypes.ERROR_LEVEL_SURFACE) -- 별칭·스테이지는 New 안에서 태그됨")
    L.append("\treturn (D :: any) :: D")
    L.append("end")
    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text("\n".join(L) + "\n")
    print(f"emit: {len(names)} classes -> {OUT}")


def main():
    if len(sys.argv) >= 2 and sys.argv[1] == "normalize":
        normalize(sys.argv[2], sys.argv[3])
    elif len(sys.argv) >= 2 and sys.argv[1] == "emit":
        emit()
    else:
        print(__doc__)
        sys.exit(2)


main()
