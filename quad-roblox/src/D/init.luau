--!strict
--[[
	GENERATED FILE — do not edit by hand. `scripts/gen-d.py` (M5 단위 ②).
	dump: version-268c7d941ba34c1a (API 1); 재생성 방법은 생성기 헤더.
	표면 계약: bind-system-plan.md 인스턴스 생성 절(New 커링·①~④ 파이프라인·
	D는 캐스트 별칭·Parent 제외 H-142), claim-plan §7-12(<Class>Param<E> 공유),
	round14 H-295~H-298·H-300. 유니언: 스칼라 T | State<T> | Tween<T> | None,
	이벤트 콜백 | State<콜백> | None (None 표현은 H-300 (a) — QuadTypes.None).
	이벤트 필드의 런타임 핸들러는 Handlers/Event.luau(M10, 2026-09-03 구현됨 —
	`base/event-plan.md`); M5엔 타입이 먼저 왔다(ROADMAP M5 체크박스의 계약).
	OnChange(M10, 2026-09-03 역전 — base/onchange-plan.md): 배열부 디스크립터.
	PropTypes(스코프 전체 프로퍼티 이름 → 타입, 클래스 간 충돌 이름은 any) +
	OnChangeFn(`K & keyof<PropTypes>` / `index<PropTypes, K>` — 이름 오타·콜백
	타입·무주석 추론까지, luau-test 30) + 클래스별 <Class>OnChange 유니언이 E에
	합류(클래스 밖 이름은 생성자 자리에서 거부).
	Modifier(M7 단위 ③, round17): 클래스별 <Class>Modifier(필드 setter — 값은
	Field<T | Tween<T>> = V | State<V> | None | 변환 함수, 자기 타입 반환; 예약 메소드
	Apply/Peek/Overridden; 이벤트는 제외 — 함수 인자는 변환 함수라 콜백과 겹친다)
	+ D.Modifier.<Class>() 타입드 생성자(round17 Q3 (a) — 단위 ③엔 quad.Modifier 캐스트 별칭,
	단위 ④부터 아래 TypedFactory 태그 생성자)
	+ children엔 마커만(<Class>Modifier를 유니언에 직접 넣으면 큰 클래스에서 too complex —
	typing-limits 8.8절): 무타입 base는 `{ read __quadModifier: true }`(NewChild, types.luau),
	클래스 태그는 조상 체인 마커 `{ read __quadModifier: "Frame" | "GuiObject" | … }`(<Class>Elem).
	단위 ④(2026-09-04, 사용자 설계 — modifier-plan 11절): 상위 클래스 Modifier 타입도 전부
	생성(스코프 클래스의 조상 전부 — GuiObjectModifier류; 개수는 이 파일의 <Class>Modifier 선언이
	소스), 검사형 하강 `As<Class>()`(하위 클래스 + 항등),
	무검사 `As<<T>>()`, 인터페이스 `Into<Class> = { As<Class>: (self: any) -> <Class>Modifier }`,
	Apply는 self·factory 둘 다 any(8.9절 — 재귀 필드 + 유니언 멤버 메소드 이름 충돌 시
	유니언 검사가 조용히 통과하는 솔버 결함을 피해 클래스 소속 검사를 되찾음). 런타임은
	quad.Modifier.TypedFactory(name)이 돌려주는 태그 생성자 + DefineSubtype(parent, name) 간선.
]]

local QuadTypes = require("../luau_packages/quad_types")
local Types = require("./types")

type State<T> = QuadTypes.State<T>
type Tween<T> = Types.Tween<T>
type NewChild = Types.NewChild
type None = QuadTypes.None
type MapperDescriptor = QuadTypes.MapperDescriptor
type MapperRoot = QuadTypes.MapperRoot
-- Modifier 필드 setter의 값 타입(modifier-plan 4·4-1·10절): 리터럴 V | State<V> |
-- None(unsetter) | 변환 함수(old는 '현재 저장된 그대로' — V | State<V> | None | nil)
export type Field<V> = V | State<V> | None | ((old: V | State<V> | None | nil) -> V | State<V> | None | nil)

export type BillboardGuiParam<E> = {
	[number]: E,
	Active: (boolean | State<boolean> | Tween<boolean> | None)?,
	Adornee: (Instance | State<Instance> | Tween<Instance> | None)?,
	AlwaysOnTop: (boolean | State<boolean> | Tween<boolean> | None)?,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutoLocalize: (boolean | State<boolean> | Tween<boolean> | None)?,
	Brightness: (number | State<number> | Tween<number> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	ClipsDescendants: (boolean | State<boolean> | Tween<boolean> | None)?,
	DistanceStep: (number | State<number> | Tween<number> | None)?,
	Enabled: (boolean | State<boolean> | Tween<boolean> | None)?,
	ExtentsOffset: (Vector3 | State<Vector3> | Tween<Vector3> | None)?,
	ExtentsOffsetWorldSpace: (Vector3 | State<Vector3> | Tween<Vector3> | None)?,
	LightInfluence: (number | State<number> | Tween<number> | None)?,
	MaxDistance: (number | State<number> | Tween<number> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	PlayerToHideFrom: (Instance | State<Instance> | Tween<Instance> | None)?,
	ResetOnSpawn: (boolean | State<boolean> | Tween<boolean> | None)?,
	RootLocalizationTable: (LocalizationTable | State<LocalizationTable> | Tween<LocalizationTable> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	SelectionBehaviorDown: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorLeft: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorRight: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorUp: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionGroup: (boolean | State<boolean> | Tween<boolean> | None)?,
	Size: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	SizeOffset: (Vector2 | State<Vector2> | Tween<Vector2> | None)?,
	StudsOffset: (Vector3 | State<Vector3> | Tween<Vector3> | None)?,
	StudsOffsetWorldSpace: (Vector3 | State<Vector3> | Tween<Vector3> | None)?,
	ZIndexBehavior: (Enum.ZIndexBehavior | State<Enum.ZIndexBehavior> | Tween<Enum.ZIndexBehavior> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	SelectionChanged: (((amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()) | State<(amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
}

export type CameraParam<E> = {
	[number]: E,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	CFrame: (CFrame | State<CFrame> | Tween<CFrame> | None)?,
	CameraSubject: (Instance | State<Instance> | Tween<Instance> | None)?,
	CameraType: (Enum.CameraType | State<Enum.CameraType> | Tween<Enum.CameraType> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	DiagonalFieldOfView: (number | State<number> | Tween<number> | None)?,
	FieldOfView: (number | State<number> | Tween<number> | None)?,
	FieldOfViewMode: (Enum.FieldOfViewMode | State<Enum.FieldOfViewMode> | Tween<Enum.FieldOfViewMode> | None)?,
	Focus: (CFrame | State<CFrame> | Tween<CFrame> | None)?,
	HeadLocked: (boolean | State<boolean> | Tween<boolean> | None)?,
	HeadScale: (number | State<number> | Tween<number> | None)?,
	MaxAxisFieldOfView: (number | State<number> | Tween<number> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	VRTiltAndRollEnabled: (boolean | State<boolean> | Tween<boolean> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	InterpolationFinished: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
}

export type CanvasGroupParam<E> = {
	[number]: E,
	Active: (boolean | State<boolean> | Tween<boolean> | None)?,
	AnchorPoint: (Vector2 | State<Vector2> | Tween<Vector2> | None)?,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutoLocalize: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutomaticSize: (Enum.AutomaticSize | State<Enum.AutomaticSize> | Tween<Enum.AutomaticSize> | None)?,
	BackgroundColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	BackgroundTransparency: (number | State<number> | Tween<number> | None)?,
	BorderColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	BorderMode: (Enum.BorderMode | State<Enum.BorderMode> | Tween<Enum.BorderMode> | None)?,
	BorderSizePixel: (number | State<number> | Tween<number> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	ClipsDescendants: (boolean | State<boolean> | Tween<boolean> | None)?,
	GroupColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	GroupTransparency: (number | State<number> | Tween<number> | None)?,
	InputSink: (Enum.InputSink | State<Enum.InputSink> | Tween<Enum.InputSink> | None)?,
	Interactable: (boolean | State<boolean> | Tween<boolean> | None)?,
	LayoutOrder: (number | State<number> | Tween<number> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	NextSelectionDown: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionLeft: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionRight: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionUp: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	Position: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	RootLocalizationTable: (LocalizationTable | State<LocalizationTable> | Tween<LocalizationTable> | None)?,
	Rotation: (number | State<number> | Tween<number> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	Selectable: (boolean | State<boolean> | Tween<boolean> | None)?,
	SelectionBehaviorDown: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorLeft: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorRight: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorUp: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionGroup: (boolean | State<boolean> | Tween<boolean> | None)?,
	SelectionImageObject: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	SelectionOrder: (number | State<number> | Tween<number> | None)?,
	Size: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	SizeConstraint: (Enum.SizeConstraint | State<Enum.SizeConstraint> | Tween<Enum.SizeConstraint> | None)?,
	Visible: (boolean | State<boolean> | Tween<boolean> | None)?,
	ZIndex: (number | State<number> | Tween<number> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	InputBegan: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	InputChanged: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	InputEnded: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	MouseEnter: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseLeave: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseMoved: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseWheelBackward: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseWheelForward: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	SelectionChanged: (((amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()) | State<(amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()> | None)?,
	SelectionGained: ((() -> ()) | State<() -> ()> | None)?,
	SelectionLost: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
	TouchLongPress: (((touchPositions: { any }, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, state: Enum.UserInputState) -> ()> | None)?,
	TouchPan: (((touchPositions: { any }, totalTranslation: Vector2, velocity: Vector2, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, totalTranslation: Vector2, velocity: Vector2, state: Enum.UserInputState) -> ()> | None)?,
	TouchPinch: (((touchPositions: { any }, scale: number, velocity: number, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, scale: number, velocity: number, state: Enum.UserInputState) -> ()> | None)?,
	TouchRotate: (((touchPositions: { any }, rotation: number, velocity: number, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, rotation: number, velocity: number, state: Enum.UserInputState) -> ()> | None)?,
	TouchSwipe: (((swipeDirection: Enum.SwipeDirection, numberOfTouches: number) -> ()) | State<(swipeDirection: Enum.SwipeDirection, numberOfTouches: number) -> ()> | None)?,
	TouchTap: (((touchPositions: { any }) -> ()) | State<(touchPositions: { any }) -> ()> | None)?,
}

export type FolderParam<E> = {
	[number]: E,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
}

export type FrameParam<E> = {
	[number]: E,
	Active: (boolean | State<boolean> | Tween<boolean> | None)?,
	AnchorPoint: (Vector2 | State<Vector2> | Tween<Vector2> | None)?,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutoLocalize: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutomaticSize: (Enum.AutomaticSize | State<Enum.AutomaticSize> | Tween<Enum.AutomaticSize> | None)?,
	BackgroundColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	BackgroundTransparency: (number | State<number> | Tween<number> | None)?,
	BorderColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	BorderMode: (Enum.BorderMode | State<Enum.BorderMode> | Tween<Enum.BorderMode> | None)?,
	BorderSizePixel: (number | State<number> | Tween<number> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	ClipsDescendants: (boolean | State<boolean> | Tween<boolean> | None)?,
	InputSink: (Enum.InputSink | State<Enum.InputSink> | Tween<Enum.InputSink> | None)?,
	Interactable: (boolean | State<boolean> | Tween<boolean> | None)?,
	LayoutOrder: (number | State<number> | Tween<number> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	NextSelectionDown: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionLeft: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionRight: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionUp: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	Position: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	RootLocalizationTable: (LocalizationTable | State<LocalizationTable> | Tween<LocalizationTable> | None)?,
	Rotation: (number | State<number> | Tween<number> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	Selectable: (boolean | State<boolean> | Tween<boolean> | None)?,
	SelectionBehaviorDown: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorLeft: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorRight: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorUp: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionGroup: (boolean | State<boolean> | Tween<boolean> | None)?,
	SelectionImageObject: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	SelectionOrder: (number | State<number> | Tween<number> | None)?,
	Size: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	SizeConstraint: (Enum.SizeConstraint | State<Enum.SizeConstraint> | Tween<Enum.SizeConstraint> | None)?,
	Style: (Enum.FrameStyle | State<Enum.FrameStyle> | Tween<Enum.FrameStyle> | None)?,
	Visible: (boolean | State<boolean> | Tween<boolean> | None)?,
	ZIndex: (number | State<number> | Tween<number> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	InputBegan: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	InputChanged: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	InputEnded: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	MouseEnter: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseLeave: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseMoved: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseWheelBackward: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseWheelForward: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	SelectionChanged: (((amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()) | State<(amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()> | None)?,
	SelectionGained: ((() -> ()) | State<() -> ()> | None)?,
	SelectionLost: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
	TouchLongPress: (((touchPositions: { any }, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, state: Enum.UserInputState) -> ()> | None)?,
	TouchPan: (((touchPositions: { any }, totalTranslation: Vector2, velocity: Vector2, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, totalTranslation: Vector2, velocity: Vector2, state: Enum.UserInputState) -> ()> | None)?,
	TouchPinch: (((touchPositions: { any }, scale: number, velocity: number, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, scale: number, velocity: number, state: Enum.UserInputState) -> ()> | None)?,
	TouchRotate: (((touchPositions: { any }, rotation: number, velocity: number, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, rotation: number, velocity: number, state: Enum.UserInputState) -> ()> | None)?,
	TouchSwipe: (((swipeDirection: Enum.SwipeDirection, numberOfTouches: number) -> ()) | State<(swipeDirection: Enum.SwipeDirection, numberOfTouches: number) -> ()> | None)?,
	TouchTap: (((touchPositions: { any }) -> ()) | State<(touchPositions: { any }) -> ()> | None)?,
}

export type ImageButtonParam<E> = {
	[number]: E,
	Active: (boolean | State<boolean> | Tween<boolean> | None)?,
	AnchorPoint: (Vector2 | State<Vector2> | Tween<Vector2> | None)?,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutoButtonColor: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutoLocalize: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutomaticSize: (Enum.AutomaticSize | State<Enum.AutomaticSize> | Tween<Enum.AutomaticSize> | None)?,
	BackgroundColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	BackgroundTransparency: (number | State<number> | Tween<number> | None)?,
	BorderColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	BorderMode: (Enum.BorderMode | State<Enum.BorderMode> | Tween<Enum.BorderMode> | None)?,
	BorderSizePixel: (number | State<number> | Tween<number> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	ClipsDescendants: (boolean | State<boolean> | Tween<boolean> | None)?,
	HoverHapticEffect: (HapticEffect | State<HapticEffect> | Tween<HapticEffect> | None)?,
	HoverImage: (Content | State<Content> | Tween<Content> | None)?,
	HoverImageContent: (Content | State<Content> | Tween<Content> | None)?,
	Image: (Content | State<Content> | Tween<Content> | None)?,
	ImageColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	ImageContent: (Content | State<Content> | Tween<Content> | None)?,
	ImageRectOffset: (Vector2 | State<Vector2> | Tween<Vector2> | None)?,
	ImageRectSize: (Vector2 | State<Vector2> | Tween<Vector2> | None)?,
	ImageTransparency: (number | State<number> | Tween<number> | None)?,
	InputSink: (Enum.InputSink | State<Enum.InputSink> | Tween<Enum.InputSink> | None)?,
	Interactable: (boolean | State<boolean> | Tween<boolean> | None)?,
	LayoutOrder: (number | State<number> | Tween<number> | None)?,
	Modal: (boolean | State<boolean> | Tween<boolean> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	NextSelectionDown: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionLeft: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionRight: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionUp: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	Position: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	PressHapticEffect: (HapticEffect | State<HapticEffect> | Tween<HapticEffect> | None)?,
	PressedImage: (Content | State<Content> | Tween<Content> | None)?,
	PressedImageContent: (Content | State<Content> | Tween<Content> | None)?,
	ResampleMode: (Enum.ResamplerMode | State<Enum.ResamplerMode> | Tween<Enum.ResamplerMode> | None)?,
	RootLocalizationTable: (LocalizationTable | State<LocalizationTable> | Tween<LocalizationTable> | None)?,
	Rotation: (number | State<number> | Tween<number> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	ScaleType: (Enum.ScaleType | State<Enum.ScaleType> | Tween<Enum.ScaleType> | None)?,
	Selectable: (boolean | State<boolean> | Tween<boolean> | None)?,
	Selected: (boolean | State<boolean> | Tween<boolean> | None)?,
	SelectionBehaviorDown: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorLeft: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorRight: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorUp: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionGroup: (boolean | State<boolean> | Tween<boolean> | None)?,
	SelectionImageObject: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	SelectionOrder: (number | State<number> | Tween<number> | None)?,
	Size: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	SizeConstraint: (Enum.SizeConstraint | State<Enum.SizeConstraint> | Tween<Enum.SizeConstraint> | None)?,
	SliceCenter: (Rect | State<Rect> | Tween<Rect> | None)?,
	SliceScale: (number | State<number> | Tween<number> | None)?,
	Style: (Enum.ButtonStyle | State<Enum.ButtonStyle> | Tween<Enum.ButtonStyle> | None)?,
	TileSize: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	Visible: (boolean | State<boolean> | Tween<boolean> | None)?,
	ZIndex: (number | State<number> | Tween<number> | None)?,
	Activated: (((inputObject: InputObject, clickCount: number) -> ()) | State<(inputObject: InputObject, clickCount: number) -> ()> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	InputBegan: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	InputChanged: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	InputEnded: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	MouseButton1Click: ((() -> ()) | State<() -> ()> | None)?,
	MouseButton1Down: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseButton1Up: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseButton2Click: ((() -> ()) | State<() -> ()> | None)?,
	MouseButton2Down: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseButton2Up: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseEnter: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseLeave: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseMoved: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseWheelBackward: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseWheelForward: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	SecondaryActivated: (((inputObject: InputObject) -> ()) | State<(inputObject: InputObject) -> ()> | None)?,
	SelectionChanged: (((amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()) | State<(amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()> | None)?,
	SelectionGained: ((() -> ()) | State<() -> ()> | None)?,
	SelectionLost: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
	TouchLongPress: (((touchPositions: { any }, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, state: Enum.UserInputState) -> ()> | None)?,
	TouchPan: (((touchPositions: { any }, totalTranslation: Vector2, velocity: Vector2, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, totalTranslation: Vector2, velocity: Vector2, state: Enum.UserInputState) -> ()> | None)?,
	TouchPinch: (((touchPositions: { any }, scale: number, velocity: number, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, scale: number, velocity: number, state: Enum.UserInputState) -> ()> | None)?,
	TouchRotate: (((touchPositions: { any }, rotation: number, velocity: number, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, rotation: number, velocity: number, state: Enum.UserInputState) -> ()> | None)?,
	TouchSwipe: (((swipeDirection: Enum.SwipeDirection, numberOfTouches: number) -> ()) | State<(swipeDirection: Enum.SwipeDirection, numberOfTouches: number) -> ()> | None)?,
	TouchTap: (((touchPositions: { any }) -> ()) | State<(touchPositions: { any }) -> ()> | None)?,
}

export type ImageLabelParam<E> = {
	[number]: E,
	Active: (boolean | State<boolean> | Tween<boolean> | None)?,
	AnchorPoint: (Vector2 | State<Vector2> | Tween<Vector2> | None)?,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutoLocalize: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutomaticSize: (Enum.AutomaticSize | State<Enum.AutomaticSize> | Tween<Enum.AutomaticSize> | None)?,
	BackgroundColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	BackgroundTransparency: (number | State<number> | Tween<number> | None)?,
	BorderColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	BorderMode: (Enum.BorderMode | State<Enum.BorderMode> | Tween<Enum.BorderMode> | None)?,
	BorderSizePixel: (number | State<number> | Tween<number> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	ClipsDescendants: (boolean | State<boolean> | Tween<boolean> | None)?,
	Image: (Content | State<Content> | Tween<Content> | None)?,
	ImageColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	ImageContent: (Content | State<Content> | Tween<Content> | None)?,
	ImageRectOffset: (Vector2 | State<Vector2> | Tween<Vector2> | None)?,
	ImageRectSize: (Vector2 | State<Vector2> | Tween<Vector2> | None)?,
	ImageTransparency: (number | State<number> | Tween<number> | None)?,
	InputSink: (Enum.InputSink | State<Enum.InputSink> | Tween<Enum.InputSink> | None)?,
	Interactable: (boolean | State<boolean> | Tween<boolean> | None)?,
	LayoutOrder: (number | State<number> | Tween<number> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	NextSelectionDown: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionLeft: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionRight: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionUp: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	Position: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	ResampleMode: (Enum.ResamplerMode | State<Enum.ResamplerMode> | Tween<Enum.ResamplerMode> | None)?,
	RootLocalizationTable: (LocalizationTable | State<LocalizationTable> | Tween<LocalizationTable> | None)?,
	Rotation: (number | State<number> | Tween<number> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	ScaleType: (Enum.ScaleType | State<Enum.ScaleType> | Tween<Enum.ScaleType> | None)?,
	Selectable: (boolean | State<boolean> | Tween<boolean> | None)?,
	SelectionBehaviorDown: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorLeft: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorRight: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorUp: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionGroup: (boolean | State<boolean> | Tween<boolean> | None)?,
	SelectionImageObject: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	SelectionOrder: (number | State<number> | Tween<number> | None)?,
	Size: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	SizeConstraint: (Enum.SizeConstraint | State<Enum.SizeConstraint> | Tween<Enum.SizeConstraint> | None)?,
	SliceCenter: (Rect | State<Rect> | Tween<Rect> | None)?,
	SliceScale: (number | State<number> | Tween<number> | None)?,
	TileSize: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	Visible: (boolean | State<boolean> | Tween<boolean> | None)?,
	ZIndex: (number | State<number> | Tween<number> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	InputBegan: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	InputChanged: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	InputEnded: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	MouseEnter: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseLeave: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseMoved: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseWheelBackward: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseWheelForward: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	SelectionChanged: (((amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()) | State<(amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()> | None)?,
	SelectionGained: ((() -> ()) | State<() -> ()> | None)?,
	SelectionLost: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
	TouchLongPress: (((touchPositions: { any }, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, state: Enum.UserInputState) -> ()> | None)?,
	TouchPan: (((touchPositions: { any }, totalTranslation: Vector2, velocity: Vector2, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, totalTranslation: Vector2, velocity: Vector2, state: Enum.UserInputState) -> ()> | None)?,
	TouchPinch: (((touchPositions: { any }, scale: number, velocity: number, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, scale: number, velocity: number, state: Enum.UserInputState) -> ()> | None)?,
	TouchRotate: (((touchPositions: { any }, rotation: number, velocity: number, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, rotation: number, velocity: number, state: Enum.UserInputState) -> ()> | None)?,
	TouchSwipe: (((swipeDirection: Enum.SwipeDirection, numberOfTouches: number) -> ()) | State<(swipeDirection: Enum.SwipeDirection, numberOfTouches: number) -> ()> | None)?,
	TouchTap: (((touchPositions: { any }) -> ()) | State<(touchPositions: { any }) -> ()> | None)?,
}

export type ScreenGuiParam<E> = {
	[number]: E,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutoLocalize: (boolean | State<boolean> | Tween<boolean> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	ClipToDeviceSafeArea: (boolean | State<boolean> | Tween<boolean> | None)?,
	DisplayOrder: (number | State<number> | Tween<number> | None)?,
	Enabled: (boolean | State<boolean> | Tween<boolean> | None)?,
	IgnoreGuiInset: (boolean | State<boolean> | Tween<boolean> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	ResetOnSpawn: (boolean | State<boolean> | Tween<boolean> | None)?,
	RootLocalizationTable: (LocalizationTable | State<LocalizationTable> | Tween<LocalizationTable> | None)?,
	SafeAreaCompatibility: (Enum.SafeAreaCompatibility | State<Enum.SafeAreaCompatibility> | Tween<Enum.SafeAreaCompatibility> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	ScreenInsets: (Enum.ScreenInsets | State<Enum.ScreenInsets> | Tween<Enum.ScreenInsets> | None)?,
	SelectionBehaviorDown: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorLeft: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorRight: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorUp: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionGroup: (boolean | State<boolean> | Tween<boolean> | None)?,
	ZIndexBehavior: (Enum.ZIndexBehavior | State<Enum.ZIndexBehavior> | Tween<Enum.ZIndexBehavior> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	SelectionChanged: (((amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()) | State<(amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
}

export type ScrollingFrameParam<E> = {
	[number]: E,
	Active: (boolean | State<boolean> | Tween<boolean> | None)?,
	AnchorPoint: (Vector2 | State<Vector2> | Tween<Vector2> | None)?,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutoLocalize: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutomaticCanvasSize: (Enum.AutomaticSize | State<Enum.AutomaticSize> | Tween<Enum.AutomaticSize> | None)?,
	AutomaticSize: (Enum.AutomaticSize | State<Enum.AutomaticSize> | Tween<Enum.AutomaticSize> | None)?,
	BackgroundColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	BackgroundTransparency: (number | State<number> | Tween<number> | None)?,
	BorderColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	BorderMode: (Enum.BorderMode | State<Enum.BorderMode> | Tween<Enum.BorderMode> | None)?,
	BorderSizePixel: (number | State<number> | Tween<number> | None)?,
	BottomImage: (Content | State<Content> | Tween<Content> | None)?,
	BottomImageContent: (Content | State<Content> | Tween<Content> | None)?,
	CanvasPosition: (Vector2 | State<Vector2> | Tween<Vector2> | None)?,
	CanvasSize: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	ClipsDescendants: (boolean | State<boolean> | Tween<boolean> | None)?,
	ElasticBehavior: (Enum.ElasticBehavior | State<Enum.ElasticBehavior> | Tween<Enum.ElasticBehavior> | None)?,
	HorizontalScrollBarInset: (Enum.ScrollBarInset | State<Enum.ScrollBarInset> | Tween<Enum.ScrollBarInset> | None)?,
	InputSink: (Enum.InputSink | State<Enum.InputSink> | Tween<Enum.InputSink> | None)?,
	Interactable: (boolean | State<boolean> | Tween<boolean> | None)?,
	LayoutOrder: (number | State<number> | Tween<number> | None)?,
	MidImage: (Content | State<Content> | Tween<Content> | None)?,
	MidImageContent: (Content | State<Content> | Tween<Content> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	NextSelectionDown: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionLeft: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionRight: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionUp: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	Position: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	RootLocalizationTable: (LocalizationTable | State<LocalizationTable> | Tween<LocalizationTable> | None)?,
	Rotation: (number | State<number> | Tween<number> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	ScrollBarImageColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	ScrollBarImageTransparency: (number | State<number> | Tween<number> | None)?,
	ScrollBarThickness: (number | State<number> | Tween<number> | None)?,
	ScrollingDirection: (Enum.ScrollingDirection | State<Enum.ScrollingDirection> | Tween<Enum.ScrollingDirection> | None)?,
	ScrollingEnabled: (boolean | State<boolean> | Tween<boolean> | None)?,
	Selectable: (boolean | State<boolean> | Tween<boolean> | None)?,
	SelectionBehaviorDown: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorLeft: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorRight: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorUp: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionGroup: (boolean | State<boolean> | Tween<boolean> | None)?,
	SelectionImageObject: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	SelectionOrder: (number | State<number> | Tween<number> | None)?,
	Size: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	SizeConstraint: (Enum.SizeConstraint | State<Enum.SizeConstraint> | Tween<Enum.SizeConstraint> | None)?,
	TopImage: (Content | State<Content> | Tween<Content> | None)?,
	TopImageContent: (Content | State<Content> | Tween<Content> | None)?,
	VerticalScrollBarInset: (Enum.ScrollBarInset | State<Enum.ScrollBarInset> | Tween<Enum.ScrollBarInset> | None)?,
	VerticalScrollBarPosition: (Enum.VerticalScrollBarPosition | State<Enum.VerticalScrollBarPosition> | Tween<Enum.VerticalScrollBarPosition> | None)?,
	Visible: (boolean | State<boolean> | Tween<boolean> | None)?,
	ZIndex: (number | State<number> | Tween<number> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	InputBegan: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	InputChanged: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	InputEnded: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	MouseEnter: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseLeave: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseMoved: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseWheelBackward: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseWheelForward: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	SelectionChanged: (((amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()) | State<(amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()> | None)?,
	SelectionGained: ((() -> ()) | State<() -> ()> | None)?,
	SelectionLost: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
	TouchLongPress: (((touchPositions: { any }, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, state: Enum.UserInputState) -> ()> | None)?,
	TouchPan: (((touchPositions: { any }, totalTranslation: Vector2, velocity: Vector2, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, totalTranslation: Vector2, velocity: Vector2, state: Enum.UserInputState) -> ()> | None)?,
	TouchPinch: (((touchPositions: { any }, scale: number, velocity: number, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, scale: number, velocity: number, state: Enum.UserInputState) -> ()> | None)?,
	TouchRotate: (((touchPositions: { any }, rotation: number, velocity: number, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, rotation: number, velocity: number, state: Enum.UserInputState) -> ()> | None)?,
	TouchSwipe: (((swipeDirection: Enum.SwipeDirection, numberOfTouches: number) -> ()) | State<(swipeDirection: Enum.SwipeDirection, numberOfTouches: number) -> ()> | None)?,
	TouchTap: (((touchPositions: { any }) -> ()) | State<(touchPositions: { any }) -> ()> | None)?,
}

export type SurfaceGuiParam<E> = {
	[number]: E,
	Active: (boolean | State<boolean> | Tween<boolean> | None)?,
	Adornee: (Instance | State<Instance> | Tween<Instance> | None)?,
	AlwaysOnTop: (boolean | State<boolean> | Tween<boolean> | None)?,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutoLocalize: (boolean | State<boolean> | Tween<boolean> | None)?,
	Brightness: (number | State<number> | Tween<number> | None)?,
	CanvasSize: (Vector2 | State<Vector2> | Tween<Vector2> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	ClipsDescendants: (boolean | State<boolean> | Tween<boolean> | None)?,
	Enabled: (boolean | State<boolean> | Tween<boolean> | None)?,
	Face: (Enum.NormalId | State<Enum.NormalId> | Tween<Enum.NormalId> | None)?,
	LightInfluence: (number | State<number> | Tween<number> | None)?,
	MaxDistance: (number | State<number> | Tween<number> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	PixelsPerStud: (number | State<number> | Tween<number> | None)?,
	ResetOnSpawn: (boolean | State<boolean> | Tween<boolean> | None)?,
	RootLocalizationTable: (LocalizationTable | State<LocalizationTable> | Tween<LocalizationTable> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	SelectionBehaviorDown: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorLeft: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorRight: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorUp: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionGroup: (boolean | State<boolean> | Tween<boolean> | None)?,
	SizingMode: (Enum.SurfaceGuiSizingMode | State<Enum.SurfaceGuiSizingMode> | Tween<Enum.SurfaceGuiSizingMode> | None)?,
	ToolPunchThroughDistance: (number | State<number> | Tween<number> | None)?,
	ZIndexBehavior: (Enum.ZIndexBehavior | State<Enum.ZIndexBehavior> | Tween<Enum.ZIndexBehavior> | None)?,
	ZOffset: (number | State<number> | Tween<number> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	SelectionChanged: (((amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()) | State<(amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
}

export type TextBoxParam<E> = {
	[number]: E,
	Active: (boolean | State<boolean> | Tween<boolean> | None)?,
	AnchorPoint: (Vector2 | State<Vector2> | Tween<Vector2> | None)?,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutoLocalize: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutomaticSize: (Enum.AutomaticSize | State<Enum.AutomaticSize> | Tween<Enum.AutomaticSize> | None)?,
	BackgroundColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	BackgroundTransparency: (number | State<number> | Tween<number> | None)?,
	BorderColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	BorderMode: (Enum.BorderMode | State<Enum.BorderMode> | Tween<Enum.BorderMode> | None)?,
	BorderSizePixel: (number | State<number> | Tween<number> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	ClearTextOnFocus: (boolean | State<boolean> | Tween<boolean> | None)?,
	ClipsDescendants: (boolean | State<boolean> | Tween<boolean> | None)?,
	CursorPosition: (number | State<number> | Tween<number> | None)?,
	FontFace: (Font | State<Font> | Tween<Font> | None)?,
	InputSink: (Enum.InputSink | State<Enum.InputSink> | Tween<Enum.InputSink> | None)?,
	Interactable: (boolean | State<boolean> | Tween<boolean> | None)?,
	LayoutOrder: (number | State<number> | Tween<number> | None)?,
	LineHeight: (number | State<number> | Tween<number> | None)?,
	MaxVisibleGraphemes: (number | State<number> | Tween<number> | None)?,
	MultiLine: (boolean | State<boolean> | Tween<boolean> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	NextSelectionDown: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionLeft: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionRight: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionUp: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	OpenTypeFeatures: (string | State<string> | Tween<string> | None)?,
	PlaceholderColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	PlaceholderText: (string | State<string> | Tween<string> | None)?,
	Position: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	RichText: (boolean | State<boolean> | Tween<boolean> | None)?,
	RootLocalizationTable: (LocalizationTable | State<LocalizationTable> | Tween<LocalizationTable> | None)?,
	Rotation: (number | State<number> | Tween<number> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	Selectable: (boolean | State<boolean> | Tween<boolean> | None)?,
	SelectionBehaviorDown: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorLeft: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorRight: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorUp: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionGroup: (boolean | State<boolean> | Tween<boolean> | None)?,
	SelectionImageObject: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	SelectionOrder: (number | State<number> | Tween<number> | None)?,
	SelectionStart: (number | State<number> | Tween<number> | None)?,
	ShowNativeInput: (boolean | State<boolean> | Tween<boolean> | None)?,
	Size: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	SizeConstraint: (Enum.SizeConstraint | State<Enum.SizeConstraint> | Tween<Enum.SizeConstraint> | None)?,
	Text: (string | State<string> | Tween<string> | None)?,
	TextColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	TextDirection: (Enum.TextDirection | State<Enum.TextDirection> | Tween<Enum.TextDirection> | None)?,
	TextEditable: (boolean | State<boolean> | Tween<boolean> | None)?,
	TextScaled: (boolean | State<boolean> | Tween<boolean> | None)?,
	TextSize: (number | State<number> | Tween<number> | None)?,
	TextStrokeColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	TextStrokeTransparency: (number | State<number> | Tween<number> | None)?,
	TextTransparency: (number | State<number> | Tween<number> | None)?,
	TextTruncate: (Enum.TextTruncate | State<Enum.TextTruncate> | Tween<Enum.TextTruncate> | None)?,
	TextWrapped: (boolean | State<boolean> | Tween<boolean> | None)?,
	TextXAlignment: (Enum.TextXAlignment | State<Enum.TextXAlignment> | Tween<Enum.TextXAlignment> | None)?,
	TextYAlignment: (Enum.TextYAlignment | State<Enum.TextYAlignment> | Tween<Enum.TextYAlignment> | None)?,
	Visible: (boolean | State<boolean> | Tween<boolean> | None)?,
	ZIndex: (number | State<number> | Tween<number> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	FocusLost: (((enterPressed: boolean, inputThatCausedFocusLoss: InputObject) -> ()) | State<(enterPressed: boolean, inputThatCausedFocusLoss: InputObject) -> ()> | None)?,
	Focused: ((() -> ()) | State<() -> ()> | None)?,
	InputBegan: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	InputChanged: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	InputEnded: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	MouseEnter: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseLeave: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseMoved: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseWheelBackward: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseWheelForward: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	ReturnPressedFromOnScreenKeyboard: ((() -> ()) | State<() -> ()> | None)?,
	SelectionChanged: (((amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()) | State<(amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()> | None)?,
	SelectionGained: ((() -> ()) | State<() -> ()> | None)?,
	SelectionLost: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
	TouchLongPress: (((touchPositions: { any }, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, state: Enum.UserInputState) -> ()> | None)?,
	TouchPan: (((touchPositions: { any }, totalTranslation: Vector2, velocity: Vector2, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, totalTranslation: Vector2, velocity: Vector2, state: Enum.UserInputState) -> ()> | None)?,
	TouchPinch: (((touchPositions: { any }, scale: number, velocity: number, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, scale: number, velocity: number, state: Enum.UserInputState) -> ()> | None)?,
	TouchRotate: (((touchPositions: { any }, rotation: number, velocity: number, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, rotation: number, velocity: number, state: Enum.UserInputState) -> ()> | None)?,
	TouchSwipe: (((swipeDirection: Enum.SwipeDirection, numberOfTouches: number) -> ()) | State<(swipeDirection: Enum.SwipeDirection, numberOfTouches: number) -> ()> | None)?,
	TouchTap: (((touchPositions: { any }) -> ()) | State<(touchPositions: { any }) -> ()> | None)?,
}

export type TextButtonParam<E> = {
	[number]: E,
	Active: (boolean | State<boolean> | Tween<boolean> | None)?,
	AnchorPoint: (Vector2 | State<Vector2> | Tween<Vector2> | None)?,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutoButtonColor: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutoLocalize: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutomaticSize: (Enum.AutomaticSize | State<Enum.AutomaticSize> | Tween<Enum.AutomaticSize> | None)?,
	BackgroundColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	BackgroundTransparency: (number | State<number> | Tween<number> | None)?,
	BorderColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	BorderMode: (Enum.BorderMode | State<Enum.BorderMode> | Tween<Enum.BorderMode> | None)?,
	BorderSizePixel: (number | State<number> | Tween<number> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	ClipsDescendants: (boolean | State<boolean> | Tween<boolean> | None)?,
	FontFace: (Font | State<Font> | Tween<Font> | None)?,
	HoverHapticEffect: (HapticEffect | State<HapticEffect> | Tween<HapticEffect> | None)?,
	InputSink: (Enum.InputSink | State<Enum.InputSink> | Tween<Enum.InputSink> | None)?,
	Interactable: (boolean | State<boolean> | Tween<boolean> | None)?,
	LayoutOrder: (number | State<number> | Tween<number> | None)?,
	LineHeight: (number | State<number> | Tween<number> | None)?,
	MaxVisibleGraphemes: (number | State<number> | Tween<number> | None)?,
	Modal: (boolean | State<boolean> | Tween<boolean> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	NextSelectionDown: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionLeft: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionRight: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionUp: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	OpenTypeFeatures: (string | State<string> | Tween<string> | None)?,
	Position: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	PressHapticEffect: (HapticEffect | State<HapticEffect> | Tween<HapticEffect> | None)?,
	RichText: (boolean | State<boolean> | Tween<boolean> | None)?,
	RootLocalizationTable: (LocalizationTable | State<LocalizationTable> | Tween<LocalizationTable> | None)?,
	Rotation: (number | State<number> | Tween<number> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	Selectable: (boolean | State<boolean> | Tween<boolean> | None)?,
	Selected: (boolean | State<boolean> | Tween<boolean> | None)?,
	SelectionBehaviorDown: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorLeft: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorRight: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorUp: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionGroup: (boolean | State<boolean> | Tween<boolean> | None)?,
	SelectionImageObject: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	SelectionOrder: (number | State<number> | Tween<number> | None)?,
	Size: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	SizeConstraint: (Enum.SizeConstraint | State<Enum.SizeConstraint> | Tween<Enum.SizeConstraint> | None)?,
	Style: (Enum.ButtonStyle | State<Enum.ButtonStyle> | Tween<Enum.ButtonStyle> | None)?,
	Text: (string | State<string> | Tween<string> | None)?,
	TextColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	TextDirection: (Enum.TextDirection | State<Enum.TextDirection> | Tween<Enum.TextDirection> | None)?,
	TextScaled: (boolean | State<boolean> | Tween<boolean> | None)?,
	TextSize: (number | State<number> | Tween<number> | None)?,
	TextStrokeColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	TextStrokeTransparency: (number | State<number> | Tween<number> | None)?,
	TextTransparency: (number | State<number> | Tween<number> | None)?,
	TextTruncate: (Enum.TextTruncate | State<Enum.TextTruncate> | Tween<Enum.TextTruncate> | None)?,
	TextWrapped: (boolean | State<boolean> | Tween<boolean> | None)?,
	TextXAlignment: (Enum.TextXAlignment | State<Enum.TextXAlignment> | Tween<Enum.TextXAlignment> | None)?,
	TextYAlignment: (Enum.TextYAlignment | State<Enum.TextYAlignment> | Tween<Enum.TextYAlignment> | None)?,
	Visible: (boolean | State<boolean> | Tween<boolean> | None)?,
	ZIndex: (number | State<number> | Tween<number> | None)?,
	Activated: (((inputObject: InputObject, clickCount: number) -> ()) | State<(inputObject: InputObject, clickCount: number) -> ()> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	InputBegan: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	InputChanged: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	InputEnded: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	MouseButton1Click: ((() -> ()) | State<() -> ()> | None)?,
	MouseButton1Down: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseButton1Up: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseButton2Click: ((() -> ()) | State<() -> ()> | None)?,
	MouseButton2Down: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseButton2Up: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseEnter: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseLeave: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseMoved: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseWheelBackward: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseWheelForward: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	SecondaryActivated: (((inputObject: InputObject) -> ()) | State<(inputObject: InputObject) -> ()> | None)?,
	SelectionChanged: (((amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()) | State<(amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()> | None)?,
	SelectionGained: ((() -> ()) | State<() -> ()> | None)?,
	SelectionLost: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
	TouchLongPress: (((touchPositions: { any }, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, state: Enum.UserInputState) -> ()> | None)?,
	TouchPan: (((touchPositions: { any }, totalTranslation: Vector2, velocity: Vector2, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, totalTranslation: Vector2, velocity: Vector2, state: Enum.UserInputState) -> ()> | None)?,
	TouchPinch: (((touchPositions: { any }, scale: number, velocity: number, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, scale: number, velocity: number, state: Enum.UserInputState) -> ()> | None)?,
	TouchRotate: (((touchPositions: { any }, rotation: number, velocity: number, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, rotation: number, velocity: number, state: Enum.UserInputState) -> ()> | None)?,
	TouchSwipe: (((swipeDirection: Enum.SwipeDirection, numberOfTouches: number) -> ()) | State<(swipeDirection: Enum.SwipeDirection, numberOfTouches: number) -> ()> | None)?,
	TouchTap: (((touchPositions: { any }) -> ()) | State<(touchPositions: { any }) -> ()> | None)?,
}

export type TextLabelParam<E> = {
	[number]: E,
	Active: (boolean | State<boolean> | Tween<boolean> | None)?,
	AnchorPoint: (Vector2 | State<Vector2> | Tween<Vector2> | None)?,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutoLocalize: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutomaticSize: (Enum.AutomaticSize | State<Enum.AutomaticSize> | Tween<Enum.AutomaticSize> | None)?,
	BackgroundColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	BackgroundTransparency: (number | State<number> | Tween<number> | None)?,
	BorderColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	BorderMode: (Enum.BorderMode | State<Enum.BorderMode> | Tween<Enum.BorderMode> | None)?,
	BorderSizePixel: (number | State<number> | Tween<number> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	ClipsDescendants: (boolean | State<boolean> | Tween<boolean> | None)?,
	FontFace: (Font | State<Font> | Tween<Font> | None)?,
	InputSink: (Enum.InputSink | State<Enum.InputSink> | Tween<Enum.InputSink> | None)?,
	Interactable: (boolean | State<boolean> | Tween<boolean> | None)?,
	LayoutOrder: (number | State<number> | Tween<number> | None)?,
	LineHeight: (number | State<number> | Tween<number> | None)?,
	MaxVisibleGraphemes: (number | State<number> | Tween<number> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	NextSelectionDown: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionLeft: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionRight: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionUp: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	OpenTypeFeatures: (string | State<string> | Tween<string> | None)?,
	Position: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	RichText: (boolean | State<boolean> | Tween<boolean> | None)?,
	RootLocalizationTable: (LocalizationTable | State<LocalizationTable> | Tween<LocalizationTable> | None)?,
	Rotation: (number | State<number> | Tween<number> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	Selectable: (boolean | State<boolean> | Tween<boolean> | None)?,
	SelectionBehaviorDown: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorLeft: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorRight: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorUp: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionGroup: (boolean | State<boolean> | Tween<boolean> | None)?,
	SelectionImageObject: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	SelectionOrder: (number | State<number> | Tween<number> | None)?,
	Size: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	SizeConstraint: (Enum.SizeConstraint | State<Enum.SizeConstraint> | Tween<Enum.SizeConstraint> | None)?,
	Text: (string | State<string> | Tween<string> | None)?,
	TextColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	TextDirection: (Enum.TextDirection | State<Enum.TextDirection> | Tween<Enum.TextDirection> | None)?,
	TextScaled: (boolean | State<boolean> | Tween<boolean> | None)?,
	TextSize: (number | State<number> | Tween<number> | None)?,
	TextStrokeColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	TextStrokeTransparency: (number | State<number> | Tween<number> | None)?,
	TextTransparency: (number | State<number> | Tween<number> | None)?,
	TextTruncate: (Enum.TextTruncate | State<Enum.TextTruncate> | Tween<Enum.TextTruncate> | None)?,
	TextWrapped: (boolean | State<boolean> | Tween<boolean> | None)?,
	TextXAlignment: (Enum.TextXAlignment | State<Enum.TextXAlignment> | Tween<Enum.TextXAlignment> | None)?,
	TextYAlignment: (Enum.TextYAlignment | State<Enum.TextYAlignment> | Tween<Enum.TextYAlignment> | None)?,
	Visible: (boolean | State<boolean> | Tween<boolean> | None)?,
	ZIndex: (number | State<number> | Tween<number> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	InputBegan: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	InputChanged: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	InputEnded: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	MouseEnter: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseLeave: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseMoved: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseWheelBackward: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseWheelForward: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	SelectionChanged: (((amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()) | State<(amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()> | None)?,
	SelectionGained: ((() -> ()) | State<() -> ()> | None)?,
	SelectionLost: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
	TouchLongPress: (((touchPositions: { any }, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, state: Enum.UserInputState) -> ()> | None)?,
	TouchPan: (((touchPositions: { any }, totalTranslation: Vector2, velocity: Vector2, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, totalTranslation: Vector2, velocity: Vector2, state: Enum.UserInputState) -> ()> | None)?,
	TouchPinch: (((touchPositions: { any }, scale: number, velocity: number, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, scale: number, velocity: number, state: Enum.UserInputState) -> ()> | None)?,
	TouchRotate: (((touchPositions: { any }, rotation: number, velocity: number, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, rotation: number, velocity: number, state: Enum.UserInputState) -> ()> | None)?,
	TouchSwipe: (((swipeDirection: Enum.SwipeDirection, numberOfTouches: number) -> ()) | State<(swipeDirection: Enum.SwipeDirection, numberOfTouches: number) -> ()> | None)?,
	TouchTap: (((touchPositions: { any }) -> ()) | State<(touchPositions: { any }) -> ()> | None)?,
}

export type UIAspectRatioConstraintParam<E> = {
	[number]: E,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	AspectRatio: (number | State<number> | Tween<number> | None)?,
	AspectType: (Enum.AspectType | State<Enum.AspectType> | Tween<Enum.AspectType> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	DominantAxis: (Enum.DominantAxis | State<Enum.DominantAxis> | Tween<Enum.DominantAxis> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
}

export type UICornerParam<E> = {
	[number]: E,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	BottomLeftRadius: (UDim | State<UDim> | Tween<UDim> | None)?,
	BottomRightRadius: (UDim | State<UDim> | Tween<UDim> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	CornerRadius: (UDim | State<UDim> | Tween<UDim> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	TopLeftRadius: (UDim | State<UDim> | Tween<UDim> | None)?,
	TopRightRadius: (UDim | State<UDim> | Tween<UDim> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
}

export type UIDragDetectorParam<E> = {
	[number]: E,
	ActivatedCursorIcon: (Content | State<Content> | Tween<Content> | None)?,
	ActivatedCursorIconContent: (Content | State<Content> | Tween<Content> | None)?,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	BoundingBehavior: (Enum.UIDragDetectorBoundingBehavior | State<Enum.UIDragDetectorBoundingBehavior> | Tween<Enum.UIDragDetectorBoundingBehavior> | None)?,
	BoundingUI: (GuiBase2d | State<GuiBase2d> | Tween<GuiBase2d> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	CursorIcon: (Content | State<Content> | Tween<Content> | None)?,
	CursorIconContent: (Content | State<Content> | Tween<Content> | None)?,
	DragAxis: (Vector2 | State<Vector2> | Tween<Vector2> | None)?,
	DragRelativity: (Enum.UIDragDetectorDragRelativity | State<Enum.UIDragDetectorDragRelativity> | Tween<Enum.UIDragDetectorDragRelativity> | None)?,
	DragRotation: (number | State<number> | Tween<number> | None)?,
	DragSpace: (Enum.UIDragDetectorDragSpace | State<Enum.UIDragDetectorDragSpace> | Tween<Enum.UIDragDetectorDragSpace> | None)?,
	DragStyle: (Enum.UIDragDetectorDragStyle | State<Enum.UIDragDetectorDragStyle> | Tween<Enum.UIDragDetectorDragStyle> | None)?,
	DragUDim2: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	Enabled: (boolean | State<boolean> | Tween<boolean> | None)?,
	MaxDragAngle: (number | State<number> | Tween<number> | None)?,
	MaxDragTranslation: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	MinDragAngle: (number | State<number> | Tween<number> | None)?,
	MinDragTranslation: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	ReferenceUIInstance: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	ResponseStyle: (Enum.UIDragDetectorResponseStyle | State<Enum.UIDragDetectorResponseStyle> | Tween<Enum.UIDragDetectorResponseStyle> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	SelectionModeDragSpeed: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	SelectionModeRotateSpeed: (number | State<number> | Tween<number> | None)?,
	UIDragSpeedAxisMapping: (Enum.UIDragSpeedAxisMapping | State<Enum.UIDragSpeedAxisMapping> | Tween<Enum.UIDragSpeedAxisMapping> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	DragContinue: (((inputPosition: Vector2) -> ()) | State<(inputPosition: Vector2) -> ()> | None)?,
	DragEnd: (((inputPosition: Vector2) -> ()) | State<(inputPosition: Vector2) -> ()> | None)?,
	DragStart: (((inputPosition: Vector2) -> ()) | State<(inputPosition: Vector2) -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
}

export type UIFlexItemParam<E> = {
	[number]: E,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	FlexMode: (Enum.UIFlexMode | State<Enum.UIFlexMode> | Tween<Enum.UIFlexMode> | None)?,
	GrowRatio: (number | State<number> | Tween<number> | None)?,
	ItemLineAlignment: (Enum.ItemLineAlignment | State<Enum.ItemLineAlignment> | Tween<Enum.ItemLineAlignment> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	ShrinkRatio: (number | State<number> | Tween<number> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
}

export type UIGradientParam<E> = {
	[number]: E,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	Color: (ColorSequence | State<ColorSequence> | Tween<ColorSequence> | None)?,
	Enabled: (boolean | State<boolean> | Tween<boolean> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	Offset: (Vector2 | State<Vector2> | Tween<Vector2> | None)?,
	Rotation: (number | State<number> | Tween<number> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	Scale: (number | State<number> | Tween<number> | None)?,
	TileMode: (Enum.GradientTileMode | State<Enum.GradientTileMode> | Tween<Enum.GradientTileMode> | None)?,
	Transparency: (NumberSequence | State<NumberSequence> | Tween<NumberSequence> | None)?,
	Type: (Enum.GradientType | State<Enum.GradientType> | Tween<Enum.GradientType> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
}

export type UIGridLayoutParam<E> = {
	[number]: E,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	CellPadding: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	CellSize: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	FillDirection: (Enum.FillDirection | State<Enum.FillDirection> | Tween<Enum.FillDirection> | None)?,
	FillDirectionMaxCells: (number | State<number> | Tween<number> | None)?,
	HorizontalAlignment: (Enum.HorizontalAlignment | State<Enum.HorizontalAlignment> | Tween<Enum.HorizontalAlignment> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	SortOrder: (Enum.SortOrder | State<Enum.SortOrder> | Tween<Enum.SortOrder> | None)?,
	StartCorner: (Enum.StartCorner | State<Enum.StartCorner> | Tween<Enum.StartCorner> | None)?,
	VerticalAlignment: (Enum.VerticalAlignment | State<Enum.VerticalAlignment> | Tween<Enum.VerticalAlignment> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
}

export type UIListLayoutParam<E> = {
	[number]: E,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	FillDirection: (Enum.FillDirection | State<Enum.FillDirection> | Tween<Enum.FillDirection> | None)?,
	HorizontalAlignment: (Enum.HorizontalAlignment | State<Enum.HorizontalAlignment> | Tween<Enum.HorizontalAlignment> | None)?,
	HorizontalFlex: (Enum.UIFlexAlignment | State<Enum.UIFlexAlignment> | Tween<Enum.UIFlexAlignment> | None)?,
	ItemLineAlignment: (Enum.ItemLineAlignment | State<Enum.ItemLineAlignment> | Tween<Enum.ItemLineAlignment> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	Padding: (UDim | State<UDim> | Tween<UDim> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	SortOrder: (Enum.SortOrder | State<Enum.SortOrder> | Tween<Enum.SortOrder> | None)?,
	VerticalAlignment: (Enum.VerticalAlignment | State<Enum.VerticalAlignment> | Tween<Enum.VerticalAlignment> | None)?,
	VerticalFlex: (Enum.UIFlexAlignment | State<Enum.UIFlexAlignment> | Tween<Enum.UIFlexAlignment> | None)?,
	Wraps: (boolean | State<boolean> | Tween<boolean> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
}

export type UIPaddingParam<E> = {
	[number]: E,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	PaddingBottom: (UDim | State<UDim> | Tween<UDim> | None)?,
	PaddingLeft: (UDim | State<UDim> | Tween<UDim> | None)?,
	PaddingRight: (UDim | State<UDim> | Tween<UDim> | None)?,
	PaddingTop: (UDim | State<UDim> | Tween<UDim> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
}

export type UIPageLayoutParam<E> = {
	[number]: E,
	Animated: (boolean | State<boolean> | Tween<boolean> | None)?,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	Circular: (boolean | State<boolean> | Tween<boolean> | None)?,
	EasingDirection: (Enum.EasingDirection | State<Enum.EasingDirection> | Tween<Enum.EasingDirection> | None)?,
	EasingStyle: (Enum.EasingStyle | State<Enum.EasingStyle> | Tween<Enum.EasingStyle> | None)?,
	FillDirection: (Enum.FillDirection | State<Enum.FillDirection> | Tween<Enum.FillDirection> | None)?,
	GamepadInputEnabled: (boolean | State<boolean> | Tween<boolean> | None)?,
	HorizontalAlignment: (Enum.HorizontalAlignment | State<Enum.HorizontalAlignment> | Tween<Enum.HorizontalAlignment> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	Padding: (UDim | State<UDim> | Tween<UDim> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	ScrollWheelInputEnabled: (boolean | State<boolean> | Tween<boolean> | None)?,
	SortOrder: (Enum.SortOrder | State<Enum.SortOrder> | Tween<Enum.SortOrder> | None)?,
	TouchInputEnabled: (boolean | State<boolean> | Tween<boolean> | None)?,
	TweenTime: (number | State<number> | Tween<number> | None)?,
	VerticalAlignment: (Enum.VerticalAlignment | State<Enum.VerticalAlignment> | Tween<Enum.VerticalAlignment> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	PageEnter: (((page: Instance) -> ()) | State<(page: Instance) -> ()> | None)?,
	PageLeave: (((page: Instance) -> ()) | State<(page: Instance) -> ()> | None)?,
	Stopped: (((currentPage: Instance) -> ()) | State<(currentPage: Instance) -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
}

export type UIScaleParam<E> = {
	[number]: E,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	Scale: (number | State<number> | Tween<number> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
}

export type UIShadowParam<E> = {
	[number]: E,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	BlurRadius: (UDim | State<UDim> | Tween<UDim> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	Color: (Color3 | State<Color3> | Tween<Color3> | None)?,
	Enabled: (boolean | State<boolean> | Tween<boolean> | None)?,
	Inset: (boolean | State<boolean> | Tween<boolean> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	Offset: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	ShowBehindParent: (boolean | State<boolean> | Tween<boolean> | None)?,
	Spread: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	Transparency: (number | State<number> | Tween<number> | None)?,
	ZIndex: (number | State<number> | Tween<number> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
}

export type UISizeConstraintParam<E> = {
	[number]: E,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	MaxSize: (Vector2 | State<Vector2> | Tween<Vector2> | None)?,
	MinSize: (Vector2 | State<Vector2> | Tween<Vector2> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
}

export type UIStrokeParam<E> = {
	[number]: E,
	ApplyStrokeMode: (Enum.ApplyStrokeMode | State<Enum.ApplyStrokeMode> | Tween<Enum.ApplyStrokeMode> | None)?,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	BorderOffset: (UDim | State<UDim> | Tween<UDim> | None)?,
	BorderStrokePosition: (Enum.BorderStrokePosition | State<Enum.BorderStrokePosition> | Tween<Enum.BorderStrokePosition> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	Color: (Color3 | State<Color3> | Tween<Color3> | None)?,
	Enabled: (boolean | State<boolean> | Tween<boolean> | None)?,
	LineJoinMode: (Enum.LineJoinMode | State<Enum.LineJoinMode> | Tween<Enum.LineJoinMode> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	StrokeSizingMode: (Enum.StrokeSizingMode | State<Enum.StrokeSizingMode> | Tween<Enum.StrokeSizingMode> | None)?,
	Thickness: (number | State<number> | Tween<number> | None)?,
	Transparency: (number | State<number> | Tween<number> | None)?,
	ZIndex: (number | State<number> | Tween<number> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
}

export type UITableLayoutParam<E> = {
	[number]: E,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	FillDirection: (Enum.FillDirection | State<Enum.FillDirection> | Tween<Enum.FillDirection> | None)?,
	FillEmptySpaceColumns: (boolean | State<boolean> | Tween<boolean> | None)?,
	FillEmptySpaceRows: (boolean | State<boolean> | Tween<boolean> | None)?,
	HorizontalAlignment: (Enum.HorizontalAlignment | State<Enum.HorizontalAlignment> | Tween<Enum.HorizontalAlignment> | None)?,
	MajorAxis: (Enum.TableMajorAxis | State<Enum.TableMajorAxis> | Tween<Enum.TableMajorAxis> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	Padding: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	SortOrder: (Enum.SortOrder | State<Enum.SortOrder> | Tween<Enum.SortOrder> | None)?,
	VerticalAlignment: (Enum.VerticalAlignment | State<Enum.VerticalAlignment> | Tween<Enum.VerticalAlignment> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
}

export type UITextSizeConstraintParam<E> = {
	[number]: E,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	MaxTextSize: (number | State<number> | Tween<number> | None)?,
	MinTextSize: (number | State<number> | Tween<number> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
}

export type VideoFrameParam<E> = {
	[number]: E,
	Active: (boolean | State<boolean> | Tween<boolean> | None)?,
	AnchorPoint: (Vector2 | State<Vector2> | Tween<Vector2> | None)?,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutoLocalize: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutomaticSize: (Enum.AutomaticSize | State<Enum.AutomaticSize> | Tween<Enum.AutomaticSize> | None)?,
	BackgroundColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	BackgroundTransparency: (number | State<number> | Tween<number> | None)?,
	BorderColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	BorderMode: (Enum.BorderMode | State<Enum.BorderMode> | Tween<Enum.BorderMode> | None)?,
	BorderSizePixel: (number | State<number> | Tween<number> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	ClipsDescendants: (boolean | State<boolean> | Tween<boolean> | None)?,
	InputSink: (Enum.InputSink | State<Enum.InputSink> | Tween<Enum.InputSink> | None)?,
	Interactable: (boolean | State<boolean> | Tween<boolean> | None)?,
	LayoutOrder: (number | State<number> | Tween<number> | None)?,
	Looped: (boolean | State<boolean> | Tween<boolean> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	NextSelectionDown: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionLeft: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionRight: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionUp: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	Playing: (boolean | State<boolean> | Tween<boolean> | None)?,
	Position: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	RollOffMaxDistance: (number | State<number> | Tween<number> | None)?,
	RollOffMinDistance: (number | State<number> | Tween<number> | None)?,
	RollOffMode: (Enum.RollOffMode | State<Enum.RollOffMode> | Tween<Enum.RollOffMode> | None)?,
	RootLocalizationTable: (LocalizationTable | State<LocalizationTable> | Tween<LocalizationTable> | None)?,
	Rotation: (number | State<number> | Tween<number> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	Selectable: (boolean | State<boolean> | Tween<boolean> | None)?,
	SelectionBehaviorDown: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorLeft: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorRight: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorUp: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionGroup: (boolean | State<boolean> | Tween<boolean> | None)?,
	SelectionImageObject: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	SelectionOrder: (number | State<number> | Tween<number> | None)?,
	Size: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	SizeConstraint: (Enum.SizeConstraint | State<Enum.SizeConstraint> | Tween<Enum.SizeConstraint> | None)?,
	TimePosition: (number | State<number> | Tween<number> | None)?,
	Video: (Content | State<Content> | Tween<Content> | None)?,
	VideoContent: (Content | State<Content> | Tween<Content> | None)?,
	Visible: (boolean | State<boolean> | Tween<boolean> | None)?,
	Volume: (number | State<number> | Tween<number> | None)?,
	ZIndex: (number | State<number> | Tween<number> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	DidLoop: (((video: string) -> ()) | State<(video: string) -> ()> | None)?,
	Ended: (((video: string) -> ()) | State<(video: string) -> ()> | None)?,
	InputBegan: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	InputChanged: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	InputEnded: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	Loaded: (((video: string) -> ()) | State<(video: string) -> ()> | None)?,
	MouseEnter: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseLeave: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseMoved: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseWheelBackward: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseWheelForward: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	Paused: (((video: string) -> ()) | State<(video: string) -> ()> | None)?,
	Played: (((video: string) -> ()) | State<(video: string) -> ()> | None)?,
	SelectionChanged: (((amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()) | State<(amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()> | None)?,
	SelectionGained: ((() -> ()) | State<() -> ()> | None)?,
	SelectionLost: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
	TouchLongPress: (((touchPositions: { any }, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, state: Enum.UserInputState) -> ()> | None)?,
	TouchPan: (((touchPositions: { any }, totalTranslation: Vector2, velocity: Vector2, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, totalTranslation: Vector2, velocity: Vector2, state: Enum.UserInputState) -> ()> | None)?,
	TouchPinch: (((touchPositions: { any }, scale: number, velocity: number, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, scale: number, velocity: number, state: Enum.UserInputState) -> ()> | None)?,
	TouchRotate: (((touchPositions: { any }, rotation: number, velocity: number, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, rotation: number, velocity: number, state: Enum.UserInputState) -> ()> | None)?,
	TouchSwipe: (((swipeDirection: Enum.SwipeDirection, numberOfTouches: number) -> ()) | State<(swipeDirection: Enum.SwipeDirection, numberOfTouches: number) -> ()> | None)?,
	TouchTap: (((touchPositions: { any }) -> ()) | State<(touchPositions: { any }) -> ()> | None)?,
}

export type ViewportFrameParam<E> = {
	[number]: E,
	Active: (boolean | State<boolean> | Tween<boolean> | None)?,
	Ambient: (Color3 | State<Color3> | Tween<Color3> | None)?,
	AnchorPoint: (Vector2 | State<Vector2> | Tween<Vector2> | None)?,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutoLocalize: (boolean | State<boolean> | Tween<boolean> | None)?,
	AutomaticSize: (Enum.AutomaticSize | State<Enum.AutomaticSize> | Tween<Enum.AutomaticSize> | None)?,
	BackgroundColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	BackgroundTransparency: (number | State<number> | Tween<number> | None)?,
	BorderColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	BorderMode: (Enum.BorderMode | State<Enum.BorderMode> | Tween<Enum.BorderMode> | None)?,
	BorderSizePixel: (number | State<number> | Tween<number> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	ClipsDescendants: (boolean | State<boolean> | Tween<boolean> | None)?,
	CurrentCamera: (Camera | State<Camera> | Tween<Camera> | None)?,
	ImageColor3: (Color3 | State<Color3> | Tween<Color3> | None)?,
	ImageTransparency: (number | State<number> | Tween<number> | None)?,
	InputSink: (Enum.InputSink | State<Enum.InputSink> | Tween<Enum.InputSink> | None)?,
	Interactable: (boolean | State<boolean> | Tween<boolean> | None)?,
	LayoutOrder: (number | State<number> | Tween<number> | None)?,
	LightColor: (Color3 | State<Color3> | Tween<Color3> | None)?,
	LightDirection: (Vector3 | State<Vector3> | Tween<Vector3> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	NextSelectionDown: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionLeft: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionRight: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	NextSelectionUp: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	Position: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	RootLocalizationTable: (LocalizationTable | State<LocalizationTable> | Tween<LocalizationTable> | None)?,
	Rotation: (number | State<number> | Tween<number> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	Selectable: (boolean | State<boolean> | Tween<boolean> | None)?,
	SelectionBehaviorDown: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorLeft: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorRight: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionBehaviorUp: (Enum.SelectionBehavior | State<Enum.SelectionBehavior> | Tween<Enum.SelectionBehavior> | None)?,
	SelectionGroup: (boolean | State<boolean> | Tween<boolean> | None)?,
	SelectionImageObject: (GuiObject | State<GuiObject> | Tween<GuiObject> | None)?,
	SelectionOrder: (number | State<number> | Tween<number> | None)?,
	Size: (UDim2 | State<UDim2> | Tween<UDim2> | None)?,
	SizeConstraint: (Enum.SizeConstraint | State<Enum.SizeConstraint> | Tween<Enum.SizeConstraint> | None)?,
	Visible: (boolean | State<boolean> | Tween<boolean> | None)?,
	ZIndex: (number | State<number> | Tween<number> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	InputBegan: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	InputChanged: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	InputEnded: (((input: InputObject) -> ()) | State<(input: InputObject) -> ()> | None)?,
	MouseEnter: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseLeave: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseMoved: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseWheelBackward: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	MouseWheelForward: (((x: number, y: number) -> ()) | State<(x: number, y: number) -> ()> | None)?,
	SelectionChanged: (((amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()) | State<(amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject) -> ()> | None)?,
	SelectionGained: ((() -> ()) | State<() -> ()> | None)?,
	SelectionLost: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
	TouchLongPress: (((touchPositions: { any }, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, state: Enum.UserInputState) -> ()> | None)?,
	TouchPan: (((touchPositions: { any }, totalTranslation: Vector2, velocity: Vector2, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, totalTranslation: Vector2, velocity: Vector2, state: Enum.UserInputState) -> ()> | None)?,
	TouchPinch: (((touchPositions: { any }, scale: number, velocity: number, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, scale: number, velocity: number, state: Enum.UserInputState) -> ()> | None)?,
	TouchRotate: (((touchPositions: { any }, rotation: number, velocity: number, state: Enum.UserInputState) -> ()) | State<(touchPositions: { any }, rotation: number, velocity: number, state: Enum.UserInputState) -> ()> | None)?,
	TouchSwipe: (((swipeDirection: Enum.SwipeDirection, numberOfTouches: number) -> ()) | State<(swipeDirection: Enum.SwipeDirection, numberOfTouches: number) -> ()> | None)?,
	TouchTap: (((touchPositions: { any }) -> ()) | State<(touchPositions: { any }) -> ()> | None)?,
}

export type WorldModelParam<E> = {
	[number]: E,
	Archivable: (boolean | State<boolean> | Tween<boolean> | None)?,
	Capabilities: (SecurityCapabilities | State<SecurityCapabilities> | Tween<SecurityCapabilities> | None)?,
	ModelStreamingMode: (Enum.ModelStreamingMode | State<Enum.ModelStreamingMode> | Tween<Enum.ModelStreamingMode> | None)?,
	Name: (string | State<string> | Tween<string> | None)?,
	PrimaryPart: (BasePart | State<BasePart> | Tween<BasePart> | None)?,
	Sandboxed: (boolean | State<boolean> | Tween<boolean> | None)?,
	UseWorkspaceCollisionGroups: (boolean | State<boolean> | Tween<boolean> | None)?,
	WorldPivot: (CFrame | State<CFrame> | Tween<CFrame> | None)?,
	AncestryChanged: (((child: Instance, parent: Instance) -> ()) | State<(child: Instance, parent: Instance) -> ()> | None)?,
	AttributeChanged: (((attribute: string) -> ()) | State<(attribute: string) -> ()> | None)?,
	Changed: (((property: string) -> ()) | State<(property: string) -> ()> | None)?,
	ChildAdded: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	ChildRemoved: (((child: Instance) -> ()) | State<(child: Instance) -> ()> | None)?,
	DescendantAdded: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	DescendantRemoving: (((descendant: Instance) -> ()) | State<(descendant: Instance) -> ()> | None)?,
	Destroying: ((() -> ()) | State<() -> ()> | None)?,
	StyledPropertiesChanged: ((() -> ()) | State<() -> ()> | None)?,
}

-- OnChange — PropTypes(D 스코프 전체 프로퍼티 이름 → 타입; 클래스 간 충돌은 any)
export type PropTypes = {
	ActivatedCursorIcon: Content,
	ActivatedCursorIconContent: Content,
	Active: boolean,
	Adornee: Instance,
	AlwaysOnTop: boolean,
	Ambient: Color3,
	AnchorPoint: Vector2,
	Animated: boolean,
	ApplyStrokeMode: Enum.ApplyStrokeMode,
	Archivable: boolean,
	AspectRatio: number,
	AspectType: Enum.AspectType,
	AutoButtonColor: boolean,
	AutoLocalize: boolean,
	AutomaticCanvasSize: Enum.AutomaticSize,
	AutomaticSize: Enum.AutomaticSize,
	BackgroundColor3: Color3,
	BackgroundTransparency: number,
	BlurRadius: UDim,
	BorderColor3: Color3,
	BorderMode: Enum.BorderMode,
	BorderOffset: UDim,
	BorderSizePixel: number,
	BorderStrokePosition: Enum.BorderStrokePosition,
	BottomImage: Content,
	BottomImageContent: Content,
	BottomLeftRadius: UDim,
	BottomRightRadius: UDim,
	BoundingBehavior: Enum.UIDragDetectorBoundingBehavior,
	BoundingUI: GuiBase2d,
	Brightness: number,
	CFrame: CFrame,
	CameraSubject: Instance,
	CameraType: Enum.CameraType,
	CanvasPosition: Vector2,
	CanvasSize: any,
	Capabilities: SecurityCapabilities,
	CellPadding: UDim2,
	CellSize: UDim2,
	Circular: boolean,
	ClearTextOnFocus: boolean,
	ClipToDeviceSafeArea: boolean,
	ClipsDescendants: boolean,
	Color: any,
	CornerRadius: UDim,
	CurrentCamera: Camera,
	CursorIcon: Content,
	CursorIconContent: Content,
	CursorPosition: number,
	DiagonalFieldOfView: number,
	DisplayOrder: number,
	DistanceStep: number,
	DominantAxis: Enum.DominantAxis,
	DragAxis: Vector2,
	DragRelativity: Enum.UIDragDetectorDragRelativity,
	DragRotation: number,
	DragSpace: Enum.UIDragDetectorDragSpace,
	DragStyle: Enum.UIDragDetectorDragStyle,
	DragUDim2: UDim2,
	EasingDirection: Enum.EasingDirection,
	EasingStyle: Enum.EasingStyle,
	ElasticBehavior: Enum.ElasticBehavior,
	Enabled: boolean,
	ExtentsOffset: Vector3,
	ExtentsOffsetWorldSpace: Vector3,
	Face: Enum.NormalId,
	FieldOfView: number,
	FieldOfViewMode: Enum.FieldOfViewMode,
	FillDirection: Enum.FillDirection,
	FillDirectionMaxCells: number,
	FillEmptySpaceColumns: boolean,
	FillEmptySpaceRows: boolean,
	FlexMode: Enum.UIFlexMode,
	Focus: CFrame,
	FontFace: Font,
	GamepadInputEnabled: boolean,
	GroupColor3: Color3,
	GroupTransparency: number,
	GrowRatio: number,
	HeadLocked: boolean,
	HeadScale: number,
	HorizontalAlignment: Enum.HorizontalAlignment,
	HorizontalFlex: Enum.UIFlexAlignment,
	HorizontalScrollBarInset: Enum.ScrollBarInset,
	HoverHapticEffect: HapticEffect,
	HoverImage: Content,
	HoverImageContent: Content,
	IgnoreGuiInset: boolean,
	Image: Content,
	ImageColor3: Color3,
	ImageContent: Content,
	ImageRectOffset: Vector2,
	ImageRectSize: Vector2,
	ImageTransparency: number,
	InputSink: Enum.InputSink,
	Inset: boolean,
	Interactable: boolean,
	ItemLineAlignment: Enum.ItemLineAlignment,
	LayoutOrder: number,
	LightColor: Color3,
	LightDirection: Vector3,
	LightInfluence: number,
	LineHeight: number,
	LineJoinMode: Enum.LineJoinMode,
	Looped: boolean,
	MajorAxis: Enum.TableMajorAxis,
	MaxAxisFieldOfView: number,
	MaxDistance: number,
	MaxDragAngle: number,
	MaxDragTranslation: UDim2,
	MaxSize: Vector2,
	MaxTextSize: number,
	MaxVisibleGraphemes: number,
	MidImage: Content,
	MidImageContent: Content,
	MinDragAngle: number,
	MinDragTranslation: UDim2,
	MinSize: Vector2,
	MinTextSize: number,
	Modal: boolean,
	ModelStreamingMode: Enum.ModelStreamingMode,
	MultiLine: boolean,
	Name: string,
	NextSelectionDown: GuiObject,
	NextSelectionLeft: GuiObject,
	NextSelectionRight: GuiObject,
	NextSelectionUp: GuiObject,
	Offset: any,
	OpenTypeFeatures: string,
	Padding: any,
	PaddingBottom: UDim,
	PaddingLeft: UDim,
	PaddingRight: UDim,
	PaddingTop: UDim,
	PixelsPerStud: number,
	PlaceholderColor3: Color3,
	PlaceholderText: string,
	PlayerToHideFrom: Instance,
	Playing: boolean,
	Position: UDim2,
	PressHapticEffect: HapticEffect,
	PressedImage: Content,
	PressedImageContent: Content,
	PrimaryPart: BasePart,
	ReferenceUIInstance: GuiObject,
	ResampleMode: Enum.ResamplerMode,
	ResetOnSpawn: boolean,
	ResponseStyle: Enum.UIDragDetectorResponseStyle,
	RichText: boolean,
	RollOffMaxDistance: number,
	RollOffMinDistance: number,
	RollOffMode: Enum.RollOffMode,
	RootLocalizationTable: LocalizationTable,
	Rotation: number,
	SafeAreaCompatibility: Enum.SafeAreaCompatibility,
	Sandboxed: boolean,
	Scale: number,
	ScaleType: Enum.ScaleType,
	ScreenInsets: Enum.ScreenInsets,
	ScrollBarImageColor3: Color3,
	ScrollBarImageTransparency: number,
	ScrollBarThickness: number,
	ScrollWheelInputEnabled: boolean,
	ScrollingDirection: Enum.ScrollingDirection,
	ScrollingEnabled: boolean,
	Selectable: boolean,
	Selected: boolean,
	SelectionBehaviorDown: Enum.SelectionBehavior,
	SelectionBehaviorLeft: Enum.SelectionBehavior,
	SelectionBehaviorRight: Enum.SelectionBehavior,
	SelectionBehaviorUp: Enum.SelectionBehavior,
	SelectionGroup: boolean,
	SelectionImageObject: GuiObject,
	SelectionModeDragSpeed: UDim2,
	SelectionModeRotateSpeed: number,
	SelectionOrder: number,
	SelectionStart: number,
	ShowBehindParent: boolean,
	ShowNativeInput: boolean,
	ShrinkRatio: number,
	Size: UDim2,
	SizeConstraint: Enum.SizeConstraint,
	SizeOffset: Vector2,
	SizingMode: Enum.SurfaceGuiSizingMode,
	SliceCenter: Rect,
	SliceScale: number,
	SortOrder: Enum.SortOrder,
	Spread: UDim2,
	StartCorner: Enum.StartCorner,
	StrokeSizingMode: Enum.StrokeSizingMode,
	StudsOffset: Vector3,
	StudsOffsetWorldSpace: Vector3,
	Style: any,
	Text: string,
	TextColor3: Color3,
	TextDirection: Enum.TextDirection,
	TextEditable: boolean,
	TextScaled: boolean,
	TextSize: number,
	TextStrokeColor3: Color3,
	TextStrokeTransparency: number,
	TextTransparency: number,
	TextTruncate: Enum.TextTruncate,
	TextWrapped: boolean,
	TextXAlignment: Enum.TextXAlignment,
	TextYAlignment: Enum.TextYAlignment,
	Thickness: number,
	TileMode: Enum.GradientTileMode,
	TileSize: UDim2,
	TimePosition: number,
	ToolPunchThroughDistance: number,
	TopImage: Content,
	TopImageContent: Content,
	TopLeftRadius: UDim,
	TopRightRadius: UDim,
	TouchInputEnabled: boolean,
	Transparency: any,
	TweenTime: number,
	Type: Enum.GradientType,
	UIDragSpeedAxisMapping: Enum.UIDragSpeedAxisMapping,
	UseWorkspaceCollisionGroups: boolean,
	VRTiltAndRollEnabled: boolean,
	VerticalAlignment: Enum.VerticalAlignment,
	VerticalFlex: Enum.UIFlexAlignment,
	VerticalScrollBarInset: Enum.ScrollBarInset,
	VerticalScrollBarPosition: Enum.VerticalScrollBarPosition,
	Video: Content,
	VideoContent: Content,
	Visible: boolean,
	Volume: number,
	WorldPivot: CFrame,
	Wraps: boolean,
	ZIndex: number,
	ZIndexBehavior: Enum.ZIndexBehavior,
	ZOffset: number,
}
export type OnChangeDescriptor<K> = { Name: K, Callback: (index<PropTypes, K>) -> () }
export type OnChangeFn = <K>(name: K & keyof<PropTypes>, fn: (index<PropTypes, K>) -> ()) -> OnChangeDescriptor<K>

export type BillboardGuiOnChange =
	{ Name: "Active", Callback: (boolean) -> () }
	| 	{ Name: "Adornee", Callback: (Instance) -> () }
	| 	{ Name: "AlwaysOnTop", Callback: (boolean) -> () }
	| 	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "AutoLocalize", Callback: (boolean) -> () }
	| 	{ Name: "Brightness", Callback: (number) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "ClipsDescendants", Callback: (boolean) -> () }
	| 	{ Name: "DistanceStep", Callback: (number) -> () }
	| 	{ Name: "Enabled", Callback: (boolean) -> () }
	| 	{ Name: "ExtentsOffset", Callback: (Vector3) -> () }
	| 	{ Name: "ExtentsOffsetWorldSpace", Callback: (Vector3) -> () }
	| 	{ Name: "LightInfluence", Callback: (number) -> () }
	| 	{ Name: "MaxDistance", Callback: (number) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "PlayerToHideFrom", Callback: (Instance) -> () }
	| 	{ Name: "ResetOnSpawn", Callback: (boolean) -> () }
	| 	{ Name: "RootLocalizationTable", Callback: (LocalizationTable) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "SelectionBehaviorDown", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorLeft", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorRight", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorUp", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionGroup", Callback: (boolean) -> () }
	| 	{ Name: "Size", Callback: (UDim2) -> () }
	| 	{ Name: "SizeOffset", Callback: (Vector2) -> () }
	| 	{ Name: "StudsOffset", Callback: (Vector3) -> () }
	| 	{ Name: "StudsOffsetWorldSpace", Callback: (Vector3) -> () }
	| 	{ Name: "ZIndexBehavior", Callback: (Enum.ZIndexBehavior) -> () }
export type BillboardGuiModifier = {
	read __quadModifier: "BillboardGui", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: BillboardGuiModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: BillboardGuiModifier, ...any) -> any,
	As: <T>(self: BillboardGuiModifier, name: string?) -> T, -- 무검사(11절)
	AsBillboardGui: (self: BillboardGuiModifier) -> BillboardGuiModifier, -- 항등(Into<BillboardGui> 구현)
	Active: (self: BillboardGuiModifier, value: Field<boolean | Tween<boolean>>) -> BillboardGuiModifier,
	Adornee: (self: BillboardGuiModifier, value: Field<Instance | Tween<Instance>>) -> BillboardGuiModifier,
	AlwaysOnTop: (self: BillboardGuiModifier, value: Field<boolean | Tween<boolean>>) -> BillboardGuiModifier,
	Archivable: (self: BillboardGuiModifier, value: Field<boolean | Tween<boolean>>) -> BillboardGuiModifier,
	AutoLocalize: (self: BillboardGuiModifier, value: Field<boolean | Tween<boolean>>) -> BillboardGuiModifier,
	Brightness: (self: BillboardGuiModifier, value: Field<number | Tween<number>>) -> BillboardGuiModifier,
	Capabilities: (self: BillboardGuiModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> BillboardGuiModifier,
	ClipsDescendants: (self: BillboardGuiModifier, value: Field<boolean | Tween<boolean>>) -> BillboardGuiModifier,
	DistanceStep: (self: BillboardGuiModifier, value: Field<number | Tween<number>>) -> BillboardGuiModifier,
	Enabled: (self: BillboardGuiModifier, value: Field<boolean | Tween<boolean>>) -> BillboardGuiModifier,
	ExtentsOffset: (self: BillboardGuiModifier, value: Field<Vector3 | Tween<Vector3>>) -> BillboardGuiModifier,
	ExtentsOffsetWorldSpace: (self: BillboardGuiModifier, value: Field<Vector3 | Tween<Vector3>>) -> BillboardGuiModifier,
	LightInfluence: (self: BillboardGuiModifier, value: Field<number | Tween<number>>) -> BillboardGuiModifier,
	MaxDistance: (self: BillboardGuiModifier, value: Field<number | Tween<number>>) -> BillboardGuiModifier,
	Name: (self: BillboardGuiModifier, value: Field<string | Tween<string>>) -> BillboardGuiModifier,
	PlayerToHideFrom: (self: BillboardGuiModifier, value: Field<Instance | Tween<Instance>>) -> BillboardGuiModifier,
	ResetOnSpawn: (self: BillboardGuiModifier, value: Field<boolean | Tween<boolean>>) -> BillboardGuiModifier,
	RootLocalizationTable: (self: BillboardGuiModifier, value: Field<LocalizationTable | Tween<LocalizationTable>>) -> BillboardGuiModifier,
	Sandboxed: (self: BillboardGuiModifier, value: Field<boolean | Tween<boolean>>) -> BillboardGuiModifier,
	SelectionBehaviorDown: (self: BillboardGuiModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> BillboardGuiModifier,
	SelectionBehaviorLeft: (self: BillboardGuiModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> BillboardGuiModifier,
	SelectionBehaviorRight: (self: BillboardGuiModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> BillboardGuiModifier,
	SelectionBehaviorUp: (self: BillboardGuiModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> BillboardGuiModifier,
	SelectionGroup: (self: BillboardGuiModifier, value: Field<boolean | Tween<boolean>>) -> BillboardGuiModifier,
	Size: (self: BillboardGuiModifier, value: Field<UDim2 | Tween<UDim2>>) -> BillboardGuiModifier,
	SizeOffset: (self: BillboardGuiModifier, value: Field<Vector2 | Tween<Vector2>>) -> BillboardGuiModifier,
	StudsOffset: (self: BillboardGuiModifier, value: Field<Vector3 | Tween<Vector3>>) -> BillboardGuiModifier,
	StudsOffsetWorldSpace: (self: BillboardGuiModifier, value: Field<Vector3 | Tween<Vector3>>) -> BillboardGuiModifier,
	ZIndexBehavior: (self: BillboardGuiModifier, value: Field<Enum.ZIndexBehavior | Tween<Enum.ZIndexBehavior>>) -> BillboardGuiModifier,
}
export type IntoBillboardGui = { AsBillboardGui: (self: any) -> BillboardGuiModifier }
export type BillboardGuiElem = NewChild | BillboardGuiOnChange | State<BillboardGuiOnChange> | { read __quadModifier: "BillboardGui" | "LayerCollector" | "GuiBase2d" | "GuiBase" | "Instance" }
export type BillboardGuiMapperElem = BillboardGuiElem | MapperDescriptor

export type CameraOnChange =
	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "CFrame", Callback: (CFrame) -> () }
	| 	{ Name: "CameraSubject", Callback: (Instance) -> () }
	| 	{ Name: "CameraType", Callback: (Enum.CameraType) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "DiagonalFieldOfView", Callback: (number) -> () }
	| 	{ Name: "FieldOfView", Callback: (number) -> () }
	| 	{ Name: "FieldOfViewMode", Callback: (Enum.FieldOfViewMode) -> () }
	| 	{ Name: "Focus", Callback: (CFrame) -> () }
	| 	{ Name: "HeadLocked", Callback: (boolean) -> () }
	| 	{ Name: "HeadScale", Callback: (number) -> () }
	| 	{ Name: "MaxAxisFieldOfView", Callback: (number) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "VRTiltAndRollEnabled", Callback: (boolean) -> () }
export type CameraModifier = {
	read __quadModifier: "Camera", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: CameraModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: CameraModifier, ...any) -> any,
	As: <T>(self: CameraModifier, name: string?) -> T, -- 무검사(11절)
	AsCamera: (self: CameraModifier) -> CameraModifier, -- 항등(Into<Camera> 구현)
	Archivable: (self: CameraModifier, value: Field<boolean | Tween<boolean>>) -> CameraModifier,
	CFrame: (self: CameraModifier, value: Field<CFrame | Tween<CFrame>>) -> CameraModifier,
	CameraSubject: (self: CameraModifier, value: Field<Instance | Tween<Instance>>) -> CameraModifier,
	CameraType: (self: CameraModifier, value: Field<Enum.CameraType | Tween<Enum.CameraType>>) -> CameraModifier,
	Capabilities: (self: CameraModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> CameraModifier,
	DiagonalFieldOfView: (self: CameraModifier, value: Field<number | Tween<number>>) -> CameraModifier,
	FieldOfView: (self: CameraModifier, value: Field<number | Tween<number>>) -> CameraModifier,
	FieldOfViewMode: (self: CameraModifier, value: Field<Enum.FieldOfViewMode | Tween<Enum.FieldOfViewMode>>) -> CameraModifier,
	Focus: (self: CameraModifier, value: Field<CFrame | Tween<CFrame>>) -> CameraModifier,
	HeadLocked: (self: CameraModifier, value: Field<boolean | Tween<boolean>>) -> CameraModifier,
	HeadScale: (self: CameraModifier, value: Field<number | Tween<number>>) -> CameraModifier,
	MaxAxisFieldOfView: (self: CameraModifier, value: Field<number | Tween<number>>) -> CameraModifier,
	Name: (self: CameraModifier, value: Field<string | Tween<string>>) -> CameraModifier,
	Sandboxed: (self: CameraModifier, value: Field<boolean | Tween<boolean>>) -> CameraModifier,
	VRTiltAndRollEnabled: (self: CameraModifier, value: Field<boolean | Tween<boolean>>) -> CameraModifier,
}
export type IntoCamera = { AsCamera: (self: any) -> CameraModifier }
export type CameraElem = NewChild | CameraOnChange | State<CameraOnChange> | { read __quadModifier: "Camera" | "PVInstance" | "Instance" }
export type CameraMapperElem = CameraElem | MapperDescriptor

export type CanvasGroupOnChange =
	{ Name: "Active", Callback: (boolean) -> () }
	| 	{ Name: "AnchorPoint", Callback: (Vector2) -> () }
	| 	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "AutoLocalize", Callback: (boolean) -> () }
	| 	{ Name: "AutomaticSize", Callback: (Enum.AutomaticSize) -> () }
	| 	{ Name: "BackgroundColor3", Callback: (Color3) -> () }
	| 	{ Name: "BackgroundTransparency", Callback: (number) -> () }
	| 	{ Name: "BorderColor3", Callback: (Color3) -> () }
	| 	{ Name: "BorderMode", Callback: (Enum.BorderMode) -> () }
	| 	{ Name: "BorderSizePixel", Callback: (number) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "ClipsDescendants", Callback: (boolean) -> () }
	| 	{ Name: "GroupColor3", Callback: (Color3) -> () }
	| 	{ Name: "GroupTransparency", Callback: (number) -> () }
	| 	{ Name: "InputSink", Callback: (Enum.InputSink) -> () }
	| 	{ Name: "Interactable", Callback: (boolean) -> () }
	| 	{ Name: "LayoutOrder", Callback: (number) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "NextSelectionDown", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionLeft", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionRight", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionUp", Callback: (GuiObject) -> () }
	| 	{ Name: "Position", Callback: (UDim2) -> () }
	| 	{ Name: "RootLocalizationTable", Callback: (LocalizationTable) -> () }
	| 	{ Name: "Rotation", Callback: (number) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "Selectable", Callback: (boolean) -> () }
	| 	{ Name: "SelectionBehaviorDown", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorLeft", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorRight", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorUp", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionGroup", Callback: (boolean) -> () }
	| 	{ Name: "SelectionImageObject", Callback: (GuiObject) -> () }
	| 	{ Name: "SelectionOrder", Callback: (number) -> () }
	| 	{ Name: "Size", Callback: (UDim2) -> () }
	| 	{ Name: "SizeConstraint", Callback: (Enum.SizeConstraint) -> () }
	| 	{ Name: "Visible", Callback: (boolean) -> () }
	| 	{ Name: "ZIndex", Callback: (number) -> () }
export type CanvasGroupModifier = {
	read __quadModifier: "CanvasGroup", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: CanvasGroupModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: CanvasGroupModifier, ...any) -> any,
	As: <T>(self: CanvasGroupModifier, name: string?) -> T, -- 무검사(11절)
	AsCanvasGroup: (self: CanvasGroupModifier) -> CanvasGroupModifier, -- 항등(Into<CanvasGroup> 구현)
	Active: (self: CanvasGroupModifier, value: Field<boolean | Tween<boolean>>) -> CanvasGroupModifier,
	AnchorPoint: (self: CanvasGroupModifier, value: Field<Vector2 | Tween<Vector2>>) -> CanvasGroupModifier,
	Archivable: (self: CanvasGroupModifier, value: Field<boolean | Tween<boolean>>) -> CanvasGroupModifier,
	AutoLocalize: (self: CanvasGroupModifier, value: Field<boolean | Tween<boolean>>) -> CanvasGroupModifier,
	AutomaticSize: (self: CanvasGroupModifier, value: Field<Enum.AutomaticSize | Tween<Enum.AutomaticSize>>) -> CanvasGroupModifier,
	BackgroundColor3: (self: CanvasGroupModifier, value: Field<Color3 | Tween<Color3>>) -> CanvasGroupModifier,
	BackgroundTransparency: (self: CanvasGroupModifier, value: Field<number | Tween<number>>) -> CanvasGroupModifier,
	BorderColor3: (self: CanvasGroupModifier, value: Field<Color3 | Tween<Color3>>) -> CanvasGroupModifier,
	BorderMode: (self: CanvasGroupModifier, value: Field<Enum.BorderMode | Tween<Enum.BorderMode>>) -> CanvasGroupModifier,
	BorderSizePixel: (self: CanvasGroupModifier, value: Field<number | Tween<number>>) -> CanvasGroupModifier,
	Capabilities: (self: CanvasGroupModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> CanvasGroupModifier,
	ClipsDescendants: (self: CanvasGroupModifier, value: Field<boolean | Tween<boolean>>) -> CanvasGroupModifier,
	GroupColor3: (self: CanvasGroupModifier, value: Field<Color3 | Tween<Color3>>) -> CanvasGroupModifier,
	GroupTransparency: (self: CanvasGroupModifier, value: Field<number | Tween<number>>) -> CanvasGroupModifier,
	InputSink: (self: CanvasGroupModifier, value: Field<Enum.InputSink | Tween<Enum.InputSink>>) -> CanvasGroupModifier,
	Interactable: (self: CanvasGroupModifier, value: Field<boolean | Tween<boolean>>) -> CanvasGroupModifier,
	LayoutOrder: (self: CanvasGroupModifier, value: Field<number | Tween<number>>) -> CanvasGroupModifier,
	Name: (self: CanvasGroupModifier, value: Field<string | Tween<string>>) -> CanvasGroupModifier,
	NextSelectionDown: (self: CanvasGroupModifier, value: Field<GuiObject | Tween<GuiObject>>) -> CanvasGroupModifier,
	NextSelectionLeft: (self: CanvasGroupModifier, value: Field<GuiObject | Tween<GuiObject>>) -> CanvasGroupModifier,
	NextSelectionRight: (self: CanvasGroupModifier, value: Field<GuiObject | Tween<GuiObject>>) -> CanvasGroupModifier,
	NextSelectionUp: (self: CanvasGroupModifier, value: Field<GuiObject | Tween<GuiObject>>) -> CanvasGroupModifier,
	Position: (self: CanvasGroupModifier, value: Field<UDim2 | Tween<UDim2>>) -> CanvasGroupModifier,
	RootLocalizationTable: (self: CanvasGroupModifier, value: Field<LocalizationTable | Tween<LocalizationTable>>) -> CanvasGroupModifier,
	Rotation: (self: CanvasGroupModifier, value: Field<number | Tween<number>>) -> CanvasGroupModifier,
	Sandboxed: (self: CanvasGroupModifier, value: Field<boolean | Tween<boolean>>) -> CanvasGroupModifier,
	Selectable: (self: CanvasGroupModifier, value: Field<boolean | Tween<boolean>>) -> CanvasGroupModifier,
	SelectionBehaviorDown: (self: CanvasGroupModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> CanvasGroupModifier,
	SelectionBehaviorLeft: (self: CanvasGroupModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> CanvasGroupModifier,
	SelectionBehaviorRight: (self: CanvasGroupModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> CanvasGroupModifier,
	SelectionBehaviorUp: (self: CanvasGroupModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> CanvasGroupModifier,
	SelectionGroup: (self: CanvasGroupModifier, value: Field<boolean | Tween<boolean>>) -> CanvasGroupModifier,
	SelectionImageObject: (self: CanvasGroupModifier, value: Field<GuiObject | Tween<GuiObject>>) -> CanvasGroupModifier,
	SelectionOrder: (self: CanvasGroupModifier, value: Field<number | Tween<number>>) -> CanvasGroupModifier,
	Size: (self: CanvasGroupModifier, value: Field<UDim2 | Tween<UDim2>>) -> CanvasGroupModifier,
	SizeConstraint: (self: CanvasGroupModifier, value: Field<Enum.SizeConstraint | Tween<Enum.SizeConstraint>>) -> CanvasGroupModifier,
	Visible: (self: CanvasGroupModifier, value: Field<boolean | Tween<boolean>>) -> CanvasGroupModifier,
	ZIndex: (self: CanvasGroupModifier, value: Field<number | Tween<number>>) -> CanvasGroupModifier,
}
export type IntoCanvasGroup = { AsCanvasGroup: (self: any) -> CanvasGroupModifier }
export type CanvasGroupElem = NewChild | CanvasGroupOnChange | State<CanvasGroupOnChange> | { read __quadModifier: "CanvasGroup" | "GuiObject" | "GuiBase2d" | "GuiBase" | "Instance" }
export type CanvasGroupMapperElem = CanvasGroupElem | MapperDescriptor

export type FolderOnChange =
	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
export type FolderModifier = {
	read __quadModifier: "Folder", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: FolderModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: FolderModifier, ...any) -> any,
	As: <T>(self: FolderModifier, name: string?) -> T, -- 무검사(11절)
	AsFolder: (self: FolderModifier) -> FolderModifier, -- 항등(Into<Folder> 구현)
	Archivable: (self: FolderModifier, value: Field<boolean | Tween<boolean>>) -> FolderModifier,
	Capabilities: (self: FolderModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> FolderModifier,
	Name: (self: FolderModifier, value: Field<string | Tween<string>>) -> FolderModifier,
	Sandboxed: (self: FolderModifier, value: Field<boolean | Tween<boolean>>) -> FolderModifier,
}
export type IntoFolder = { AsFolder: (self: any) -> FolderModifier }
export type FolderElem = NewChild | FolderOnChange | State<FolderOnChange> | { read __quadModifier: "Folder" | "Instance" }
export type FolderMapperElem = FolderElem | MapperDescriptor

export type FrameOnChange =
	{ Name: "Active", Callback: (boolean) -> () }
	| 	{ Name: "AnchorPoint", Callback: (Vector2) -> () }
	| 	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "AutoLocalize", Callback: (boolean) -> () }
	| 	{ Name: "AutomaticSize", Callback: (Enum.AutomaticSize) -> () }
	| 	{ Name: "BackgroundColor3", Callback: (Color3) -> () }
	| 	{ Name: "BackgroundTransparency", Callback: (number) -> () }
	| 	{ Name: "BorderColor3", Callback: (Color3) -> () }
	| 	{ Name: "BorderMode", Callback: (Enum.BorderMode) -> () }
	| 	{ Name: "BorderSizePixel", Callback: (number) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "ClipsDescendants", Callback: (boolean) -> () }
	| 	{ Name: "InputSink", Callback: (Enum.InputSink) -> () }
	| 	{ Name: "Interactable", Callback: (boolean) -> () }
	| 	{ Name: "LayoutOrder", Callback: (number) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "NextSelectionDown", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionLeft", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionRight", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionUp", Callback: (GuiObject) -> () }
	| 	{ Name: "Position", Callback: (UDim2) -> () }
	| 	{ Name: "RootLocalizationTable", Callback: (LocalizationTable) -> () }
	| 	{ Name: "Rotation", Callback: (number) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "Selectable", Callback: (boolean) -> () }
	| 	{ Name: "SelectionBehaviorDown", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorLeft", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorRight", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorUp", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionGroup", Callback: (boolean) -> () }
	| 	{ Name: "SelectionImageObject", Callback: (GuiObject) -> () }
	| 	{ Name: "SelectionOrder", Callback: (number) -> () }
	| 	{ Name: "Size", Callback: (UDim2) -> () }
	| 	{ Name: "SizeConstraint", Callback: (Enum.SizeConstraint) -> () }
	| 	{ Name: "Style", Callback: (Enum.FrameStyle) -> () }
	| 	{ Name: "Visible", Callback: (boolean) -> () }
	| 	{ Name: "ZIndex", Callback: (number) -> () }
export type FrameModifier = {
	read __quadModifier: "Frame", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: FrameModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: FrameModifier, ...any) -> any,
	As: <T>(self: FrameModifier, name: string?) -> T, -- 무검사(11절)
	AsFrame: (self: FrameModifier) -> FrameModifier, -- 항등(Into<Frame> 구현)
	Active: (self: FrameModifier, value: Field<boolean | Tween<boolean>>) -> FrameModifier,
	AnchorPoint: (self: FrameModifier, value: Field<Vector2 | Tween<Vector2>>) -> FrameModifier,
	Archivable: (self: FrameModifier, value: Field<boolean | Tween<boolean>>) -> FrameModifier,
	AutoLocalize: (self: FrameModifier, value: Field<boolean | Tween<boolean>>) -> FrameModifier,
	AutomaticSize: (self: FrameModifier, value: Field<Enum.AutomaticSize | Tween<Enum.AutomaticSize>>) -> FrameModifier,
	BackgroundColor3: (self: FrameModifier, value: Field<Color3 | Tween<Color3>>) -> FrameModifier,
	BackgroundTransparency: (self: FrameModifier, value: Field<number | Tween<number>>) -> FrameModifier,
	BorderColor3: (self: FrameModifier, value: Field<Color3 | Tween<Color3>>) -> FrameModifier,
	BorderMode: (self: FrameModifier, value: Field<Enum.BorderMode | Tween<Enum.BorderMode>>) -> FrameModifier,
	BorderSizePixel: (self: FrameModifier, value: Field<number | Tween<number>>) -> FrameModifier,
	Capabilities: (self: FrameModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> FrameModifier,
	ClipsDescendants: (self: FrameModifier, value: Field<boolean | Tween<boolean>>) -> FrameModifier,
	InputSink: (self: FrameModifier, value: Field<Enum.InputSink | Tween<Enum.InputSink>>) -> FrameModifier,
	Interactable: (self: FrameModifier, value: Field<boolean | Tween<boolean>>) -> FrameModifier,
	LayoutOrder: (self: FrameModifier, value: Field<number | Tween<number>>) -> FrameModifier,
	Name: (self: FrameModifier, value: Field<string | Tween<string>>) -> FrameModifier,
	NextSelectionDown: (self: FrameModifier, value: Field<GuiObject | Tween<GuiObject>>) -> FrameModifier,
	NextSelectionLeft: (self: FrameModifier, value: Field<GuiObject | Tween<GuiObject>>) -> FrameModifier,
	NextSelectionRight: (self: FrameModifier, value: Field<GuiObject | Tween<GuiObject>>) -> FrameModifier,
	NextSelectionUp: (self: FrameModifier, value: Field<GuiObject | Tween<GuiObject>>) -> FrameModifier,
	Position: (self: FrameModifier, value: Field<UDim2 | Tween<UDim2>>) -> FrameModifier,
	RootLocalizationTable: (self: FrameModifier, value: Field<LocalizationTable | Tween<LocalizationTable>>) -> FrameModifier,
	Rotation: (self: FrameModifier, value: Field<number | Tween<number>>) -> FrameModifier,
	Sandboxed: (self: FrameModifier, value: Field<boolean | Tween<boolean>>) -> FrameModifier,
	Selectable: (self: FrameModifier, value: Field<boolean | Tween<boolean>>) -> FrameModifier,
	SelectionBehaviorDown: (self: FrameModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> FrameModifier,
	SelectionBehaviorLeft: (self: FrameModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> FrameModifier,
	SelectionBehaviorRight: (self: FrameModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> FrameModifier,
	SelectionBehaviorUp: (self: FrameModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> FrameModifier,
	SelectionGroup: (self: FrameModifier, value: Field<boolean | Tween<boolean>>) -> FrameModifier,
	SelectionImageObject: (self: FrameModifier, value: Field<GuiObject | Tween<GuiObject>>) -> FrameModifier,
	SelectionOrder: (self: FrameModifier, value: Field<number | Tween<number>>) -> FrameModifier,
	Size: (self: FrameModifier, value: Field<UDim2 | Tween<UDim2>>) -> FrameModifier,
	SizeConstraint: (self: FrameModifier, value: Field<Enum.SizeConstraint | Tween<Enum.SizeConstraint>>) -> FrameModifier,
	Style: (self: FrameModifier, value: Field<Enum.FrameStyle | Tween<Enum.FrameStyle>>) -> FrameModifier,
	Visible: (self: FrameModifier, value: Field<boolean | Tween<boolean>>) -> FrameModifier,
	ZIndex: (self: FrameModifier, value: Field<number | Tween<number>>) -> FrameModifier,
}
export type IntoFrame = { AsFrame: (self: any) -> FrameModifier }
export type FrameElem = NewChild | FrameOnChange | State<FrameOnChange> | { read __quadModifier: "Frame" | "GuiObject" | "GuiBase2d" | "GuiBase" | "Instance" }
export type FrameMapperElem = FrameElem | MapperDescriptor

export type GuiBaseModifier = {
	read __quadModifier: "GuiBase", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: GuiBaseModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: GuiBaseModifier, ...any) -> any,
	As: <T>(self: GuiBaseModifier, name: string?) -> T, -- 무검사(11절)
	AsGuiBase: (self: GuiBaseModifier) -> GuiBaseModifier, -- 항등(Into<GuiBase> 구현)
	AsBillboardGui: (self: GuiBaseModifier) -> BillboardGuiModifier,
	AsCanvasGroup: (self: GuiBaseModifier) -> CanvasGroupModifier,
	AsFrame: (self: GuiBaseModifier) -> FrameModifier,
	AsGuiBase2d: (self: GuiBaseModifier) -> GuiBase2dModifier,
	AsGuiButton: (self: GuiBaseModifier) -> GuiButtonModifier,
	AsGuiLabel: (self: GuiBaseModifier) -> GuiLabelModifier,
	AsGuiObject: (self: GuiBaseModifier) -> GuiObjectModifier,
	AsImageButton: (self: GuiBaseModifier) -> ImageButtonModifier,
	AsImageLabel: (self: GuiBaseModifier) -> ImageLabelModifier,
	AsLayerCollector: (self: GuiBaseModifier) -> LayerCollectorModifier,
	AsScreenGui: (self: GuiBaseModifier) -> ScreenGuiModifier,
	AsScrollingFrame: (self: GuiBaseModifier) -> ScrollingFrameModifier,
	AsSurfaceGui: (self: GuiBaseModifier) -> SurfaceGuiModifier,
	AsSurfaceGuiBase: (self: GuiBaseModifier) -> SurfaceGuiBaseModifier,
	AsTextBox: (self: GuiBaseModifier) -> TextBoxModifier,
	AsTextButton: (self: GuiBaseModifier) -> TextButtonModifier,
	AsTextLabel: (self: GuiBaseModifier) -> TextLabelModifier,
	AsVideoFrame: (self: GuiBaseModifier) -> VideoFrameModifier,
	AsViewportFrame: (self: GuiBaseModifier) -> ViewportFrameModifier,
	Archivable: (self: GuiBaseModifier, value: Field<boolean | Tween<boolean>>) -> GuiBaseModifier,
	Capabilities: (self: GuiBaseModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> GuiBaseModifier,
	Name: (self: GuiBaseModifier, value: Field<string | Tween<string>>) -> GuiBaseModifier,
	Sandboxed: (self: GuiBaseModifier, value: Field<boolean | Tween<boolean>>) -> GuiBaseModifier,
}
export type IntoGuiBase = { AsGuiBase: (self: any) -> GuiBaseModifier }

export type GuiBase2dModifier = {
	read __quadModifier: "GuiBase2d", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: GuiBase2dModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: GuiBase2dModifier, ...any) -> any,
	As: <T>(self: GuiBase2dModifier, name: string?) -> T, -- 무검사(11절)
	AsGuiBase2d: (self: GuiBase2dModifier) -> GuiBase2dModifier, -- 항등(Into<GuiBase2d> 구현)
	AsBillboardGui: (self: GuiBase2dModifier) -> BillboardGuiModifier,
	AsCanvasGroup: (self: GuiBase2dModifier) -> CanvasGroupModifier,
	AsFrame: (self: GuiBase2dModifier) -> FrameModifier,
	AsGuiButton: (self: GuiBase2dModifier) -> GuiButtonModifier,
	AsGuiLabel: (self: GuiBase2dModifier) -> GuiLabelModifier,
	AsGuiObject: (self: GuiBase2dModifier) -> GuiObjectModifier,
	AsImageButton: (self: GuiBase2dModifier) -> ImageButtonModifier,
	AsImageLabel: (self: GuiBase2dModifier) -> ImageLabelModifier,
	AsLayerCollector: (self: GuiBase2dModifier) -> LayerCollectorModifier,
	AsScreenGui: (self: GuiBase2dModifier) -> ScreenGuiModifier,
	AsScrollingFrame: (self: GuiBase2dModifier) -> ScrollingFrameModifier,
	AsSurfaceGui: (self: GuiBase2dModifier) -> SurfaceGuiModifier,
	AsSurfaceGuiBase: (self: GuiBase2dModifier) -> SurfaceGuiBaseModifier,
	AsTextBox: (self: GuiBase2dModifier) -> TextBoxModifier,
	AsTextButton: (self: GuiBase2dModifier) -> TextButtonModifier,
	AsTextLabel: (self: GuiBase2dModifier) -> TextLabelModifier,
	AsVideoFrame: (self: GuiBase2dModifier) -> VideoFrameModifier,
	AsViewportFrame: (self: GuiBase2dModifier) -> ViewportFrameModifier,
	Archivable: (self: GuiBase2dModifier, value: Field<boolean | Tween<boolean>>) -> GuiBase2dModifier,
	AutoLocalize: (self: GuiBase2dModifier, value: Field<boolean | Tween<boolean>>) -> GuiBase2dModifier,
	Capabilities: (self: GuiBase2dModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> GuiBase2dModifier,
	Name: (self: GuiBase2dModifier, value: Field<string | Tween<string>>) -> GuiBase2dModifier,
	RootLocalizationTable: (self: GuiBase2dModifier, value: Field<LocalizationTable | Tween<LocalizationTable>>) -> GuiBase2dModifier,
	Sandboxed: (self: GuiBase2dModifier, value: Field<boolean | Tween<boolean>>) -> GuiBase2dModifier,
	SelectionBehaviorDown: (self: GuiBase2dModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> GuiBase2dModifier,
	SelectionBehaviorLeft: (self: GuiBase2dModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> GuiBase2dModifier,
	SelectionBehaviorRight: (self: GuiBase2dModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> GuiBase2dModifier,
	SelectionBehaviorUp: (self: GuiBase2dModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> GuiBase2dModifier,
	SelectionGroup: (self: GuiBase2dModifier, value: Field<boolean | Tween<boolean>>) -> GuiBase2dModifier,
}
export type IntoGuiBase2d = { AsGuiBase2d: (self: any) -> GuiBase2dModifier }

export type GuiButtonModifier = {
	read __quadModifier: "GuiButton", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: GuiButtonModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: GuiButtonModifier, ...any) -> any,
	As: <T>(self: GuiButtonModifier, name: string?) -> T, -- 무검사(11절)
	AsGuiButton: (self: GuiButtonModifier) -> GuiButtonModifier, -- 항등(Into<GuiButton> 구현)
	AsImageButton: (self: GuiButtonModifier) -> ImageButtonModifier,
	AsTextButton: (self: GuiButtonModifier) -> TextButtonModifier,
	Active: (self: GuiButtonModifier, value: Field<boolean | Tween<boolean>>) -> GuiButtonModifier,
	AnchorPoint: (self: GuiButtonModifier, value: Field<Vector2 | Tween<Vector2>>) -> GuiButtonModifier,
	Archivable: (self: GuiButtonModifier, value: Field<boolean | Tween<boolean>>) -> GuiButtonModifier,
	AutoButtonColor: (self: GuiButtonModifier, value: Field<boolean | Tween<boolean>>) -> GuiButtonModifier,
	AutoLocalize: (self: GuiButtonModifier, value: Field<boolean | Tween<boolean>>) -> GuiButtonModifier,
	AutomaticSize: (self: GuiButtonModifier, value: Field<Enum.AutomaticSize | Tween<Enum.AutomaticSize>>) -> GuiButtonModifier,
	BackgroundColor3: (self: GuiButtonModifier, value: Field<Color3 | Tween<Color3>>) -> GuiButtonModifier,
	BackgroundTransparency: (self: GuiButtonModifier, value: Field<number | Tween<number>>) -> GuiButtonModifier,
	BorderColor3: (self: GuiButtonModifier, value: Field<Color3 | Tween<Color3>>) -> GuiButtonModifier,
	BorderMode: (self: GuiButtonModifier, value: Field<Enum.BorderMode | Tween<Enum.BorderMode>>) -> GuiButtonModifier,
	BorderSizePixel: (self: GuiButtonModifier, value: Field<number | Tween<number>>) -> GuiButtonModifier,
	Capabilities: (self: GuiButtonModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> GuiButtonModifier,
	ClipsDescendants: (self: GuiButtonModifier, value: Field<boolean | Tween<boolean>>) -> GuiButtonModifier,
	HoverHapticEffect: (self: GuiButtonModifier, value: Field<HapticEffect | Tween<HapticEffect>>) -> GuiButtonModifier,
	InputSink: (self: GuiButtonModifier, value: Field<Enum.InputSink | Tween<Enum.InputSink>>) -> GuiButtonModifier,
	Interactable: (self: GuiButtonModifier, value: Field<boolean | Tween<boolean>>) -> GuiButtonModifier,
	LayoutOrder: (self: GuiButtonModifier, value: Field<number | Tween<number>>) -> GuiButtonModifier,
	Modal: (self: GuiButtonModifier, value: Field<boolean | Tween<boolean>>) -> GuiButtonModifier,
	Name: (self: GuiButtonModifier, value: Field<string | Tween<string>>) -> GuiButtonModifier,
	NextSelectionDown: (self: GuiButtonModifier, value: Field<GuiObject | Tween<GuiObject>>) -> GuiButtonModifier,
	NextSelectionLeft: (self: GuiButtonModifier, value: Field<GuiObject | Tween<GuiObject>>) -> GuiButtonModifier,
	NextSelectionRight: (self: GuiButtonModifier, value: Field<GuiObject | Tween<GuiObject>>) -> GuiButtonModifier,
	NextSelectionUp: (self: GuiButtonModifier, value: Field<GuiObject | Tween<GuiObject>>) -> GuiButtonModifier,
	Position: (self: GuiButtonModifier, value: Field<UDim2 | Tween<UDim2>>) -> GuiButtonModifier,
	PressHapticEffect: (self: GuiButtonModifier, value: Field<HapticEffect | Tween<HapticEffect>>) -> GuiButtonModifier,
	RootLocalizationTable: (self: GuiButtonModifier, value: Field<LocalizationTable | Tween<LocalizationTable>>) -> GuiButtonModifier,
	Rotation: (self: GuiButtonModifier, value: Field<number | Tween<number>>) -> GuiButtonModifier,
	Sandboxed: (self: GuiButtonModifier, value: Field<boolean | Tween<boolean>>) -> GuiButtonModifier,
	Selectable: (self: GuiButtonModifier, value: Field<boolean | Tween<boolean>>) -> GuiButtonModifier,
	Selected: (self: GuiButtonModifier, value: Field<boolean | Tween<boolean>>) -> GuiButtonModifier,
	SelectionBehaviorDown: (self: GuiButtonModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> GuiButtonModifier,
	SelectionBehaviorLeft: (self: GuiButtonModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> GuiButtonModifier,
	SelectionBehaviorRight: (self: GuiButtonModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> GuiButtonModifier,
	SelectionBehaviorUp: (self: GuiButtonModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> GuiButtonModifier,
	SelectionGroup: (self: GuiButtonModifier, value: Field<boolean | Tween<boolean>>) -> GuiButtonModifier,
	SelectionImageObject: (self: GuiButtonModifier, value: Field<GuiObject | Tween<GuiObject>>) -> GuiButtonModifier,
	SelectionOrder: (self: GuiButtonModifier, value: Field<number | Tween<number>>) -> GuiButtonModifier,
	Size: (self: GuiButtonModifier, value: Field<UDim2 | Tween<UDim2>>) -> GuiButtonModifier,
	SizeConstraint: (self: GuiButtonModifier, value: Field<Enum.SizeConstraint | Tween<Enum.SizeConstraint>>) -> GuiButtonModifier,
	Style: (self: GuiButtonModifier, value: Field<Enum.ButtonStyle | Tween<Enum.ButtonStyle>>) -> GuiButtonModifier,
	Visible: (self: GuiButtonModifier, value: Field<boolean | Tween<boolean>>) -> GuiButtonModifier,
	ZIndex: (self: GuiButtonModifier, value: Field<number | Tween<number>>) -> GuiButtonModifier,
}
export type IntoGuiButton = { AsGuiButton: (self: any) -> GuiButtonModifier }

export type GuiLabelModifier = {
	read __quadModifier: "GuiLabel", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: GuiLabelModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: GuiLabelModifier, ...any) -> any,
	As: <T>(self: GuiLabelModifier, name: string?) -> T, -- 무검사(11절)
	AsGuiLabel: (self: GuiLabelModifier) -> GuiLabelModifier, -- 항등(Into<GuiLabel> 구현)
	AsImageLabel: (self: GuiLabelModifier) -> ImageLabelModifier,
	AsTextLabel: (self: GuiLabelModifier) -> TextLabelModifier,
	Active: (self: GuiLabelModifier, value: Field<boolean | Tween<boolean>>) -> GuiLabelModifier,
	AnchorPoint: (self: GuiLabelModifier, value: Field<Vector2 | Tween<Vector2>>) -> GuiLabelModifier,
	Archivable: (self: GuiLabelModifier, value: Field<boolean | Tween<boolean>>) -> GuiLabelModifier,
	AutoLocalize: (self: GuiLabelModifier, value: Field<boolean | Tween<boolean>>) -> GuiLabelModifier,
	AutomaticSize: (self: GuiLabelModifier, value: Field<Enum.AutomaticSize | Tween<Enum.AutomaticSize>>) -> GuiLabelModifier,
	BackgroundColor3: (self: GuiLabelModifier, value: Field<Color3 | Tween<Color3>>) -> GuiLabelModifier,
	BackgroundTransparency: (self: GuiLabelModifier, value: Field<number | Tween<number>>) -> GuiLabelModifier,
	BorderColor3: (self: GuiLabelModifier, value: Field<Color3 | Tween<Color3>>) -> GuiLabelModifier,
	BorderMode: (self: GuiLabelModifier, value: Field<Enum.BorderMode | Tween<Enum.BorderMode>>) -> GuiLabelModifier,
	BorderSizePixel: (self: GuiLabelModifier, value: Field<number | Tween<number>>) -> GuiLabelModifier,
	Capabilities: (self: GuiLabelModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> GuiLabelModifier,
	ClipsDescendants: (self: GuiLabelModifier, value: Field<boolean | Tween<boolean>>) -> GuiLabelModifier,
	InputSink: (self: GuiLabelModifier, value: Field<Enum.InputSink | Tween<Enum.InputSink>>) -> GuiLabelModifier,
	Interactable: (self: GuiLabelModifier, value: Field<boolean | Tween<boolean>>) -> GuiLabelModifier,
	LayoutOrder: (self: GuiLabelModifier, value: Field<number | Tween<number>>) -> GuiLabelModifier,
	Name: (self: GuiLabelModifier, value: Field<string | Tween<string>>) -> GuiLabelModifier,
	NextSelectionDown: (self: GuiLabelModifier, value: Field<GuiObject | Tween<GuiObject>>) -> GuiLabelModifier,
	NextSelectionLeft: (self: GuiLabelModifier, value: Field<GuiObject | Tween<GuiObject>>) -> GuiLabelModifier,
	NextSelectionRight: (self: GuiLabelModifier, value: Field<GuiObject | Tween<GuiObject>>) -> GuiLabelModifier,
	NextSelectionUp: (self: GuiLabelModifier, value: Field<GuiObject | Tween<GuiObject>>) -> GuiLabelModifier,
	Position: (self: GuiLabelModifier, value: Field<UDim2 | Tween<UDim2>>) -> GuiLabelModifier,
	RootLocalizationTable: (self: GuiLabelModifier, value: Field<LocalizationTable | Tween<LocalizationTable>>) -> GuiLabelModifier,
	Rotation: (self: GuiLabelModifier, value: Field<number | Tween<number>>) -> GuiLabelModifier,
	Sandboxed: (self: GuiLabelModifier, value: Field<boolean | Tween<boolean>>) -> GuiLabelModifier,
	Selectable: (self: GuiLabelModifier, value: Field<boolean | Tween<boolean>>) -> GuiLabelModifier,
	SelectionBehaviorDown: (self: GuiLabelModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> GuiLabelModifier,
	SelectionBehaviorLeft: (self: GuiLabelModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> GuiLabelModifier,
	SelectionBehaviorRight: (self: GuiLabelModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> GuiLabelModifier,
	SelectionBehaviorUp: (self: GuiLabelModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> GuiLabelModifier,
	SelectionGroup: (self: GuiLabelModifier, value: Field<boolean | Tween<boolean>>) -> GuiLabelModifier,
	SelectionImageObject: (self: GuiLabelModifier, value: Field<GuiObject | Tween<GuiObject>>) -> GuiLabelModifier,
	SelectionOrder: (self: GuiLabelModifier, value: Field<number | Tween<number>>) -> GuiLabelModifier,
	Size: (self: GuiLabelModifier, value: Field<UDim2 | Tween<UDim2>>) -> GuiLabelModifier,
	SizeConstraint: (self: GuiLabelModifier, value: Field<Enum.SizeConstraint | Tween<Enum.SizeConstraint>>) -> GuiLabelModifier,
	Visible: (self: GuiLabelModifier, value: Field<boolean | Tween<boolean>>) -> GuiLabelModifier,
	ZIndex: (self: GuiLabelModifier, value: Field<number | Tween<number>>) -> GuiLabelModifier,
}
export type IntoGuiLabel = { AsGuiLabel: (self: any) -> GuiLabelModifier }

export type GuiObjectModifier = {
	read __quadModifier: "GuiObject", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: GuiObjectModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: GuiObjectModifier, ...any) -> any,
	As: <T>(self: GuiObjectModifier, name: string?) -> T, -- 무검사(11절)
	AsGuiObject: (self: GuiObjectModifier) -> GuiObjectModifier, -- 항등(Into<GuiObject> 구현)
	AsCanvasGroup: (self: GuiObjectModifier) -> CanvasGroupModifier,
	AsFrame: (self: GuiObjectModifier) -> FrameModifier,
	AsGuiButton: (self: GuiObjectModifier) -> GuiButtonModifier,
	AsGuiLabel: (self: GuiObjectModifier) -> GuiLabelModifier,
	AsImageButton: (self: GuiObjectModifier) -> ImageButtonModifier,
	AsImageLabel: (self: GuiObjectModifier) -> ImageLabelModifier,
	AsScrollingFrame: (self: GuiObjectModifier) -> ScrollingFrameModifier,
	AsTextBox: (self: GuiObjectModifier) -> TextBoxModifier,
	AsTextButton: (self: GuiObjectModifier) -> TextButtonModifier,
	AsTextLabel: (self: GuiObjectModifier) -> TextLabelModifier,
	AsVideoFrame: (self: GuiObjectModifier) -> VideoFrameModifier,
	AsViewportFrame: (self: GuiObjectModifier) -> ViewportFrameModifier,
	Active: (self: GuiObjectModifier, value: Field<boolean | Tween<boolean>>) -> GuiObjectModifier,
	AnchorPoint: (self: GuiObjectModifier, value: Field<Vector2 | Tween<Vector2>>) -> GuiObjectModifier,
	Archivable: (self: GuiObjectModifier, value: Field<boolean | Tween<boolean>>) -> GuiObjectModifier,
	AutoLocalize: (self: GuiObjectModifier, value: Field<boolean | Tween<boolean>>) -> GuiObjectModifier,
	AutomaticSize: (self: GuiObjectModifier, value: Field<Enum.AutomaticSize | Tween<Enum.AutomaticSize>>) -> GuiObjectModifier,
	BackgroundColor3: (self: GuiObjectModifier, value: Field<Color3 | Tween<Color3>>) -> GuiObjectModifier,
	BackgroundTransparency: (self: GuiObjectModifier, value: Field<number | Tween<number>>) -> GuiObjectModifier,
	BorderColor3: (self: GuiObjectModifier, value: Field<Color3 | Tween<Color3>>) -> GuiObjectModifier,
	BorderMode: (self: GuiObjectModifier, value: Field<Enum.BorderMode | Tween<Enum.BorderMode>>) -> GuiObjectModifier,
	BorderSizePixel: (self: GuiObjectModifier, value: Field<number | Tween<number>>) -> GuiObjectModifier,
	Capabilities: (self: GuiObjectModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> GuiObjectModifier,
	ClipsDescendants: (self: GuiObjectModifier, value: Field<boolean | Tween<boolean>>) -> GuiObjectModifier,
	InputSink: (self: GuiObjectModifier, value: Field<Enum.InputSink | Tween<Enum.InputSink>>) -> GuiObjectModifier,
	Interactable: (self: GuiObjectModifier, value: Field<boolean | Tween<boolean>>) -> GuiObjectModifier,
	LayoutOrder: (self: GuiObjectModifier, value: Field<number | Tween<number>>) -> GuiObjectModifier,
	Name: (self: GuiObjectModifier, value: Field<string | Tween<string>>) -> GuiObjectModifier,
	NextSelectionDown: (self: GuiObjectModifier, value: Field<GuiObject | Tween<GuiObject>>) -> GuiObjectModifier,
	NextSelectionLeft: (self: GuiObjectModifier, value: Field<GuiObject | Tween<GuiObject>>) -> GuiObjectModifier,
	NextSelectionRight: (self: GuiObjectModifier, value: Field<GuiObject | Tween<GuiObject>>) -> GuiObjectModifier,
	NextSelectionUp: (self: GuiObjectModifier, value: Field<GuiObject | Tween<GuiObject>>) -> GuiObjectModifier,
	Position: (self: GuiObjectModifier, value: Field<UDim2 | Tween<UDim2>>) -> GuiObjectModifier,
	RootLocalizationTable: (self: GuiObjectModifier, value: Field<LocalizationTable | Tween<LocalizationTable>>) -> GuiObjectModifier,
	Rotation: (self: GuiObjectModifier, value: Field<number | Tween<number>>) -> GuiObjectModifier,
	Sandboxed: (self: GuiObjectModifier, value: Field<boolean | Tween<boolean>>) -> GuiObjectModifier,
	Selectable: (self: GuiObjectModifier, value: Field<boolean | Tween<boolean>>) -> GuiObjectModifier,
	SelectionBehaviorDown: (self: GuiObjectModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> GuiObjectModifier,
	SelectionBehaviorLeft: (self: GuiObjectModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> GuiObjectModifier,
	SelectionBehaviorRight: (self: GuiObjectModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> GuiObjectModifier,
	SelectionBehaviorUp: (self: GuiObjectModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> GuiObjectModifier,
	SelectionGroup: (self: GuiObjectModifier, value: Field<boolean | Tween<boolean>>) -> GuiObjectModifier,
	SelectionImageObject: (self: GuiObjectModifier, value: Field<GuiObject | Tween<GuiObject>>) -> GuiObjectModifier,
	SelectionOrder: (self: GuiObjectModifier, value: Field<number | Tween<number>>) -> GuiObjectModifier,
	Size: (self: GuiObjectModifier, value: Field<UDim2 | Tween<UDim2>>) -> GuiObjectModifier,
	SizeConstraint: (self: GuiObjectModifier, value: Field<Enum.SizeConstraint | Tween<Enum.SizeConstraint>>) -> GuiObjectModifier,
	Visible: (self: GuiObjectModifier, value: Field<boolean | Tween<boolean>>) -> GuiObjectModifier,
	ZIndex: (self: GuiObjectModifier, value: Field<number | Tween<number>>) -> GuiObjectModifier,
}
export type IntoGuiObject = { AsGuiObject: (self: any) -> GuiObjectModifier }

export type ImageButtonOnChange =
	{ Name: "Active", Callback: (boolean) -> () }
	| 	{ Name: "AnchorPoint", Callback: (Vector2) -> () }
	| 	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "AutoButtonColor", Callback: (boolean) -> () }
	| 	{ Name: "AutoLocalize", Callback: (boolean) -> () }
	| 	{ Name: "AutomaticSize", Callback: (Enum.AutomaticSize) -> () }
	| 	{ Name: "BackgroundColor3", Callback: (Color3) -> () }
	| 	{ Name: "BackgroundTransparency", Callback: (number) -> () }
	| 	{ Name: "BorderColor3", Callback: (Color3) -> () }
	| 	{ Name: "BorderMode", Callback: (Enum.BorderMode) -> () }
	| 	{ Name: "BorderSizePixel", Callback: (number) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "ClipsDescendants", Callback: (boolean) -> () }
	| 	{ Name: "HoverHapticEffect", Callback: (HapticEffect) -> () }
	| 	{ Name: "HoverImage", Callback: (Content) -> () }
	| 	{ Name: "HoverImageContent", Callback: (Content) -> () }
	| 	{ Name: "Image", Callback: (Content) -> () }
	| 	{ Name: "ImageColor3", Callback: (Color3) -> () }
	| 	{ Name: "ImageContent", Callback: (Content) -> () }
	| 	{ Name: "ImageRectOffset", Callback: (Vector2) -> () }
	| 	{ Name: "ImageRectSize", Callback: (Vector2) -> () }
	| 	{ Name: "ImageTransparency", Callback: (number) -> () }
	| 	{ Name: "InputSink", Callback: (Enum.InputSink) -> () }
	| 	{ Name: "Interactable", Callback: (boolean) -> () }
	| 	{ Name: "LayoutOrder", Callback: (number) -> () }
	| 	{ Name: "Modal", Callback: (boolean) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "NextSelectionDown", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionLeft", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionRight", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionUp", Callback: (GuiObject) -> () }
	| 	{ Name: "Position", Callback: (UDim2) -> () }
	| 	{ Name: "PressHapticEffect", Callback: (HapticEffect) -> () }
	| 	{ Name: "PressedImage", Callback: (Content) -> () }
	| 	{ Name: "PressedImageContent", Callback: (Content) -> () }
	| 	{ Name: "ResampleMode", Callback: (Enum.ResamplerMode) -> () }
	| 	{ Name: "RootLocalizationTable", Callback: (LocalizationTable) -> () }
	| 	{ Name: "Rotation", Callback: (number) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "ScaleType", Callback: (Enum.ScaleType) -> () }
	| 	{ Name: "Selectable", Callback: (boolean) -> () }
	| 	{ Name: "Selected", Callback: (boolean) -> () }
	| 	{ Name: "SelectionBehaviorDown", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorLeft", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorRight", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorUp", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionGroup", Callback: (boolean) -> () }
	| 	{ Name: "SelectionImageObject", Callback: (GuiObject) -> () }
	| 	{ Name: "SelectionOrder", Callback: (number) -> () }
	| 	{ Name: "Size", Callback: (UDim2) -> () }
	| 	{ Name: "SizeConstraint", Callback: (Enum.SizeConstraint) -> () }
	| 	{ Name: "SliceCenter", Callback: (Rect) -> () }
	| 	{ Name: "SliceScale", Callback: (number) -> () }
	| 	{ Name: "Style", Callback: (Enum.ButtonStyle) -> () }
	| 	{ Name: "TileSize", Callback: (UDim2) -> () }
	| 	{ Name: "Visible", Callback: (boolean) -> () }
	| 	{ Name: "ZIndex", Callback: (number) -> () }
export type ImageButtonModifier = {
	read __quadModifier: "ImageButton", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: ImageButtonModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: ImageButtonModifier, ...any) -> any,
	As: <T>(self: ImageButtonModifier, name: string?) -> T, -- 무검사(11절)
	AsImageButton: (self: ImageButtonModifier) -> ImageButtonModifier, -- 항등(Into<ImageButton> 구현)
	Active: (self: ImageButtonModifier, value: Field<boolean | Tween<boolean>>) -> ImageButtonModifier,
	AnchorPoint: (self: ImageButtonModifier, value: Field<Vector2 | Tween<Vector2>>) -> ImageButtonModifier,
	Archivable: (self: ImageButtonModifier, value: Field<boolean | Tween<boolean>>) -> ImageButtonModifier,
	AutoButtonColor: (self: ImageButtonModifier, value: Field<boolean | Tween<boolean>>) -> ImageButtonModifier,
	AutoLocalize: (self: ImageButtonModifier, value: Field<boolean | Tween<boolean>>) -> ImageButtonModifier,
	AutomaticSize: (self: ImageButtonModifier, value: Field<Enum.AutomaticSize | Tween<Enum.AutomaticSize>>) -> ImageButtonModifier,
	BackgroundColor3: (self: ImageButtonModifier, value: Field<Color3 | Tween<Color3>>) -> ImageButtonModifier,
	BackgroundTransparency: (self: ImageButtonModifier, value: Field<number | Tween<number>>) -> ImageButtonModifier,
	BorderColor3: (self: ImageButtonModifier, value: Field<Color3 | Tween<Color3>>) -> ImageButtonModifier,
	BorderMode: (self: ImageButtonModifier, value: Field<Enum.BorderMode | Tween<Enum.BorderMode>>) -> ImageButtonModifier,
	BorderSizePixel: (self: ImageButtonModifier, value: Field<number | Tween<number>>) -> ImageButtonModifier,
	Capabilities: (self: ImageButtonModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> ImageButtonModifier,
	ClipsDescendants: (self: ImageButtonModifier, value: Field<boolean | Tween<boolean>>) -> ImageButtonModifier,
	HoverHapticEffect: (self: ImageButtonModifier, value: Field<HapticEffect | Tween<HapticEffect>>) -> ImageButtonModifier,
	HoverImage: (self: ImageButtonModifier, value: Field<Content | Tween<Content>>) -> ImageButtonModifier,
	HoverImageContent: (self: ImageButtonModifier, value: Field<Content | Tween<Content>>) -> ImageButtonModifier,
	Image: (self: ImageButtonModifier, value: Field<Content | Tween<Content>>) -> ImageButtonModifier,
	ImageColor3: (self: ImageButtonModifier, value: Field<Color3 | Tween<Color3>>) -> ImageButtonModifier,
	ImageContent: (self: ImageButtonModifier, value: Field<Content | Tween<Content>>) -> ImageButtonModifier,
	ImageRectOffset: (self: ImageButtonModifier, value: Field<Vector2 | Tween<Vector2>>) -> ImageButtonModifier,
	ImageRectSize: (self: ImageButtonModifier, value: Field<Vector2 | Tween<Vector2>>) -> ImageButtonModifier,
	ImageTransparency: (self: ImageButtonModifier, value: Field<number | Tween<number>>) -> ImageButtonModifier,
	InputSink: (self: ImageButtonModifier, value: Field<Enum.InputSink | Tween<Enum.InputSink>>) -> ImageButtonModifier,
	Interactable: (self: ImageButtonModifier, value: Field<boolean | Tween<boolean>>) -> ImageButtonModifier,
	LayoutOrder: (self: ImageButtonModifier, value: Field<number | Tween<number>>) -> ImageButtonModifier,
	Modal: (self: ImageButtonModifier, value: Field<boolean | Tween<boolean>>) -> ImageButtonModifier,
	Name: (self: ImageButtonModifier, value: Field<string | Tween<string>>) -> ImageButtonModifier,
	NextSelectionDown: (self: ImageButtonModifier, value: Field<GuiObject | Tween<GuiObject>>) -> ImageButtonModifier,
	NextSelectionLeft: (self: ImageButtonModifier, value: Field<GuiObject | Tween<GuiObject>>) -> ImageButtonModifier,
	NextSelectionRight: (self: ImageButtonModifier, value: Field<GuiObject | Tween<GuiObject>>) -> ImageButtonModifier,
	NextSelectionUp: (self: ImageButtonModifier, value: Field<GuiObject | Tween<GuiObject>>) -> ImageButtonModifier,
	Position: (self: ImageButtonModifier, value: Field<UDim2 | Tween<UDim2>>) -> ImageButtonModifier,
	PressHapticEffect: (self: ImageButtonModifier, value: Field<HapticEffect | Tween<HapticEffect>>) -> ImageButtonModifier,
	PressedImage: (self: ImageButtonModifier, value: Field<Content | Tween<Content>>) -> ImageButtonModifier,
	PressedImageContent: (self: ImageButtonModifier, value: Field<Content | Tween<Content>>) -> ImageButtonModifier,
	ResampleMode: (self: ImageButtonModifier, value: Field<Enum.ResamplerMode | Tween<Enum.ResamplerMode>>) -> ImageButtonModifier,
	RootLocalizationTable: (self: ImageButtonModifier, value: Field<LocalizationTable | Tween<LocalizationTable>>) -> ImageButtonModifier,
	Rotation: (self: ImageButtonModifier, value: Field<number | Tween<number>>) -> ImageButtonModifier,
	Sandboxed: (self: ImageButtonModifier, value: Field<boolean | Tween<boolean>>) -> ImageButtonModifier,
	ScaleType: (self: ImageButtonModifier, value: Field<Enum.ScaleType | Tween<Enum.ScaleType>>) -> ImageButtonModifier,
	Selectable: (self: ImageButtonModifier, value: Field<boolean | Tween<boolean>>) -> ImageButtonModifier,
	Selected: (self: ImageButtonModifier, value: Field<boolean | Tween<boolean>>) -> ImageButtonModifier,
	SelectionBehaviorDown: (self: ImageButtonModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> ImageButtonModifier,
	SelectionBehaviorLeft: (self: ImageButtonModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> ImageButtonModifier,
	SelectionBehaviorRight: (self: ImageButtonModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> ImageButtonModifier,
	SelectionBehaviorUp: (self: ImageButtonModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> ImageButtonModifier,
	SelectionGroup: (self: ImageButtonModifier, value: Field<boolean | Tween<boolean>>) -> ImageButtonModifier,
	SelectionImageObject: (self: ImageButtonModifier, value: Field<GuiObject | Tween<GuiObject>>) -> ImageButtonModifier,
	SelectionOrder: (self: ImageButtonModifier, value: Field<number | Tween<number>>) -> ImageButtonModifier,
	Size: (self: ImageButtonModifier, value: Field<UDim2 | Tween<UDim2>>) -> ImageButtonModifier,
	SizeConstraint: (self: ImageButtonModifier, value: Field<Enum.SizeConstraint | Tween<Enum.SizeConstraint>>) -> ImageButtonModifier,
	SliceCenter: (self: ImageButtonModifier, value: Field<Rect | Tween<Rect>>) -> ImageButtonModifier,
	SliceScale: (self: ImageButtonModifier, value: Field<number | Tween<number>>) -> ImageButtonModifier,
	Style: (self: ImageButtonModifier, value: Field<Enum.ButtonStyle | Tween<Enum.ButtonStyle>>) -> ImageButtonModifier,
	TileSize: (self: ImageButtonModifier, value: Field<UDim2 | Tween<UDim2>>) -> ImageButtonModifier,
	Visible: (self: ImageButtonModifier, value: Field<boolean | Tween<boolean>>) -> ImageButtonModifier,
	ZIndex: (self: ImageButtonModifier, value: Field<number | Tween<number>>) -> ImageButtonModifier,
}
export type IntoImageButton = { AsImageButton: (self: any) -> ImageButtonModifier }
export type ImageButtonElem = NewChild | ImageButtonOnChange | State<ImageButtonOnChange> | { read __quadModifier: "ImageButton" | "GuiButton" | "GuiObject" | "GuiBase2d" | "GuiBase" | "Instance" }
export type ImageButtonMapperElem = ImageButtonElem | MapperDescriptor

export type ImageLabelOnChange =
	{ Name: "Active", Callback: (boolean) -> () }
	| 	{ Name: "AnchorPoint", Callback: (Vector2) -> () }
	| 	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "AutoLocalize", Callback: (boolean) -> () }
	| 	{ Name: "AutomaticSize", Callback: (Enum.AutomaticSize) -> () }
	| 	{ Name: "BackgroundColor3", Callback: (Color3) -> () }
	| 	{ Name: "BackgroundTransparency", Callback: (number) -> () }
	| 	{ Name: "BorderColor3", Callback: (Color3) -> () }
	| 	{ Name: "BorderMode", Callback: (Enum.BorderMode) -> () }
	| 	{ Name: "BorderSizePixel", Callback: (number) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "ClipsDescendants", Callback: (boolean) -> () }
	| 	{ Name: "Image", Callback: (Content) -> () }
	| 	{ Name: "ImageColor3", Callback: (Color3) -> () }
	| 	{ Name: "ImageContent", Callback: (Content) -> () }
	| 	{ Name: "ImageRectOffset", Callback: (Vector2) -> () }
	| 	{ Name: "ImageRectSize", Callback: (Vector2) -> () }
	| 	{ Name: "ImageTransparency", Callback: (number) -> () }
	| 	{ Name: "InputSink", Callback: (Enum.InputSink) -> () }
	| 	{ Name: "Interactable", Callback: (boolean) -> () }
	| 	{ Name: "LayoutOrder", Callback: (number) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "NextSelectionDown", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionLeft", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionRight", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionUp", Callback: (GuiObject) -> () }
	| 	{ Name: "Position", Callback: (UDim2) -> () }
	| 	{ Name: "ResampleMode", Callback: (Enum.ResamplerMode) -> () }
	| 	{ Name: "RootLocalizationTable", Callback: (LocalizationTable) -> () }
	| 	{ Name: "Rotation", Callback: (number) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "ScaleType", Callback: (Enum.ScaleType) -> () }
	| 	{ Name: "Selectable", Callback: (boolean) -> () }
	| 	{ Name: "SelectionBehaviorDown", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorLeft", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorRight", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorUp", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionGroup", Callback: (boolean) -> () }
	| 	{ Name: "SelectionImageObject", Callback: (GuiObject) -> () }
	| 	{ Name: "SelectionOrder", Callback: (number) -> () }
	| 	{ Name: "Size", Callback: (UDim2) -> () }
	| 	{ Name: "SizeConstraint", Callback: (Enum.SizeConstraint) -> () }
	| 	{ Name: "SliceCenter", Callback: (Rect) -> () }
	| 	{ Name: "SliceScale", Callback: (number) -> () }
	| 	{ Name: "TileSize", Callback: (UDim2) -> () }
	| 	{ Name: "Visible", Callback: (boolean) -> () }
	| 	{ Name: "ZIndex", Callback: (number) -> () }
export type ImageLabelModifier = {
	read __quadModifier: "ImageLabel", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: ImageLabelModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: ImageLabelModifier, ...any) -> any,
	As: <T>(self: ImageLabelModifier, name: string?) -> T, -- 무검사(11절)
	AsImageLabel: (self: ImageLabelModifier) -> ImageLabelModifier, -- 항등(Into<ImageLabel> 구현)
	Active: (self: ImageLabelModifier, value: Field<boolean | Tween<boolean>>) -> ImageLabelModifier,
	AnchorPoint: (self: ImageLabelModifier, value: Field<Vector2 | Tween<Vector2>>) -> ImageLabelModifier,
	Archivable: (self: ImageLabelModifier, value: Field<boolean | Tween<boolean>>) -> ImageLabelModifier,
	AutoLocalize: (self: ImageLabelModifier, value: Field<boolean | Tween<boolean>>) -> ImageLabelModifier,
	AutomaticSize: (self: ImageLabelModifier, value: Field<Enum.AutomaticSize | Tween<Enum.AutomaticSize>>) -> ImageLabelModifier,
	BackgroundColor3: (self: ImageLabelModifier, value: Field<Color3 | Tween<Color3>>) -> ImageLabelModifier,
	BackgroundTransparency: (self: ImageLabelModifier, value: Field<number | Tween<number>>) -> ImageLabelModifier,
	BorderColor3: (self: ImageLabelModifier, value: Field<Color3 | Tween<Color3>>) -> ImageLabelModifier,
	BorderMode: (self: ImageLabelModifier, value: Field<Enum.BorderMode | Tween<Enum.BorderMode>>) -> ImageLabelModifier,
	BorderSizePixel: (self: ImageLabelModifier, value: Field<number | Tween<number>>) -> ImageLabelModifier,
	Capabilities: (self: ImageLabelModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> ImageLabelModifier,
	ClipsDescendants: (self: ImageLabelModifier, value: Field<boolean | Tween<boolean>>) -> ImageLabelModifier,
	Image: (self: ImageLabelModifier, value: Field<Content | Tween<Content>>) -> ImageLabelModifier,
	ImageColor3: (self: ImageLabelModifier, value: Field<Color3 | Tween<Color3>>) -> ImageLabelModifier,
	ImageContent: (self: ImageLabelModifier, value: Field<Content | Tween<Content>>) -> ImageLabelModifier,
	ImageRectOffset: (self: ImageLabelModifier, value: Field<Vector2 | Tween<Vector2>>) -> ImageLabelModifier,
	ImageRectSize: (self: ImageLabelModifier, value: Field<Vector2 | Tween<Vector2>>) -> ImageLabelModifier,
	ImageTransparency: (self: ImageLabelModifier, value: Field<number | Tween<number>>) -> ImageLabelModifier,
	InputSink: (self: ImageLabelModifier, value: Field<Enum.InputSink | Tween<Enum.InputSink>>) -> ImageLabelModifier,
	Interactable: (self: ImageLabelModifier, value: Field<boolean | Tween<boolean>>) -> ImageLabelModifier,
	LayoutOrder: (self: ImageLabelModifier, value: Field<number | Tween<number>>) -> ImageLabelModifier,
	Name: (self: ImageLabelModifier, value: Field<string | Tween<string>>) -> ImageLabelModifier,
	NextSelectionDown: (self: ImageLabelModifier, value: Field<GuiObject | Tween<GuiObject>>) -> ImageLabelModifier,
	NextSelectionLeft: (self: ImageLabelModifier, value: Field<GuiObject | Tween<GuiObject>>) -> ImageLabelModifier,
	NextSelectionRight: (self: ImageLabelModifier, value: Field<GuiObject | Tween<GuiObject>>) -> ImageLabelModifier,
	NextSelectionUp: (self: ImageLabelModifier, value: Field<GuiObject | Tween<GuiObject>>) -> ImageLabelModifier,
	Position: (self: ImageLabelModifier, value: Field<UDim2 | Tween<UDim2>>) -> ImageLabelModifier,
	ResampleMode: (self: ImageLabelModifier, value: Field<Enum.ResamplerMode | Tween<Enum.ResamplerMode>>) -> ImageLabelModifier,
	RootLocalizationTable: (self: ImageLabelModifier, value: Field<LocalizationTable | Tween<LocalizationTable>>) -> ImageLabelModifier,
	Rotation: (self: ImageLabelModifier, value: Field<number | Tween<number>>) -> ImageLabelModifier,
	Sandboxed: (self: ImageLabelModifier, value: Field<boolean | Tween<boolean>>) -> ImageLabelModifier,
	ScaleType: (self: ImageLabelModifier, value: Field<Enum.ScaleType | Tween<Enum.ScaleType>>) -> ImageLabelModifier,
	Selectable: (self: ImageLabelModifier, value: Field<boolean | Tween<boolean>>) -> ImageLabelModifier,
	SelectionBehaviorDown: (self: ImageLabelModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> ImageLabelModifier,
	SelectionBehaviorLeft: (self: ImageLabelModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> ImageLabelModifier,
	SelectionBehaviorRight: (self: ImageLabelModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> ImageLabelModifier,
	SelectionBehaviorUp: (self: ImageLabelModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> ImageLabelModifier,
	SelectionGroup: (self: ImageLabelModifier, value: Field<boolean | Tween<boolean>>) -> ImageLabelModifier,
	SelectionImageObject: (self: ImageLabelModifier, value: Field<GuiObject | Tween<GuiObject>>) -> ImageLabelModifier,
	SelectionOrder: (self: ImageLabelModifier, value: Field<number | Tween<number>>) -> ImageLabelModifier,
	Size: (self: ImageLabelModifier, value: Field<UDim2 | Tween<UDim2>>) -> ImageLabelModifier,
	SizeConstraint: (self: ImageLabelModifier, value: Field<Enum.SizeConstraint | Tween<Enum.SizeConstraint>>) -> ImageLabelModifier,
	SliceCenter: (self: ImageLabelModifier, value: Field<Rect | Tween<Rect>>) -> ImageLabelModifier,
	SliceScale: (self: ImageLabelModifier, value: Field<number | Tween<number>>) -> ImageLabelModifier,
	TileSize: (self: ImageLabelModifier, value: Field<UDim2 | Tween<UDim2>>) -> ImageLabelModifier,
	Visible: (self: ImageLabelModifier, value: Field<boolean | Tween<boolean>>) -> ImageLabelModifier,
	ZIndex: (self: ImageLabelModifier, value: Field<number | Tween<number>>) -> ImageLabelModifier,
}
export type IntoImageLabel = { AsImageLabel: (self: any) -> ImageLabelModifier }
export type ImageLabelElem = NewChild | ImageLabelOnChange | State<ImageLabelOnChange> | { read __quadModifier: "ImageLabel" | "GuiLabel" | "GuiObject" | "GuiBase2d" | "GuiBase" | "Instance" }
export type ImageLabelMapperElem = ImageLabelElem | MapperDescriptor

export type InstanceModifier = {
	read __quadModifier: "Instance", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: InstanceModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: InstanceModifier, ...any) -> any,
	As: <T>(self: InstanceModifier, name: string?) -> T, -- 무검사(11절)
	AsInstance: (self: InstanceModifier) -> InstanceModifier, -- 항등(Into<Instance> 구현)
	AsBillboardGui: (self: InstanceModifier) -> BillboardGuiModifier,
	AsCamera: (self: InstanceModifier) -> CameraModifier,
	AsCanvasGroup: (self: InstanceModifier) -> CanvasGroupModifier,
	AsFolder: (self: InstanceModifier) -> FolderModifier,
	AsFrame: (self: InstanceModifier) -> FrameModifier,
	AsGuiBase: (self: InstanceModifier) -> GuiBaseModifier,
	AsGuiBase2d: (self: InstanceModifier) -> GuiBase2dModifier,
	AsGuiButton: (self: InstanceModifier) -> GuiButtonModifier,
	AsGuiLabel: (self: InstanceModifier) -> GuiLabelModifier,
	AsGuiObject: (self: InstanceModifier) -> GuiObjectModifier,
	AsImageButton: (self: InstanceModifier) -> ImageButtonModifier,
	AsImageLabel: (self: InstanceModifier) -> ImageLabelModifier,
	AsLayerCollector: (self: InstanceModifier) -> LayerCollectorModifier,
	AsModel: (self: InstanceModifier) -> ModelModifier,
	AsPVInstance: (self: InstanceModifier) -> PVInstanceModifier,
	AsScreenGui: (self: InstanceModifier) -> ScreenGuiModifier,
	AsScrollingFrame: (self: InstanceModifier) -> ScrollingFrameModifier,
	AsSurfaceGui: (self: InstanceModifier) -> SurfaceGuiModifier,
	AsSurfaceGuiBase: (self: InstanceModifier) -> SurfaceGuiBaseModifier,
	AsTextBox: (self: InstanceModifier) -> TextBoxModifier,
	AsTextButton: (self: InstanceModifier) -> TextButtonModifier,
	AsTextLabel: (self: InstanceModifier) -> TextLabelModifier,
	AsUIAspectRatioConstraint: (self: InstanceModifier) -> UIAspectRatioConstraintModifier,
	AsUIBase: (self: InstanceModifier) -> UIBaseModifier,
	AsUIComponent: (self: InstanceModifier) -> UIComponentModifier,
	AsUIConstraint: (self: InstanceModifier) -> UIConstraintModifier,
	AsUICorner: (self: InstanceModifier) -> UICornerModifier,
	AsUIDragDetector: (self: InstanceModifier) -> UIDragDetectorModifier,
	AsUIFlexItem: (self: InstanceModifier) -> UIFlexItemModifier,
	AsUIGradient: (self: InstanceModifier) -> UIGradientModifier,
	AsUIGridLayout: (self: InstanceModifier) -> UIGridLayoutModifier,
	AsUIGridStyleLayout: (self: InstanceModifier) -> UIGridStyleLayoutModifier,
	AsUILayout: (self: InstanceModifier) -> UILayoutModifier,
	AsUIListLayout: (self: InstanceModifier) -> UIListLayoutModifier,
	AsUIPadding: (self: InstanceModifier) -> UIPaddingModifier,
	AsUIPageLayout: (self: InstanceModifier) -> UIPageLayoutModifier,
	AsUIScale: (self: InstanceModifier) -> UIScaleModifier,
	AsUIShadow: (self: InstanceModifier) -> UIShadowModifier,
	AsUISizeConstraint: (self: InstanceModifier) -> UISizeConstraintModifier,
	AsUIStroke: (self: InstanceModifier) -> UIStrokeModifier,
	AsUITableLayout: (self: InstanceModifier) -> UITableLayoutModifier,
	AsUITextSizeConstraint: (self: InstanceModifier) -> UITextSizeConstraintModifier,
	AsVideoFrame: (self: InstanceModifier) -> VideoFrameModifier,
	AsViewportFrame: (self: InstanceModifier) -> ViewportFrameModifier,
	AsWorldModel: (self: InstanceModifier) -> WorldModelModifier,
	AsWorldRoot: (self: InstanceModifier) -> WorldRootModifier,
	Archivable: (self: InstanceModifier, value: Field<boolean | Tween<boolean>>) -> InstanceModifier,
	Capabilities: (self: InstanceModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> InstanceModifier,
	Name: (self: InstanceModifier, value: Field<string | Tween<string>>) -> InstanceModifier,
	Sandboxed: (self: InstanceModifier, value: Field<boolean | Tween<boolean>>) -> InstanceModifier,
}
export type IntoInstance = { AsInstance: (self: any) -> InstanceModifier }

export type LayerCollectorModifier = {
	read __quadModifier: "LayerCollector", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: LayerCollectorModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: LayerCollectorModifier, ...any) -> any,
	As: <T>(self: LayerCollectorModifier, name: string?) -> T, -- 무검사(11절)
	AsLayerCollector: (self: LayerCollectorModifier) -> LayerCollectorModifier, -- 항등(Into<LayerCollector> 구현)
	AsBillboardGui: (self: LayerCollectorModifier) -> BillboardGuiModifier,
	AsScreenGui: (self: LayerCollectorModifier) -> ScreenGuiModifier,
	AsSurfaceGui: (self: LayerCollectorModifier) -> SurfaceGuiModifier,
	AsSurfaceGuiBase: (self: LayerCollectorModifier) -> SurfaceGuiBaseModifier,
	Archivable: (self: LayerCollectorModifier, value: Field<boolean | Tween<boolean>>) -> LayerCollectorModifier,
	AutoLocalize: (self: LayerCollectorModifier, value: Field<boolean | Tween<boolean>>) -> LayerCollectorModifier,
	Capabilities: (self: LayerCollectorModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> LayerCollectorModifier,
	Enabled: (self: LayerCollectorModifier, value: Field<boolean | Tween<boolean>>) -> LayerCollectorModifier,
	Name: (self: LayerCollectorModifier, value: Field<string | Tween<string>>) -> LayerCollectorModifier,
	ResetOnSpawn: (self: LayerCollectorModifier, value: Field<boolean | Tween<boolean>>) -> LayerCollectorModifier,
	RootLocalizationTable: (self: LayerCollectorModifier, value: Field<LocalizationTable | Tween<LocalizationTable>>) -> LayerCollectorModifier,
	Sandboxed: (self: LayerCollectorModifier, value: Field<boolean | Tween<boolean>>) -> LayerCollectorModifier,
	SelectionBehaviorDown: (self: LayerCollectorModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> LayerCollectorModifier,
	SelectionBehaviorLeft: (self: LayerCollectorModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> LayerCollectorModifier,
	SelectionBehaviorRight: (self: LayerCollectorModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> LayerCollectorModifier,
	SelectionBehaviorUp: (self: LayerCollectorModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> LayerCollectorModifier,
	SelectionGroup: (self: LayerCollectorModifier, value: Field<boolean | Tween<boolean>>) -> LayerCollectorModifier,
	ZIndexBehavior: (self: LayerCollectorModifier, value: Field<Enum.ZIndexBehavior | Tween<Enum.ZIndexBehavior>>) -> LayerCollectorModifier,
}
export type IntoLayerCollector = { AsLayerCollector: (self: any) -> LayerCollectorModifier }

export type ModelModifier = {
	read __quadModifier: "Model", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: ModelModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: ModelModifier, ...any) -> any,
	As: <T>(self: ModelModifier, name: string?) -> T, -- 무검사(11절)
	AsModel: (self: ModelModifier) -> ModelModifier, -- 항등(Into<Model> 구현)
	AsWorldModel: (self: ModelModifier) -> WorldModelModifier,
	AsWorldRoot: (self: ModelModifier) -> WorldRootModifier,
	Archivable: (self: ModelModifier, value: Field<boolean | Tween<boolean>>) -> ModelModifier,
	Capabilities: (self: ModelModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> ModelModifier,
	ModelStreamingMode: (self: ModelModifier, value: Field<Enum.ModelStreamingMode | Tween<Enum.ModelStreamingMode>>) -> ModelModifier,
	Name: (self: ModelModifier, value: Field<string | Tween<string>>) -> ModelModifier,
	PrimaryPart: (self: ModelModifier, value: Field<BasePart | Tween<BasePart>>) -> ModelModifier,
	Sandboxed: (self: ModelModifier, value: Field<boolean | Tween<boolean>>) -> ModelModifier,
	WorldPivot: (self: ModelModifier, value: Field<CFrame | Tween<CFrame>>) -> ModelModifier,
}
export type IntoModel = { AsModel: (self: any) -> ModelModifier }

export type PVInstanceModifier = {
	read __quadModifier: "PVInstance", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: PVInstanceModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: PVInstanceModifier, ...any) -> any,
	As: <T>(self: PVInstanceModifier, name: string?) -> T, -- 무검사(11절)
	AsPVInstance: (self: PVInstanceModifier) -> PVInstanceModifier, -- 항등(Into<PVInstance> 구현)
	AsCamera: (self: PVInstanceModifier) -> CameraModifier,
	AsModel: (self: PVInstanceModifier) -> ModelModifier,
	AsWorldModel: (self: PVInstanceModifier) -> WorldModelModifier,
	AsWorldRoot: (self: PVInstanceModifier) -> WorldRootModifier,
	Archivable: (self: PVInstanceModifier, value: Field<boolean | Tween<boolean>>) -> PVInstanceModifier,
	Capabilities: (self: PVInstanceModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> PVInstanceModifier,
	Name: (self: PVInstanceModifier, value: Field<string | Tween<string>>) -> PVInstanceModifier,
	Sandboxed: (self: PVInstanceModifier, value: Field<boolean | Tween<boolean>>) -> PVInstanceModifier,
}
export type IntoPVInstance = { AsPVInstance: (self: any) -> PVInstanceModifier }

export type ScreenGuiOnChange =
	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "AutoLocalize", Callback: (boolean) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "ClipToDeviceSafeArea", Callback: (boolean) -> () }
	| 	{ Name: "DisplayOrder", Callback: (number) -> () }
	| 	{ Name: "Enabled", Callback: (boolean) -> () }
	| 	{ Name: "IgnoreGuiInset", Callback: (boolean) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "ResetOnSpawn", Callback: (boolean) -> () }
	| 	{ Name: "RootLocalizationTable", Callback: (LocalizationTable) -> () }
	| 	{ Name: "SafeAreaCompatibility", Callback: (Enum.SafeAreaCompatibility) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "ScreenInsets", Callback: (Enum.ScreenInsets) -> () }
	| 	{ Name: "SelectionBehaviorDown", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorLeft", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorRight", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorUp", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionGroup", Callback: (boolean) -> () }
	| 	{ Name: "ZIndexBehavior", Callback: (Enum.ZIndexBehavior) -> () }
export type ScreenGuiModifier = {
	read __quadModifier: "ScreenGui", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: ScreenGuiModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: ScreenGuiModifier, ...any) -> any,
	As: <T>(self: ScreenGuiModifier, name: string?) -> T, -- 무검사(11절)
	AsScreenGui: (self: ScreenGuiModifier) -> ScreenGuiModifier, -- 항등(Into<ScreenGui> 구현)
	Archivable: (self: ScreenGuiModifier, value: Field<boolean | Tween<boolean>>) -> ScreenGuiModifier,
	AutoLocalize: (self: ScreenGuiModifier, value: Field<boolean | Tween<boolean>>) -> ScreenGuiModifier,
	Capabilities: (self: ScreenGuiModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> ScreenGuiModifier,
	ClipToDeviceSafeArea: (self: ScreenGuiModifier, value: Field<boolean | Tween<boolean>>) -> ScreenGuiModifier,
	DisplayOrder: (self: ScreenGuiModifier, value: Field<number | Tween<number>>) -> ScreenGuiModifier,
	Enabled: (self: ScreenGuiModifier, value: Field<boolean | Tween<boolean>>) -> ScreenGuiModifier,
	IgnoreGuiInset: (self: ScreenGuiModifier, value: Field<boolean | Tween<boolean>>) -> ScreenGuiModifier,
	Name: (self: ScreenGuiModifier, value: Field<string | Tween<string>>) -> ScreenGuiModifier,
	ResetOnSpawn: (self: ScreenGuiModifier, value: Field<boolean | Tween<boolean>>) -> ScreenGuiModifier,
	RootLocalizationTable: (self: ScreenGuiModifier, value: Field<LocalizationTable | Tween<LocalizationTable>>) -> ScreenGuiModifier,
	SafeAreaCompatibility: (self: ScreenGuiModifier, value: Field<Enum.SafeAreaCompatibility | Tween<Enum.SafeAreaCompatibility>>) -> ScreenGuiModifier,
	Sandboxed: (self: ScreenGuiModifier, value: Field<boolean | Tween<boolean>>) -> ScreenGuiModifier,
	ScreenInsets: (self: ScreenGuiModifier, value: Field<Enum.ScreenInsets | Tween<Enum.ScreenInsets>>) -> ScreenGuiModifier,
	SelectionBehaviorDown: (self: ScreenGuiModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> ScreenGuiModifier,
	SelectionBehaviorLeft: (self: ScreenGuiModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> ScreenGuiModifier,
	SelectionBehaviorRight: (self: ScreenGuiModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> ScreenGuiModifier,
	SelectionBehaviorUp: (self: ScreenGuiModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> ScreenGuiModifier,
	SelectionGroup: (self: ScreenGuiModifier, value: Field<boolean | Tween<boolean>>) -> ScreenGuiModifier,
	ZIndexBehavior: (self: ScreenGuiModifier, value: Field<Enum.ZIndexBehavior | Tween<Enum.ZIndexBehavior>>) -> ScreenGuiModifier,
}
export type IntoScreenGui = { AsScreenGui: (self: any) -> ScreenGuiModifier }
export type ScreenGuiElem = NewChild | ScreenGuiOnChange | State<ScreenGuiOnChange> | { read __quadModifier: "ScreenGui" | "LayerCollector" | "GuiBase2d" | "GuiBase" | "Instance" }
export type ScreenGuiMapperElem = ScreenGuiElem | MapperDescriptor

export type ScrollingFrameOnChange =
	{ Name: "Active", Callback: (boolean) -> () }
	| 	{ Name: "AnchorPoint", Callback: (Vector2) -> () }
	| 	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "AutoLocalize", Callback: (boolean) -> () }
	| 	{ Name: "AutomaticCanvasSize", Callback: (Enum.AutomaticSize) -> () }
	| 	{ Name: "AutomaticSize", Callback: (Enum.AutomaticSize) -> () }
	| 	{ Name: "BackgroundColor3", Callback: (Color3) -> () }
	| 	{ Name: "BackgroundTransparency", Callback: (number) -> () }
	| 	{ Name: "BorderColor3", Callback: (Color3) -> () }
	| 	{ Name: "BorderMode", Callback: (Enum.BorderMode) -> () }
	| 	{ Name: "BorderSizePixel", Callback: (number) -> () }
	| 	{ Name: "BottomImage", Callback: (Content) -> () }
	| 	{ Name: "BottomImageContent", Callback: (Content) -> () }
	| 	{ Name: "CanvasPosition", Callback: (Vector2) -> () }
	| 	{ Name: "CanvasSize", Callback: (UDim2) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "ClipsDescendants", Callback: (boolean) -> () }
	| 	{ Name: "ElasticBehavior", Callback: (Enum.ElasticBehavior) -> () }
	| 	{ Name: "HorizontalScrollBarInset", Callback: (Enum.ScrollBarInset) -> () }
	| 	{ Name: "InputSink", Callback: (Enum.InputSink) -> () }
	| 	{ Name: "Interactable", Callback: (boolean) -> () }
	| 	{ Name: "LayoutOrder", Callback: (number) -> () }
	| 	{ Name: "MidImage", Callback: (Content) -> () }
	| 	{ Name: "MidImageContent", Callback: (Content) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "NextSelectionDown", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionLeft", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionRight", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionUp", Callback: (GuiObject) -> () }
	| 	{ Name: "Position", Callback: (UDim2) -> () }
	| 	{ Name: "RootLocalizationTable", Callback: (LocalizationTable) -> () }
	| 	{ Name: "Rotation", Callback: (number) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "ScrollBarImageColor3", Callback: (Color3) -> () }
	| 	{ Name: "ScrollBarImageTransparency", Callback: (number) -> () }
	| 	{ Name: "ScrollBarThickness", Callback: (number) -> () }
	| 	{ Name: "ScrollingDirection", Callback: (Enum.ScrollingDirection) -> () }
	| 	{ Name: "ScrollingEnabled", Callback: (boolean) -> () }
	| 	{ Name: "Selectable", Callback: (boolean) -> () }
	| 	{ Name: "SelectionBehaviorDown", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorLeft", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorRight", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorUp", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionGroup", Callback: (boolean) -> () }
	| 	{ Name: "SelectionImageObject", Callback: (GuiObject) -> () }
	| 	{ Name: "SelectionOrder", Callback: (number) -> () }
	| 	{ Name: "Size", Callback: (UDim2) -> () }
	| 	{ Name: "SizeConstraint", Callback: (Enum.SizeConstraint) -> () }
	| 	{ Name: "TopImage", Callback: (Content) -> () }
	| 	{ Name: "TopImageContent", Callback: (Content) -> () }
	| 	{ Name: "VerticalScrollBarInset", Callback: (Enum.ScrollBarInset) -> () }
	| 	{ Name: "VerticalScrollBarPosition", Callback: (Enum.VerticalScrollBarPosition) -> () }
	| 	{ Name: "Visible", Callback: (boolean) -> () }
	| 	{ Name: "ZIndex", Callback: (number) -> () }
export type ScrollingFrameModifier = {
	read __quadModifier: "ScrollingFrame", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: ScrollingFrameModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: ScrollingFrameModifier, ...any) -> any,
	As: <T>(self: ScrollingFrameModifier, name: string?) -> T, -- 무검사(11절)
	AsScrollingFrame: (self: ScrollingFrameModifier) -> ScrollingFrameModifier, -- 항등(Into<ScrollingFrame> 구현)
	Active: (self: ScrollingFrameModifier, value: Field<boolean | Tween<boolean>>) -> ScrollingFrameModifier,
	AnchorPoint: (self: ScrollingFrameModifier, value: Field<Vector2 | Tween<Vector2>>) -> ScrollingFrameModifier,
	Archivable: (self: ScrollingFrameModifier, value: Field<boolean | Tween<boolean>>) -> ScrollingFrameModifier,
	AutoLocalize: (self: ScrollingFrameModifier, value: Field<boolean | Tween<boolean>>) -> ScrollingFrameModifier,
	AutomaticCanvasSize: (self: ScrollingFrameModifier, value: Field<Enum.AutomaticSize | Tween<Enum.AutomaticSize>>) -> ScrollingFrameModifier,
	AutomaticSize: (self: ScrollingFrameModifier, value: Field<Enum.AutomaticSize | Tween<Enum.AutomaticSize>>) -> ScrollingFrameModifier,
	BackgroundColor3: (self: ScrollingFrameModifier, value: Field<Color3 | Tween<Color3>>) -> ScrollingFrameModifier,
	BackgroundTransparency: (self: ScrollingFrameModifier, value: Field<number | Tween<number>>) -> ScrollingFrameModifier,
	BorderColor3: (self: ScrollingFrameModifier, value: Field<Color3 | Tween<Color3>>) -> ScrollingFrameModifier,
	BorderMode: (self: ScrollingFrameModifier, value: Field<Enum.BorderMode | Tween<Enum.BorderMode>>) -> ScrollingFrameModifier,
	BorderSizePixel: (self: ScrollingFrameModifier, value: Field<number | Tween<number>>) -> ScrollingFrameModifier,
	BottomImage: (self: ScrollingFrameModifier, value: Field<Content | Tween<Content>>) -> ScrollingFrameModifier,
	BottomImageContent: (self: ScrollingFrameModifier, value: Field<Content | Tween<Content>>) -> ScrollingFrameModifier,
	CanvasPosition: (self: ScrollingFrameModifier, value: Field<Vector2 | Tween<Vector2>>) -> ScrollingFrameModifier,
	CanvasSize: (self: ScrollingFrameModifier, value: Field<UDim2 | Tween<UDim2>>) -> ScrollingFrameModifier,
	Capabilities: (self: ScrollingFrameModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> ScrollingFrameModifier,
	ClipsDescendants: (self: ScrollingFrameModifier, value: Field<boolean | Tween<boolean>>) -> ScrollingFrameModifier,
	ElasticBehavior: (self: ScrollingFrameModifier, value: Field<Enum.ElasticBehavior | Tween<Enum.ElasticBehavior>>) -> ScrollingFrameModifier,
	HorizontalScrollBarInset: (self: ScrollingFrameModifier, value: Field<Enum.ScrollBarInset | Tween<Enum.ScrollBarInset>>) -> ScrollingFrameModifier,
	InputSink: (self: ScrollingFrameModifier, value: Field<Enum.InputSink | Tween<Enum.InputSink>>) -> ScrollingFrameModifier,
	Interactable: (self: ScrollingFrameModifier, value: Field<boolean | Tween<boolean>>) -> ScrollingFrameModifier,
	LayoutOrder: (self: ScrollingFrameModifier, value: Field<number | Tween<number>>) -> ScrollingFrameModifier,
	MidImage: (self: ScrollingFrameModifier, value: Field<Content | Tween<Content>>) -> ScrollingFrameModifier,
	MidImageContent: (self: ScrollingFrameModifier, value: Field<Content | Tween<Content>>) -> ScrollingFrameModifier,
	Name: (self: ScrollingFrameModifier, value: Field<string | Tween<string>>) -> ScrollingFrameModifier,
	NextSelectionDown: (self: ScrollingFrameModifier, value: Field<GuiObject | Tween<GuiObject>>) -> ScrollingFrameModifier,
	NextSelectionLeft: (self: ScrollingFrameModifier, value: Field<GuiObject | Tween<GuiObject>>) -> ScrollingFrameModifier,
	NextSelectionRight: (self: ScrollingFrameModifier, value: Field<GuiObject | Tween<GuiObject>>) -> ScrollingFrameModifier,
	NextSelectionUp: (self: ScrollingFrameModifier, value: Field<GuiObject | Tween<GuiObject>>) -> ScrollingFrameModifier,
	Position: (self: ScrollingFrameModifier, value: Field<UDim2 | Tween<UDim2>>) -> ScrollingFrameModifier,
	RootLocalizationTable: (self: ScrollingFrameModifier, value: Field<LocalizationTable | Tween<LocalizationTable>>) -> ScrollingFrameModifier,
	Rotation: (self: ScrollingFrameModifier, value: Field<number | Tween<number>>) -> ScrollingFrameModifier,
	Sandboxed: (self: ScrollingFrameModifier, value: Field<boolean | Tween<boolean>>) -> ScrollingFrameModifier,
	ScrollBarImageColor3: (self: ScrollingFrameModifier, value: Field<Color3 | Tween<Color3>>) -> ScrollingFrameModifier,
	ScrollBarImageTransparency: (self: ScrollingFrameModifier, value: Field<number | Tween<number>>) -> ScrollingFrameModifier,
	ScrollBarThickness: (self: ScrollingFrameModifier, value: Field<number | Tween<number>>) -> ScrollingFrameModifier,
	ScrollingDirection: (self: ScrollingFrameModifier, value: Field<Enum.ScrollingDirection | Tween<Enum.ScrollingDirection>>) -> ScrollingFrameModifier,
	ScrollingEnabled: (self: ScrollingFrameModifier, value: Field<boolean | Tween<boolean>>) -> ScrollingFrameModifier,
	Selectable: (self: ScrollingFrameModifier, value: Field<boolean | Tween<boolean>>) -> ScrollingFrameModifier,
	SelectionBehaviorDown: (self: ScrollingFrameModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> ScrollingFrameModifier,
	SelectionBehaviorLeft: (self: ScrollingFrameModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> ScrollingFrameModifier,
	SelectionBehaviorRight: (self: ScrollingFrameModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> ScrollingFrameModifier,
	SelectionBehaviorUp: (self: ScrollingFrameModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> ScrollingFrameModifier,
	SelectionGroup: (self: ScrollingFrameModifier, value: Field<boolean | Tween<boolean>>) -> ScrollingFrameModifier,
	SelectionImageObject: (self: ScrollingFrameModifier, value: Field<GuiObject | Tween<GuiObject>>) -> ScrollingFrameModifier,
	SelectionOrder: (self: ScrollingFrameModifier, value: Field<number | Tween<number>>) -> ScrollingFrameModifier,
	Size: (self: ScrollingFrameModifier, value: Field<UDim2 | Tween<UDim2>>) -> ScrollingFrameModifier,
	SizeConstraint: (self: ScrollingFrameModifier, value: Field<Enum.SizeConstraint | Tween<Enum.SizeConstraint>>) -> ScrollingFrameModifier,
	TopImage: (self: ScrollingFrameModifier, value: Field<Content | Tween<Content>>) -> ScrollingFrameModifier,
	TopImageContent: (self: ScrollingFrameModifier, value: Field<Content | Tween<Content>>) -> ScrollingFrameModifier,
	VerticalScrollBarInset: (self: ScrollingFrameModifier, value: Field<Enum.ScrollBarInset | Tween<Enum.ScrollBarInset>>) -> ScrollingFrameModifier,
	VerticalScrollBarPosition: (self: ScrollingFrameModifier, value: Field<Enum.VerticalScrollBarPosition | Tween<Enum.VerticalScrollBarPosition>>) -> ScrollingFrameModifier,
	Visible: (self: ScrollingFrameModifier, value: Field<boolean | Tween<boolean>>) -> ScrollingFrameModifier,
	ZIndex: (self: ScrollingFrameModifier, value: Field<number | Tween<number>>) -> ScrollingFrameModifier,
}
export type IntoScrollingFrame = { AsScrollingFrame: (self: any) -> ScrollingFrameModifier }
export type ScrollingFrameElem = NewChild | ScrollingFrameOnChange | State<ScrollingFrameOnChange> | { read __quadModifier: "ScrollingFrame" | "GuiObject" | "GuiBase2d" | "GuiBase" | "Instance" }
export type ScrollingFrameMapperElem = ScrollingFrameElem | MapperDescriptor

export type SurfaceGuiOnChange =
	{ Name: "Active", Callback: (boolean) -> () }
	| 	{ Name: "Adornee", Callback: (Instance) -> () }
	| 	{ Name: "AlwaysOnTop", Callback: (boolean) -> () }
	| 	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "AutoLocalize", Callback: (boolean) -> () }
	| 	{ Name: "Brightness", Callback: (number) -> () }
	| 	{ Name: "CanvasSize", Callback: (Vector2) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "ClipsDescendants", Callback: (boolean) -> () }
	| 	{ Name: "Enabled", Callback: (boolean) -> () }
	| 	{ Name: "Face", Callback: (Enum.NormalId) -> () }
	| 	{ Name: "LightInfluence", Callback: (number) -> () }
	| 	{ Name: "MaxDistance", Callback: (number) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "PixelsPerStud", Callback: (number) -> () }
	| 	{ Name: "ResetOnSpawn", Callback: (boolean) -> () }
	| 	{ Name: "RootLocalizationTable", Callback: (LocalizationTable) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "SelectionBehaviorDown", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorLeft", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorRight", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorUp", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionGroup", Callback: (boolean) -> () }
	| 	{ Name: "SizingMode", Callback: (Enum.SurfaceGuiSizingMode) -> () }
	| 	{ Name: "ToolPunchThroughDistance", Callback: (number) -> () }
	| 	{ Name: "ZIndexBehavior", Callback: (Enum.ZIndexBehavior) -> () }
	| 	{ Name: "ZOffset", Callback: (number) -> () }
export type SurfaceGuiModifier = {
	read __quadModifier: "SurfaceGui", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: SurfaceGuiModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: SurfaceGuiModifier, ...any) -> any,
	As: <T>(self: SurfaceGuiModifier, name: string?) -> T, -- 무검사(11절)
	AsSurfaceGui: (self: SurfaceGuiModifier) -> SurfaceGuiModifier, -- 항등(Into<SurfaceGui> 구현)
	Active: (self: SurfaceGuiModifier, value: Field<boolean | Tween<boolean>>) -> SurfaceGuiModifier,
	Adornee: (self: SurfaceGuiModifier, value: Field<Instance | Tween<Instance>>) -> SurfaceGuiModifier,
	AlwaysOnTop: (self: SurfaceGuiModifier, value: Field<boolean | Tween<boolean>>) -> SurfaceGuiModifier,
	Archivable: (self: SurfaceGuiModifier, value: Field<boolean | Tween<boolean>>) -> SurfaceGuiModifier,
	AutoLocalize: (self: SurfaceGuiModifier, value: Field<boolean | Tween<boolean>>) -> SurfaceGuiModifier,
	Brightness: (self: SurfaceGuiModifier, value: Field<number | Tween<number>>) -> SurfaceGuiModifier,
	CanvasSize: (self: SurfaceGuiModifier, value: Field<Vector2 | Tween<Vector2>>) -> SurfaceGuiModifier,
	Capabilities: (self: SurfaceGuiModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> SurfaceGuiModifier,
	ClipsDescendants: (self: SurfaceGuiModifier, value: Field<boolean | Tween<boolean>>) -> SurfaceGuiModifier,
	Enabled: (self: SurfaceGuiModifier, value: Field<boolean | Tween<boolean>>) -> SurfaceGuiModifier,
	Face: (self: SurfaceGuiModifier, value: Field<Enum.NormalId | Tween<Enum.NormalId>>) -> SurfaceGuiModifier,
	LightInfluence: (self: SurfaceGuiModifier, value: Field<number | Tween<number>>) -> SurfaceGuiModifier,
	MaxDistance: (self: SurfaceGuiModifier, value: Field<number | Tween<number>>) -> SurfaceGuiModifier,
	Name: (self: SurfaceGuiModifier, value: Field<string | Tween<string>>) -> SurfaceGuiModifier,
	PixelsPerStud: (self: SurfaceGuiModifier, value: Field<number | Tween<number>>) -> SurfaceGuiModifier,
	ResetOnSpawn: (self: SurfaceGuiModifier, value: Field<boolean | Tween<boolean>>) -> SurfaceGuiModifier,
	RootLocalizationTable: (self: SurfaceGuiModifier, value: Field<LocalizationTable | Tween<LocalizationTable>>) -> SurfaceGuiModifier,
	Sandboxed: (self: SurfaceGuiModifier, value: Field<boolean | Tween<boolean>>) -> SurfaceGuiModifier,
	SelectionBehaviorDown: (self: SurfaceGuiModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> SurfaceGuiModifier,
	SelectionBehaviorLeft: (self: SurfaceGuiModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> SurfaceGuiModifier,
	SelectionBehaviorRight: (self: SurfaceGuiModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> SurfaceGuiModifier,
	SelectionBehaviorUp: (self: SurfaceGuiModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> SurfaceGuiModifier,
	SelectionGroup: (self: SurfaceGuiModifier, value: Field<boolean | Tween<boolean>>) -> SurfaceGuiModifier,
	SizingMode: (self: SurfaceGuiModifier, value: Field<Enum.SurfaceGuiSizingMode | Tween<Enum.SurfaceGuiSizingMode>>) -> SurfaceGuiModifier,
	ToolPunchThroughDistance: (self: SurfaceGuiModifier, value: Field<number | Tween<number>>) -> SurfaceGuiModifier,
	ZIndexBehavior: (self: SurfaceGuiModifier, value: Field<Enum.ZIndexBehavior | Tween<Enum.ZIndexBehavior>>) -> SurfaceGuiModifier,
	ZOffset: (self: SurfaceGuiModifier, value: Field<number | Tween<number>>) -> SurfaceGuiModifier,
}
export type IntoSurfaceGui = { AsSurfaceGui: (self: any) -> SurfaceGuiModifier }
export type SurfaceGuiElem = NewChild | SurfaceGuiOnChange | State<SurfaceGuiOnChange> | { read __quadModifier: "SurfaceGui" | "SurfaceGuiBase" | "LayerCollector" | "GuiBase2d" | "GuiBase" | "Instance" }
export type SurfaceGuiMapperElem = SurfaceGuiElem | MapperDescriptor

export type SurfaceGuiBaseModifier = {
	read __quadModifier: "SurfaceGuiBase", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: SurfaceGuiBaseModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: SurfaceGuiBaseModifier, ...any) -> any,
	As: <T>(self: SurfaceGuiBaseModifier, name: string?) -> T, -- 무검사(11절)
	AsSurfaceGuiBase: (self: SurfaceGuiBaseModifier) -> SurfaceGuiBaseModifier, -- 항등(Into<SurfaceGuiBase> 구현)
	AsSurfaceGui: (self: SurfaceGuiBaseModifier) -> SurfaceGuiModifier,
	Active: (self: SurfaceGuiBaseModifier, value: Field<boolean | Tween<boolean>>) -> SurfaceGuiBaseModifier,
	Adornee: (self: SurfaceGuiBaseModifier, value: Field<Instance | Tween<Instance>>) -> SurfaceGuiBaseModifier,
	Archivable: (self: SurfaceGuiBaseModifier, value: Field<boolean | Tween<boolean>>) -> SurfaceGuiBaseModifier,
	AutoLocalize: (self: SurfaceGuiBaseModifier, value: Field<boolean | Tween<boolean>>) -> SurfaceGuiBaseModifier,
	Capabilities: (self: SurfaceGuiBaseModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> SurfaceGuiBaseModifier,
	Enabled: (self: SurfaceGuiBaseModifier, value: Field<boolean | Tween<boolean>>) -> SurfaceGuiBaseModifier,
	Face: (self: SurfaceGuiBaseModifier, value: Field<Enum.NormalId | Tween<Enum.NormalId>>) -> SurfaceGuiBaseModifier,
	Name: (self: SurfaceGuiBaseModifier, value: Field<string | Tween<string>>) -> SurfaceGuiBaseModifier,
	ResetOnSpawn: (self: SurfaceGuiBaseModifier, value: Field<boolean | Tween<boolean>>) -> SurfaceGuiBaseModifier,
	RootLocalizationTable: (self: SurfaceGuiBaseModifier, value: Field<LocalizationTable | Tween<LocalizationTable>>) -> SurfaceGuiBaseModifier,
	Sandboxed: (self: SurfaceGuiBaseModifier, value: Field<boolean | Tween<boolean>>) -> SurfaceGuiBaseModifier,
	SelectionBehaviorDown: (self: SurfaceGuiBaseModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> SurfaceGuiBaseModifier,
	SelectionBehaviorLeft: (self: SurfaceGuiBaseModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> SurfaceGuiBaseModifier,
	SelectionBehaviorRight: (self: SurfaceGuiBaseModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> SurfaceGuiBaseModifier,
	SelectionBehaviorUp: (self: SurfaceGuiBaseModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> SurfaceGuiBaseModifier,
	SelectionGroup: (self: SurfaceGuiBaseModifier, value: Field<boolean | Tween<boolean>>) -> SurfaceGuiBaseModifier,
	ZIndexBehavior: (self: SurfaceGuiBaseModifier, value: Field<Enum.ZIndexBehavior | Tween<Enum.ZIndexBehavior>>) -> SurfaceGuiBaseModifier,
}
export type IntoSurfaceGuiBase = { AsSurfaceGuiBase: (self: any) -> SurfaceGuiBaseModifier }

export type TextBoxOnChange =
	{ Name: "Active", Callback: (boolean) -> () }
	| 	{ Name: "AnchorPoint", Callback: (Vector2) -> () }
	| 	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "AutoLocalize", Callback: (boolean) -> () }
	| 	{ Name: "AutomaticSize", Callback: (Enum.AutomaticSize) -> () }
	| 	{ Name: "BackgroundColor3", Callback: (Color3) -> () }
	| 	{ Name: "BackgroundTransparency", Callback: (number) -> () }
	| 	{ Name: "BorderColor3", Callback: (Color3) -> () }
	| 	{ Name: "BorderMode", Callback: (Enum.BorderMode) -> () }
	| 	{ Name: "BorderSizePixel", Callback: (number) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "ClearTextOnFocus", Callback: (boolean) -> () }
	| 	{ Name: "ClipsDescendants", Callback: (boolean) -> () }
	| 	{ Name: "CursorPosition", Callback: (number) -> () }
	| 	{ Name: "FontFace", Callback: (Font) -> () }
	| 	{ Name: "InputSink", Callback: (Enum.InputSink) -> () }
	| 	{ Name: "Interactable", Callback: (boolean) -> () }
	| 	{ Name: "LayoutOrder", Callback: (number) -> () }
	| 	{ Name: "LineHeight", Callback: (number) -> () }
	| 	{ Name: "MaxVisibleGraphemes", Callback: (number) -> () }
	| 	{ Name: "MultiLine", Callback: (boolean) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "NextSelectionDown", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionLeft", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionRight", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionUp", Callback: (GuiObject) -> () }
	| 	{ Name: "OpenTypeFeatures", Callback: (string) -> () }
	| 	{ Name: "PlaceholderColor3", Callback: (Color3) -> () }
	| 	{ Name: "PlaceholderText", Callback: (string) -> () }
	| 	{ Name: "Position", Callback: (UDim2) -> () }
	| 	{ Name: "RichText", Callback: (boolean) -> () }
	| 	{ Name: "RootLocalizationTable", Callback: (LocalizationTable) -> () }
	| 	{ Name: "Rotation", Callback: (number) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "Selectable", Callback: (boolean) -> () }
	| 	{ Name: "SelectionBehaviorDown", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorLeft", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorRight", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorUp", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionGroup", Callback: (boolean) -> () }
	| 	{ Name: "SelectionImageObject", Callback: (GuiObject) -> () }
	| 	{ Name: "SelectionOrder", Callback: (number) -> () }
	| 	{ Name: "SelectionStart", Callback: (number) -> () }
	| 	{ Name: "ShowNativeInput", Callback: (boolean) -> () }
	| 	{ Name: "Size", Callback: (UDim2) -> () }
	| 	{ Name: "SizeConstraint", Callback: (Enum.SizeConstraint) -> () }
	| 	{ Name: "Text", Callback: (string) -> () }
	| 	{ Name: "TextColor3", Callback: (Color3) -> () }
	| 	{ Name: "TextDirection", Callback: (Enum.TextDirection) -> () }
	| 	{ Name: "TextEditable", Callback: (boolean) -> () }
	| 	{ Name: "TextScaled", Callback: (boolean) -> () }
	| 	{ Name: "TextSize", Callback: (number) -> () }
	| 	{ Name: "TextStrokeColor3", Callback: (Color3) -> () }
	| 	{ Name: "TextStrokeTransparency", Callback: (number) -> () }
	| 	{ Name: "TextTransparency", Callback: (number) -> () }
	| 	{ Name: "TextTruncate", Callback: (Enum.TextTruncate) -> () }
	| 	{ Name: "TextWrapped", Callback: (boolean) -> () }
	| 	{ Name: "TextXAlignment", Callback: (Enum.TextXAlignment) -> () }
	| 	{ Name: "TextYAlignment", Callback: (Enum.TextYAlignment) -> () }
	| 	{ Name: "Visible", Callback: (boolean) -> () }
	| 	{ Name: "ZIndex", Callback: (number) -> () }
export type TextBoxModifier = {
	read __quadModifier: "TextBox", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: TextBoxModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: TextBoxModifier, ...any) -> any,
	As: <T>(self: TextBoxModifier, name: string?) -> T, -- 무검사(11절)
	AsTextBox: (self: TextBoxModifier) -> TextBoxModifier, -- 항등(Into<TextBox> 구현)
	Active: (self: TextBoxModifier, value: Field<boolean | Tween<boolean>>) -> TextBoxModifier,
	AnchorPoint: (self: TextBoxModifier, value: Field<Vector2 | Tween<Vector2>>) -> TextBoxModifier,
	Archivable: (self: TextBoxModifier, value: Field<boolean | Tween<boolean>>) -> TextBoxModifier,
	AutoLocalize: (self: TextBoxModifier, value: Field<boolean | Tween<boolean>>) -> TextBoxModifier,
	AutomaticSize: (self: TextBoxModifier, value: Field<Enum.AutomaticSize | Tween<Enum.AutomaticSize>>) -> TextBoxModifier,
	BackgroundColor3: (self: TextBoxModifier, value: Field<Color3 | Tween<Color3>>) -> TextBoxModifier,
	BackgroundTransparency: (self: TextBoxModifier, value: Field<number | Tween<number>>) -> TextBoxModifier,
	BorderColor3: (self: TextBoxModifier, value: Field<Color3 | Tween<Color3>>) -> TextBoxModifier,
	BorderMode: (self: TextBoxModifier, value: Field<Enum.BorderMode | Tween<Enum.BorderMode>>) -> TextBoxModifier,
	BorderSizePixel: (self: TextBoxModifier, value: Field<number | Tween<number>>) -> TextBoxModifier,
	Capabilities: (self: TextBoxModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> TextBoxModifier,
	ClearTextOnFocus: (self: TextBoxModifier, value: Field<boolean | Tween<boolean>>) -> TextBoxModifier,
	ClipsDescendants: (self: TextBoxModifier, value: Field<boolean | Tween<boolean>>) -> TextBoxModifier,
	CursorPosition: (self: TextBoxModifier, value: Field<number | Tween<number>>) -> TextBoxModifier,
	FontFace: (self: TextBoxModifier, value: Field<Font | Tween<Font>>) -> TextBoxModifier,
	InputSink: (self: TextBoxModifier, value: Field<Enum.InputSink | Tween<Enum.InputSink>>) -> TextBoxModifier,
	Interactable: (self: TextBoxModifier, value: Field<boolean | Tween<boolean>>) -> TextBoxModifier,
	LayoutOrder: (self: TextBoxModifier, value: Field<number | Tween<number>>) -> TextBoxModifier,
	LineHeight: (self: TextBoxModifier, value: Field<number | Tween<number>>) -> TextBoxModifier,
	MaxVisibleGraphemes: (self: TextBoxModifier, value: Field<number | Tween<number>>) -> TextBoxModifier,
	MultiLine: (self: TextBoxModifier, value: Field<boolean | Tween<boolean>>) -> TextBoxModifier,
	Name: (self: TextBoxModifier, value: Field<string | Tween<string>>) -> TextBoxModifier,
	NextSelectionDown: (self: TextBoxModifier, value: Field<GuiObject | Tween<GuiObject>>) -> TextBoxModifier,
	NextSelectionLeft: (self: TextBoxModifier, value: Field<GuiObject | Tween<GuiObject>>) -> TextBoxModifier,
	NextSelectionRight: (self: TextBoxModifier, value: Field<GuiObject | Tween<GuiObject>>) -> TextBoxModifier,
	NextSelectionUp: (self: TextBoxModifier, value: Field<GuiObject | Tween<GuiObject>>) -> TextBoxModifier,
	OpenTypeFeatures: (self: TextBoxModifier, value: Field<string | Tween<string>>) -> TextBoxModifier,
	PlaceholderColor3: (self: TextBoxModifier, value: Field<Color3 | Tween<Color3>>) -> TextBoxModifier,
	PlaceholderText: (self: TextBoxModifier, value: Field<string | Tween<string>>) -> TextBoxModifier,
	Position: (self: TextBoxModifier, value: Field<UDim2 | Tween<UDim2>>) -> TextBoxModifier,
	RichText: (self: TextBoxModifier, value: Field<boolean | Tween<boolean>>) -> TextBoxModifier,
	RootLocalizationTable: (self: TextBoxModifier, value: Field<LocalizationTable | Tween<LocalizationTable>>) -> TextBoxModifier,
	Rotation: (self: TextBoxModifier, value: Field<number | Tween<number>>) -> TextBoxModifier,
	Sandboxed: (self: TextBoxModifier, value: Field<boolean | Tween<boolean>>) -> TextBoxModifier,
	Selectable: (self: TextBoxModifier, value: Field<boolean | Tween<boolean>>) -> TextBoxModifier,
	SelectionBehaviorDown: (self: TextBoxModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> TextBoxModifier,
	SelectionBehaviorLeft: (self: TextBoxModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> TextBoxModifier,
	SelectionBehaviorRight: (self: TextBoxModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> TextBoxModifier,
	SelectionBehaviorUp: (self: TextBoxModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> TextBoxModifier,
	SelectionGroup: (self: TextBoxModifier, value: Field<boolean | Tween<boolean>>) -> TextBoxModifier,
	SelectionImageObject: (self: TextBoxModifier, value: Field<GuiObject | Tween<GuiObject>>) -> TextBoxModifier,
	SelectionOrder: (self: TextBoxModifier, value: Field<number | Tween<number>>) -> TextBoxModifier,
	SelectionStart: (self: TextBoxModifier, value: Field<number | Tween<number>>) -> TextBoxModifier,
	ShowNativeInput: (self: TextBoxModifier, value: Field<boolean | Tween<boolean>>) -> TextBoxModifier,
	Size: (self: TextBoxModifier, value: Field<UDim2 | Tween<UDim2>>) -> TextBoxModifier,
	SizeConstraint: (self: TextBoxModifier, value: Field<Enum.SizeConstraint | Tween<Enum.SizeConstraint>>) -> TextBoxModifier,
	Text: (self: TextBoxModifier, value: Field<string | Tween<string>>) -> TextBoxModifier,
	TextColor3: (self: TextBoxModifier, value: Field<Color3 | Tween<Color3>>) -> TextBoxModifier,
	TextDirection: (self: TextBoxModifier, value: Field<Enum.TextDirection | Tween<Enum.TextDirection>>) -> TextBoxModifier,
	TextEditable: (self: TextBoxModifier, value: Field<boolean | Tween<boolean>>) -> TextBoxModifier,
	TextScaled: (self: TextBoxModifier, value: Field<boolean | Tween<boolean>>) -> TextBoxModifier,
	TextSize: (self: TextBoxModifier, value: Field<number | Tween<number>>) -> TextBoxModifier,
	TextStrokeColor3: (self: TextBoxModifier, value: Field<Color3 | Tween<Color3>>) -> TextBoxModifier,
	TextStrokeTransparency: (self: TextBoxModifier, value: Field<number | Tween<number>>) -> TextBoxModifier,
	TextTransparency: (self: TextBoxModifier, value: Field<number | Tween<number>>) -> TextBoxModifier,
	TextTruncate: (self: TextBoxModifier, value: Field<Enum.TextTruncate | Tween<Enum.TextTruncate>>) -> TextBoxModifier,
	TextWrapped: (self: TextBoxModifier, value: Field<boolean | Tween<boolean>>) -> TextBoxModifier,
	TextXAlignment: (self: TextBoxModifier, value: Field<Enum.TextXAlignment | Tween<Enum.TextXAlignment>>) -> TextBoxModifier,
	TextYAlignment: (self: TextBoxModifier, value: Field<Enum.TextYAlignment | Tween<Enum.TextYAlignment>>) -> TextBoxModifier,
	Visible: (self: TextBoxModifier, value: Field<boolean | Tween<boolean>>) -> TextBoxModifier,
	ZIndex: (self: TextBoxModifier, value: Field<number | Tween<number>>) -> TextBoxModifier,
}
export type IntoTextBox = { AsTextBox: (self: any) -> TextBoxModifier }
export type TextBoxElem = NewChild | TextBoxOnChange | State<TextBoxOnChange> | { read __quadModifier: "TextBox" | "GuiObject" | "GuiBase2d" | "GuiBase" | "Instance" }
export type TextBoxMapperElem = TextBoxElem | MapperDescriptor

export type TextButtonOnChange =
	{ Name: "Active", Callback: (boolean) -> () }
	| 	{ Name: "AnchorPoint", Callback: (Vector2) -> () }
	| 	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "AutoButtonColor", Callback: (boolean) -> () }
	| 	{ Name: "AutoLocalize", Callback: (boolean) -> () }
	| 	{ Name: "AutomaticSize", Callback: (Enum.AutomaticSize) -> () }
	| 	{ Name: "BackgroundColor3", Callback: (Color3) -> () }
	| 	{ Name: "BackgroundTransparency", Callback: (number) -> () }
	| 	{ Name: "BorderColor3", Callback: (Color3) -> () }
	| 	{ Name: "BorderMode", Callback: (Enum.BorderMode) -> () }
	| 	{ Name: "BorderSizePixel", Callback: (number) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "ClipsDescendants", Callback: (boolean) -> () }
	| 	{ Name: "FontFace", Callback: (Font) -> () }
	| 	{ Name: "HoverHapticEffect", Callback: (HapticEffect) -> () }
	| 	{ Name: "InputSink", Callback: (Enum.InputSink) -> () }
	| 	{ Name: "Interactable", Callback: (boolean) -> () }
	| 	{ Name: "LayoutOrder", Callback: (number) -> () }
	| 	{ Name: "LineHeight", Callback: (number) -> () }
	| 	{ Name: "MaxVisibleGraphemes", Callback: (number) -> () }
	| 	{ Name: "Modal", Callback: (boolean) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "NextSelectionDown", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionLeft", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionRight", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionUp", Callback: (GuiObject) -> () }
	| 	{ Name: "OpenTypeFeatures", Callback: (string) -> () }
	| 	{ Name: "Position", Callback: (UDim2) -> () }
	| 	{ Name: "PressHapticEffect", Callback: (HapticEffect) -> () }
	| 	{ Name: "RichText", Callback: (boolean) -> () }
	| 	{ Name: "RootLocalizationTable", Callback: (LocalizationTable) -> () }
	| 	{ Name: "Rotation", Callback: (number) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "Selectable", Callback: (boolean) -> () }
	| 	{ Name: "Selected", Callback: (boolean) -> () }
	| 	{ Name: "SelectionBehaviorDown", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorLeft", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorRight", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorUp", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionGroup", Callback: (boolean) -> () }
	| 	{ Name: "SelectionImageObject", Callback: (GuiObject) -> () }
	| 	{ Name: "SelectionOrder", Callback: (number) -> () }
	| 	{ Name: "Size", Callback: (UDim2) -> () }
	| 	{ Name: "SizeConstraint", Callback: (Enum.SizeConstraint) -> () }
	| 	{ Name: "Style", Callback: (Enum.ButtonStyle) -> () }
	| 	{ Name: "Text", Callback: (string) -> () }
	| 	{ Name: "TextColor3", Callback: (Color3) -> () }
	| 	{ Name: "TextDirection", Callback: (Enum.TextDirection) -> () }
	| 	{ Name: "TextScaled", Callback: (boolean) -> () }
	| 	{ Name: "TextSize", Callback: (number) -> () }
	| 	{ Name: "TextStrokeColor3", Callback: (Color3) -> () }
	| 	{ Name: "TextStrokeTransparency", Callback: (number) -> () }
	| 	{ Name: "TextTransparency", Callback: (number) -> () }
	| 	{ Name: "TextTruncate", Callback: (Enum.TextTruncate) -> () }
	| 	{ Name: "TextWrapped", Callback: (boolean) -> () }
	| 	{ Name: "TextXAlignment", Callback: (Enum.TextXAlignment) -> () }
	| 	{ Name: "TextYAlignment", Callback: (Enum.TextYAlignment) -> () }
	| 	{ Name: "Visible", Callback: (boolean) -> () }
	| 	{ Name: "ZIndex", Callback: (number) -> () }
export type TextButtonModifier = {
	read __quadModifier: "TextButton", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: TextButtonModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: TextButtonModifier, ...any) -> any,
	As: <T>(self: TextButtonModifier, name: string?) -> T, -- 무검사(11절)
	AsTextButton: (self: TextButtonModifier) -> TextButtonModifier, -- 항등(Into<TextButton> 구현)
	Active: (self: TextButtonModifier, value: Field<boolean | Tween<boolean>>) -> TextButtonModifier,
	AnchorPoint: (self: TextButtonModifier, value: Field<Vector2 | Tween<Vector2>>) -> TextButtonModifier,
	Archivable: (self: TextButtonModifier, value: Field<boolean | Tween<boolean>>) -> TextButtonModifier,
	AutoButtonColor: (self: TextButtonModifier, value: Field<boolean | Tween<boolean>>) -> TextButtonModifier,
	AutoLocalize: (self: TextButtonModifier, value: Field<boolean | Tween<boolean>>) -> TextButtonModifier,
	AutomaticSize: (self: TextButtonModifier, value: Field<Enum.AutomaticSize | Tween<Enum.AutomaticSize>>) -> TextButtonModifier,
	BackgroundColor3: (self: TextButtonModifier, value: Field<Color3 | Tween<Color3>>) -> TextButtonModifier,
	BackgroundTransparency: (self: TextButtonModifier, value: Field<number | Tween<number>>) -> TextButtonModifier,
	BorderColor3: (self: TextButtonModifier, value: Field<Color3 | Tween<Color3>>) -> TextButtonModifier,
	BorderMode: (self: TextButtonModifier, value: Field<Enum.BorderMode | Tween<Enum.BorderMode>>) -> TextButtonModifier,
	BorderSizePixel: (self: TextButtonModifier, value: Field<number | Tween<number>>) -> TextButtonModifier,
	Capabilities: (self: TextButtonModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> TextButtonModifier,
	ClipsDescendants: (self: TextButtonModifier, value: Field<boolean | Tween<boolean>>) -> TextButtonModifier,
	FontFace: (self: TextButtonModifier, value: Field<Font | Tween<Font>>) -> TextButtonModifier,
	HoverHapticEffect: (self: TextButtonModifier, value: Field<HapticEffect | Tween<HapticEffect>>) -> TextButtonModifier,
	InputSink: (self: TextButtonModifier, value: Field<Enum.InputSink | Tween<Enum.InputSink>>) -> TextButtonModifier,
	Interactable: (self: TextButtonModifier, value: Field<boolean | Tween<boolean>>) -> TextButtonModifier,
	LayoutOrder: (self: TextButtonModifier, value: Field<number | Tween<number>>) -> TextButtonModifier,
	LineHeight: (self: TextButtonModifier, value: Field<number | Tween<number>>) -> TextButtonModifier,
	MaxVisibleGraphemes: (self: TextButtonModifier, value: Field<number | Tween<number>>) -> TextButtonModifier,
	Modal: (self: TextButtonModifier, value: Field<boolean | Tween<boolean>>) -> TextButtonModifier,
	Name: (self: TextButtonModifier, value: Field<string | Tween<string>>) -> TextButtonModifier,
	NextSelectionDown: (self: TextButtonModifier, value: Field<GuiObject | Tween<GuiObject>>) -> TextButtonModifier,
	NextSelectionLeft: (self: TextButtonModifier, value: Field<GuiObject | Tween<GuiObject>>) -> TextButtonModifier,
	NextSelectionRight: (self: TextButtonModifier, value: Field<GuiObject | Tween<GuiObject>>) -> TextButtonModifier,
	NextSelectionUp: (self: TextButtonModifier, value: Field<GuiObject | Tween<GuiObject>>) -> TextButtonModifier,
	OpenTypeFeatures: (self: TextButtonModifier, value: Field<string | Tween<string>>) -> TextButtonModifier,
	Position: (self: TextButtonModifier, value: Field<UDim2 | Tween<UDim2>>) -> TextButtonModifier,
	PressHapticEffect: (self: TextButtonModifier, value: Field<HapticEffect | Tween<HapticEffect>>) -> TextButtonModifier,
	RichText: (self: TextButtonModifier, value: Field<boolean | Tween<boolean>>) -> TextButtonModifier,
	RootLocalizationTable: (self: TextButtonModifier, value: Field<LocalizationTable | Tween<LocalizationTable>>) -> TextButtonModifier,
	Rotation: (self: TextButtonModifier, value: Field<number | Tween<number>>) -> TextButtonModifier,
	Sandboxed: (self: TextButtonModifier, value: Field<boolean | Tween<boolean>>) -> TextButtonModifier,
	Selectable: (self: TextButtonModifier, value: Field<boolean | Tween<boolean>>) -> TextButtonModifier,
	Selected: (self: TextButtonModifier, value: Field<boolean | Tween<boolean>>) -> TextButtonModifier,
	SelectionBehaviorDown: (self: TextButtonModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> TextButtonModifier,
	SelectionBehaviorLeft: (self: TextButtonModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> TextButtonModifier,
	SelectionBehaviorRight: (self: TextButtonModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> TextButtonModifier,
	SelectionBehaviorUp: (self: TextButtonModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> TextButtonModifier,
	SelectionGroup: (self: TextButtonModifier, value: Field<boolean | Tween<boolean>>) -> TextButtonModifier,
	SelectionImageObject: (self: TextButtonModifier, value: Field<GuiObject | Tween<GuiObject>>) -> TextButtonModifier,
	SelectionOrder: (self: TextButtonModifier, value: Field<number | Tween<number>>) -> TextButtonModifier,
	Size: (self: TextButtonModifier, value: Field<UDim2 | Tween<UDim2>>) -> TextButtonModifier,
	SizeConstraint: (self: TextButtonModifier, value: Field<Enum.SizeConstraint | Tween<Enum.SizeConstraint>>) -> TextButtonModifier,
	Style: (self: TextButtonModifier, value: Field<Enum.ButtonStyle | Tween<Enum.ButtonStyle>>) -> TextButtonModifier,
	Text: (self: TextButtonModifier, value: Field<string | Tween<string>>) -> TextButtonModifier,
	TextColor3: (self: TextButtonModifier, value: Field<Color3 | Tween<Color3>>) -> TextButtonModifier,
	TextDirection: (self: TextButtonModifier, value: Field<Enum.TextDirection | Tween<Enum.TextDirection>>) -> TextButtonModifier,
	TextScaled: (self: TextButtonModifier, value: Field<boolean | Tween<boolean>>) -> TextButtonModifier,
	TextSize: (self: TextButtonModifier, value: Field<number | Tween<number>>) -> TextButtonModifier,
	TextStrokeColor3: (self: TextButtonModifier, value: Field<Color3 | Tween<Color3>>) -> TextButtonModifier,
	TextStrokeTransparency: (self: TextButtonModifier, value: Field<number | Tween<number>>) -> TextButtonModifier,
	TextTransparency: (self: TextButtonModifier, value: Field<number | Tween<number>>) -> TextButtonModifier,
	TextTruncate: (self: TextButtonModifier, value: Field<Enum.TextTruncate | Tween<Enum.TextTruncate>>) -> TextButtonModifier,
	TextWrapped: (self: TextButtonModifier, value: Field<boolean | Tween<boolean>>) -> TextButtonModifier,
	TextXAlignment: (self: TextButtonModifier, value: Field<Enum.TextXAlignment | Tween<Enum.TextXAlignment>>) -> TextButtonModifier,
	TextYAlignment: (self: TextButtonModifier, value: Field<Enum.TextYAlignment | Tween<Enum.TextYAlignment>>) -> TextButtonModifier,
	Visible: (self: TextButtonModifier, value: Field<boolean | Tween<boolean>>) -> TextButtonModifier,
	ZIndex: (self: TextButtonModifier, value: Field<number | Tween<number>>) -> TextButtonModifier,
}
export type IntoTextButton = { AsTextButton: (self: any) -> TextButtonModifier }
export type TextButtonElem = NewChild | TextButtonOnChange | State<TextButtonOnChange> | { read __quadModifier: "TextButton" | "GuiButton" | "GuiObject" | "GuiBase2d" | "GuiBase" | "Instance" }
export type TextButtonMapperElem = TextButtonElem | MapperDescriptor

export type TextLabelOnChange =
	{ Name: "Active", Callback: (boolean) -> () }
	| 	{ Name: "AnchorPoint", Callback: (Vector2) -> () }
	| 	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "AutoLocalize", Callback: (boolean) -> () }
	| 	{ Name: "AutomaticSize", Callback: (Enum.AutomaticSize) -> () }
	| 	{ Name: "BackgroundColor3", Callback: (Color3) -> () }
	| 	{ Name: "BackgroundTransparency", Callback: (number) -> () }
	| 	{ Name: "BorderColor3", Callback: (Color3) -> () }
	| 	{ Name: "BorderMode", Callback: (Enum.BorderMode) -> () }
	| 	{ Name: "BorderSizePixel", Callback: (number) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "ClipsDescendants", Callback: (boolean) -> () }
	| 	{ Name: "FontFace", Callback: (Font) -> () }
	| 	{ Name: "InputSink", Callback: (Enum.InputSink) -> () }
	| 	{ Name: "Interactable", Callback: (boolean) -> () }
	| 	{ Name: "LayoutOrder", Callback: (number) -> () }
	| 	{ Name: "LineHeight", Callback: (number) -> () }
	| 	{ Name: "MaxVisibleGraphemes", Callback: (number) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "NextSelectionDown", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionLeft", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionRight", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionUp", Callback: (GuiObject) -> () }
	| 	{ Name: "OpenTypeFeatures", Callback: (string) -> () }
	| 	{ Name: "Position", Callback: (UDim2) -> () }
	| 	{ Name: "RichText", Callback: (boolean) -> () }
	| 	{ Name: "RootLocalizationTable", Callback: (LocalizationTable) -> () }
	| 	{ Name: "Rotation", Callback: (number) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "Selectable", Callback: (boolean) -> () }
	| 	{ Name: "SelectionBehaviorDown", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorLeft", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorRight", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorUp", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionGroup", Callback: (boolean) -> () }
	| 	{ Name: "SelectionImageObject", Callback: (GuiObject) -> () }
	| 	{ Name: "SelectionOrder", Callback: (number) -> () }
	| 	{ Name: "Size", Callback: (UDim2) -> () }
	| 	{ Name: "SizeConstraint", Callback: (Enum.SizeConstraint) -> () }
	| 	{ Name: "Text", Callback: (string) -> () }
	| 	{ Name: "TextColor3", Callback: (Color3) -> () }
	| 	{ Name: "TextDirection", Callback: (Enum.TextDirection) -> () }
	| 	{ Name: "TextScaled", Callback: (boolean) -> () }
	| 	{ Name: "TextSize", Callback: (number) -> () }
	| 	{ Name: "TextStrokeColor3", Callback: (Color3) -> () }
	| 	{ Name: "TextStrokeTransparency", Callback: (number) -> () }
	| 	{ Name: "TextTransparency", Callback: (number) -> () }
	| 	{ Name: "TextTruncate", Callback: (Enum.TextTruncate) -> () }
	| 	{ Name: "TextWrapped", Callback: (boolean) -> () }
	| 	{ Name: "TextXAlignment", Callback: (Enum.TextXAlignment) -> () }
	| 	{ Name: "TextYAlignment", Callback: (Enum.TextYAlignment) -> () }
	| 	{ Name: "Visible", Callback: (boolean) -> () }
	| 	{ Name: "ZIndex", Callback: (number) -> () }
export type TextLabelModifier = {
	read __quadModifier: "TextLabel", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: TextLabelModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: TextLabelModifier, ...any) -> any,
	As: <T>(self: TextLabelModifier, name: string?) -> T, -- 무검사(11절)
	AsTextLabel: (self: TextLabelModifier) -> TextLabelModifier, -- 항등(Into<TextLabel> 구현)
	Active: (self: TextLabelModifier, value: Field<boolean | Tween<boolean>>) -> TextLabelModifier,
	AnchorPoint: (self: TextLabelModifier, value: Field<Vector2 | Tween<Vector2>>) -> TextLabelModifier,
	Archivable: (self: TextLabelModifier, value: Field<boolean | Tween<boolean>>) -> TextLabelModifier,
	AutoLocalize: (self: TextLabelModifier, value: Field<boolean | Tween<boolean>>) -> TextLabelModifier,
	AutomaticSize: (self: TextLabelModifier, value: Field<Enum.AutomaticSize | Tween<Enum.AutomaticSize>>) -> TextLabelModifier,
	BackgroundColor3: (self: TextLabelModifier, value: Field<Color3 | Tween<Color3>>) -> TextLabelModifier,
	BackgroundTransparency: (self: TextLabelModifier, value: Field<number | Tween<number>>) -> TextLabelModifier,
	BorderColor3: (self: TextLabelModifier, value: Field<Color3 | Tween<Color3>>) -> TextLabelModifier,
	BorderMode: (self: TextLabelModifier, value: Field<Enum.BorderMode | Tween<Enum.BorderMode>>) -> TextLabelModifier,
	BorderSizePixel: (self: TextLabelModifier, value: Field<number | Tween<number>>) -> TextLabelModifier,
	Capabilities: (self: TextLabelModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> TextLabelModifier,
	ClipsDescendants: (self: TextLabelModifier, value: Field<boolean | Tween<boolean>>) -> TextLabelModifier,
	FontFace: (self: TextLabelModifier, value: Field<Font | Tween<Font>>) -> TextLabelModifier,
	InputSink: (self: TextLabelModifier, value: Field<Enum.InputSink | Tween<Enum.InputSink>>) -> TextLabelModifier,
	Interactable: (self: TextLabelModifier, value: Field<boolean | Tween<boolean>>) -> TextLabelModifier,
	LayoutOrder: (self: TextLabelModifier, value: Field<number | Tween<number>>) -> TextLabelModifier,
	LineHeight: (self: TextLabelModifier, value: Field<number | Tween<number>>) -> TextLabelModifier,
	MaxVisibleGraphemes: (self: TextLabelModifier, value: Field<number | Tween<number>>) -> TextLabelModifier,
	Name: (self: TextLabelModifier, value: Field<string | Tween<string>>) -> TextLabelModifier,
	NextSelectionDown: (self: TextLabelModifier, value: Field<GuiObject | Tween<GuiObject>>) -> TextLabelModifier,
	NextSelectionLeft: (self: TextLabelModifier, value: Field<GuiObject | Tween<GuiObject>>) -> TextLabelModifier,
	NextSelectionRight: (self: TextLabelModifier, value: Field<GuiObject | Tween<GuiObject>>) -> TextLabelModifier,
	NextSelectionUp: (self: TextLabelModifier, value: Field<GuiObject | Tween<GuiObject>>) -> TextLabelModifier,
	OpenTypeFeatures: (self: TextLabelModifier, value: Field<string | Tween<string>>) -> TextLabelModifier,
	Position: (self: TextLabelModifier, value: Field<UDim2 | Tween<UDim2>>) -> TextLabelModifier,
	RichText: (self: TextLabelModifier, value: Field<boolean | Tween<boolean>>) -> TextLabelModifier,
	RootLocalizationTable: (self: TextLabelModifier, value: Field<LocalizationTable | Tween<LocalizationTable>>) -> TextLabelModifier,
	Rotation: (self: TextLabelModifier, value: Field<number | Tween<number>>) -> TextLabelModifier,
	Sandboxed: (self: TextLabelModifier, value: Field<boolean | Tween<boolean>>) -> TextLabelModifier,
	Selectable: (self: TextLabelModifier, value: Field<boolean | Tween<boolean>>) -> TextLabelModifier,
	SelectionBehaviorDown: (self: TextLabelModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> TextLabelModifier,
	SelectionBehaviorLeft: (self: TextLabelModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> TextLabelModifier,
	SelectionBehaviorRight: (self: TextLabelModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> TextLabelModifier,
	SelectionBehaviorUp: (self: TextLabelModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> TextLabelModifier,
	SelectionGroup: (self: TextLabelModifier, value: Field<boolean | Tween<boolean>>) -> TextLabelModifier,
	SelectionImageObject: (self: TextLabelModifier, value: Field<GuiObject | Tween<GuiObject>>) -> TextLabelModifier,
	SelectionOrder: (self: TextLabelModifier, value: Field<number | Tween<number>>) -> TextLabelModifier,
	Size: (self: TextLabelModifier, value: Field<UDim2 | Tween<UDim2>>) -> TextLabelModifier,
	SizeConstraint: (self: TextLabelModifier, value: Field<Enum.SizeConstraint | Tween<Enum.SizeConstraint>>) -> TextLabelModifier,
	Text: (self: TextLabelModifier, value: Field<string | Tween<string>>) -> TextLabelModifier,
	TextColor3: (self: TextLabelModifier, value: Field<Color3 | Tween<Color3>>) -> TextLabelModifier,
	TextDirection: (self: TextLabelModifier, value: Field<Enum.TextDirection | Tween<Enum.TextDirection>>) -> TextLabelModifier,
	TextScaled: (self: TextLabelModifier, value: Field<boolean | Tween<boolean>>) -> TextLabelModifier,
	TextSize: (self: TextLabelModifier, value: Field<number | Tween<number>>) -> TextLabelModifier,
	TextStrokeColor3: (self: TextLabelModifier, value: Field<Color3 | Tween<Color3>>) -> TextLabelModifier,
	TextStrokeTransparency: (self: TextLabelModifier, value: Field<number | Tween<number>>) -> TextLabelModifier,
	TextTransparency: (self: TextLabelModifier, value: Field<number | Tween<number>>) -> TextLabelModifier,
	TextTruncate: (self: TextLabelModifier, value: Field<Enum.TextTruncate | Tween<Enum.TextTruncate>>) -> TextLabelModifier,
	TextWrapped: (self: TextLabelModifier, value: Field<boolean | Tween<boolean>>) -> TextLabelModifier,
	TextXAlignment: (self: TextLabelModifier, value: Field<Enum.TextXAlignment | Tween<Enum.TextXAlignment>>) -> TextLabelModifier,
	TextYAlignment: (self: TextLabelModifier, value: Field<Enum.TextYAlignment | Tween<Enum.TextYAlignment>>) -> TextLabelModifier,
	Visible: (self: TextLabelModifier, value: Field<boolean | Tween<boolean>>) -> TextLabelModifier,
	ZIndex: (self: TextLabelModifier, value: Field<number | Tween<number>>) -> TextLabelModifier,
}
export type IntoTextLabel = { AsTextLabel: (self: any) -> TextLabelModifier }
export type TextLabelElem = NewChild | TextLabelOnChange | State<TextLabelOnChange> | { read __quadModifier: "TextLabel" | "GuiLabel" | "GuiObject" | "GuiBase2d" | "GuiBase" | "Instance" }
export type TextLabelMapperElem = TextLabelElem | MapperDescriptor

export type UIAspectRatioConstraintOnChange =
	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "AspectRatio", Callback: (number) -> () }
	| 	{ Name: "AspectType", Callback: (Enum.AspectType) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "DominantAxis", Callback: (Enum.DominantAxis) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
export type UIAspectRatioConstraintModifier = {
	read __quadModifier: "UIAspectRatioConstraint", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: UIAspectRatioConstraintModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: UIAspectRatioConstraintModifier, ...any) -> any,
	As: <T>(self: UIAspectRatioConstraintModifier, name: string?) -> T, -- 무검사(11절)
	AsUIAspectRatioConstraint: (self: UIAspectRatioConstraintModifier) -> UIAspectRatioConstraintModifier, -- 항등(Into<UIAspectRatioConstraint> 구현)
	Archivable: (self: UIAspectRatioConstraintModifier, value: Field<boolean | Tween<boolean>>) -> UIAspectRatioConstraintModifier,
	AspectRatio: (self: UIAspectRatioConstraintModifier, value: Field<number | Tween<number>>) -> UIAspectRatioConstraintModifier,
	AspectType: (self: UIAspectRatioConstraintModifier, value: Field<Enum.AspectType | Tween<Enum.AspectType>>) -> UIAspectRatioConstraintModifier,
	Capabilities: (self: UIAspectRatioConstraintModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> UIAspectRatioConstraintModifier,
	DominantAxis: (self: UIAspectRatioConstraintModifier, value: Field<Enum.DominantAxis | Tween<Enum.DominantAxis>>) -> UIAspectRatioConstraintModifier,
	Name: (self: UIAspectRatioConstraintModifier, value: Field<string | Tween<string>>) -> UIAspectRatioConstraintModifier,
	Sandboxed: (self: UIAspectRatioConstraintModifier, value: Field<boolean | Tween<boolean>>) -> UIAspectRatioConstraintModifier,
}
export type IntoUIAspectRatioConstraint = { AsUIAspectRatioConstraint: (self: any) -> UIAspectRatioConstraintModifier }
export type UIAspectRatioConstraintElem = NewChild | UIAspectRatioConstraintOnChange | State<UIAspectRatioConstraintOnChange> | { read __quadModifier: "UIAspectRatioConstraint" | "UIConstraint" | "UIComponent" | "UIBase" | "Instance" }
export type UIAspectRatioConstraintMapperElem = UIAspectRatioConstraintElem | MapperDescriptor

export type UIBaseModifier = {
	read __quadModifier: "UIBase", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: UIBaseModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: UIBaseModifier, ...any) -> any,
	As: <T>(self: UIBaseModifier, name: string?) -> T, -- 무검사(11절)
	AsUIBase: (self: UIBaseModifier) -> UIBaseModifier, -- 항등(Into<UIBase> 구현)
	AsUIAspectRatioConstraint: (self: UIBaseModifier) -> UIAspectRatioConstraintModifier,
	AsUIComponent: (self: UIBaseModifier) -> UIComponentModifier,
	AsUIConstraint: (self: UIBaseModifier) -> UIConstraintModifier,
	AsUICorner: (self: UIBaseModifier) -> UICornerModifier,
	AsUIDragDetector: (self: UIBaseModifier) -> UIDragDetectorModifier,
	AsUIFlexItem: (self: UIBaseModifier) -> UIFlexItemModifier,
	AsUIGradient: (self: UIBaseModifier) -> UIGradientModifier,
	AsUIGridLayout: (self: UIBaseModifier) -> UIGridLayoutModifier,
	AsUIGridStyleLayout: (self: UIBaseModifier) -> UIGridStyleLayoutModifier,
	AsUILayout: (self: UIBaseModifier) -> UILayoutModifier,
	AsUIListLayout: (self: UIBaseModifier) -> UIListLayoutModifier,
	AsUIPadding: (self: UIBaseModifier) -> UIPaddingModifier,
	AsUIPageLayout: (self: UIBaseModifier) -> UIPageLayoutModifier,
	AsUIScale: (self: UIBaseModifier) -> UIScaleModifier,
	AsUIShadow: (self: UIBaseModifier) -> UIShadowModifier,
	AsUISizeConstraint: (self: UIBaseModifier) -> UISizeConstraintModifier,
	AsUIStroke: (self: UIBaseModifier) -> UIStrokeModifier,
	AsUITableLayout: (self: UIBaseModifier) -> UITableLayoutModifier,
	AsUITextSizeConstraint: (self: UIBaseModifier) -> UITextSizeConstraintModifier,
	Archivable: (self: UIBaseModifier, value: Field<boolean | Tween<boolean>>) -> UIBaseModifier,
	Capabilities: (self: UIBaseModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> UIBaseModifier,
	Name: (self: UIBaseModifier, value: Field<string | Tween<string>>) -> UIBaseModifier,
	Sandboxed: (self: UIBaseModifier, value: Field<boolean | Tween<boolean>>) -> UIBaseModifier,
}
export type IntoUIBase = { AsUIBase: (self: any) -> UIBaseModifier }

export type UIComponentModifier = {
	read __quadModifier: "UIComponent", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: UIComponentModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: UIComponentModifier, ...any) -> any,
	As: <T>(self: UIComponentModifier, name: string?) -> T, -- 무검사(11절)
	AsUIComponent: (self: UIComponentModifier) -> UIComponentModifier, -- 항등(Into<UIComponent> 구현)
	AsUIAspectRatioConstraint: (self: UIComponentModifier) -> UIAspectRatioConstraintModifier,
	AsUIConstraint: (self: UIComponentModifier) -> UIConstraintModifier,
	AsUICorner: (self: UIComponentModifier) -> UICornerModifier,
	AsUIDragDetector: (self: UIComponentModifier) -> UIDragDetectorModifier,
	AsUIFlexItem: (self: UIComponentModifier) -> UIFlexItemModifier,
	AsUIGradient: (self: UIComponentModifier) -> UIGradientModifier,
	AsUIGridLayout: (self: UIComponentModifier) -> UIGridLayoutModifier,
	AsUIGridStyleLayout: (self: UIComponentModifier) -> UIGridStyleLayoutModifier,
	AsUILayout: (self: UIComponentModifier) -> UILayoutModifier,
	AsUIListLayout: (self: UIComponentModifier) -> UIListLayoutModifier,
	AsUIPadding: (self: UIComponentModifier) -> UIPaddingModifier,
	AsUIPageLayout: (self: UIComponentModifier) -> UIPageLayoutModifier,
	AsUIScale: (self: UIComponentModifier) -> UIScaleModifier,
	AsUIShadow: (self: UIComponentModifier) -> UIShadowModifier,
	AsUISizeConstraint: (self: UIComponentModifier) -> UISizeConstraintModifier,
	AsUIStroke: (self: UIComponentModifier) -> UIStrokeModifier,
	AsUITableLayout: (self: UIComponentModifier) -> UITableLayoutModifier,
	AsUITextSizeConstraint: (self: UIComponentModifier) -> UITextSizeConstraintModifier,
	Archivable: (self: UIComponentModifier, value: Field<boolean | Tween<boolean>>) -> UIComponentModifier,
	Capabilities: (self: UIComponentModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> UIComponentModifier,
	Name: (self: UIComponentModifier, value: Field<string | Tween<string>>) -> UIComponentModifier,
	Sandboxed: (self: UIComponentModifier, value: Field<boolean | Tween<boolean>>) -> UIComponentModifier,
}
export type IntoUIComponent = { AsUIComponent: (self: any) -> UIComponentModifier }

export type UIConstraintModifier = {
	read __quadModifier: "UIConstraint", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: UIConstraintModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: UIConstraintModifier, ...any) -> any,
	As: <T>(self: UIConstraintModifier, name: string?) -> T, -- 무검사(11절)
	AsUIConstraint: (self: UIConstraintModifier) -> UIConstraintModifier, -- 항등(Into<UIConstraint> 구현)
	AsUIAspectRatioConstraint: (self: UIConstraintModifier) -> UIAspectRatioConstraintModifier,
	AsUISizeConstraint: (self: UIConstraintModifier) -> UISizeConstraintModifier,
	AsUITextSizeConstraint: (self: UIConstraintModifier) -> UITextSizeConstraintModifier,
	Archivable: (self: UIConstraintModifier, value: Field<boolean | Tween<boolean>>) -> UIConstraintModifier,
	Capabilities: (self: UIConstraintModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> UIConstraintModifier,
	Name: (self: UIConstraintModifier, value: Field<string | Tween<string>>) -> UIConstraintModifier,
	Sandboxed: (self: UIConstraintModifier, value: Field<boolean | Tween<boolean>>) -> UIConstraintModifier,
}
export type IntoUIConstraint = { AsUIConstraint: (self: any) -> UIConstraintModifier }

export type UICornerOnChange =
	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "BottomLeftRadius", Callback: (UDim) -> () }
	| 	{ Name: "BottomRightRadius", Callback: (UDim) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "CornerRadius", Callback: (UDim) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "TopLeftRadius", Callback: (UDim) -> () }
	| 	{ Name: "TopRightRadius", Callback: (UDim) -> () }
export type UICornerModifier = {
	read __quadModifier: "UICorner", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: UICornerModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: UICornerModifier, ...any) -> any,
	As: <T>(self: UICornerModifier, name: string?) -> T, -- 무검사(11절)
	AsUICorner: (self: UICornerModifier) -> UICornerModifier, -- 항등(Into<UICorner> 구현)
	Archivable: (self: UICornerModifier, value: Field<boolean | Tween<boolean>>) -> UICornerModifier,
	BottomLeftRadius: (self: UICornerModifier, value: Field<UDim | Tween<UDim>>) -> UICornerModifier,
	BottomRightRadius: (self: UICornerModifier, value: Field<UDim | Tween<UDim>>) -> UICornerModifier,
	Capabilities: (self: UICornerModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> UICornerModifier,
	CornerRadius: (self: UICornerModifier, value: Field<UDim | Tween<UDim>>) -> UICornerModifier,
	Name: (self: UICornerModifier, value: Field<string | Tween<string>>) -> UICornerModifier,
	Sandboxed: (self: UICornerModifier, value: Field<boolean | Tween<boolean>>) -> UICornerModifier,
	TopLeftRadius: (self: UICornerModifier, value: Field<UDim | Tween<UDim>>) -> UICornerModifier,
	TopRightRadius: (self: UICornerModifier, value: Field<UDim | Tween<UDim>>) -> UICornerModifier,
}
export type IntoUICorner = { AsUICorner: (self: any) -> UICornerModifier }
export type UICornerElem = NewChild | UICornerOnChange | State<UICornerOnChange> | { read __quadModifier: "UICorner" | "UIComponent" | "UIBase" | "Instance" }
export type UICornerMapperElem = UICornerElem | MapperDescriptor

export type UIDragDetectorOnChange =
	{ Name: "ActivatedCursorIcon", Callback: (Content) -> () }
	| 	{ Name: "ActivatedCursorIconContent", Callback: (Content) -> () }
	| 	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "BoundingBehavior", Callback: (Enum.UIDragDetectorBoundingBehavior) -> () }
	| 	{ Name: "BoundingUI", Callback: (GuiBase2d) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "CursorIcon", Callback: (Content) -> () }
	| 	{ Name: "CursorIconContent", Callback: (Content) -> () }
	| 	{ Name: "DragAxis", Callback: (Vector2) -> () }
	| 	{ Name: "DragRelativity", Callback: (Enum.UIDragDetectorDragRelativity) -> () }
	| 	{ Name: "DragRotation", Callback: (number) -> () }
	| 	{ Name: "DragSpace", Callback: (Enum.UIDragDetectorDragSpace) -> () }
	| 	{ Name: "DragStyle", Callback: (Enum.UIDragDetectorDragStyle) -> () }
	| 	{ Name: "DragUDim2", Callback: (UDim2) -> () }
	| 	{ Name: "Enabled", Callback: (boolean) -> () }
	| 	{ Name: "MaxDragAngle", Callback: (number) -> () }
	| 	{ Name: "MaxDragTranslation", Callback: (UDim2) -> () }
	| 	{ Name: "MinDragAngle", Callback: (number) -> () }
	| 	{ Name: "MinDragTranslation", Callback: (UDim2) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "ReferenceUIInstance", Callback: (GuiObject) -> () }
	| 	{ Name: "ResponseStyle", Callback: (Enum.UIDragDetectorResponseStyle) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "SelectionModeDragSpeed", Callback: (UDim2) -> () }
	| 	{ Name: "SelectionModeRotateSpeed", Callback: (number) -> () }
	| 	{ Name: "UIDragSpeedAxisMapping", Callback: (Enum.UIDragSpeedAxisMapping) -> () }
export type UIDragDetectorModifier = {
	read __quadModifier: "UIDragDetector", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: UIDragDetectorModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: UIDragDetectorModifier, ...any) -> any,
	As: <T>(self: UIDragDetectorModifier, name: string?) -> T, -- 무검사(11절)
	AsUIDragDetector: (self: UIDragDetectorModifier) -> UIDragDetectorModifier, -- 항등(Into<UIDragDetector> 구현)
	ActivatedCursorIcon: (self: UIDragDetectorModifier, value: Field<Content | Tween<Content>>) -> UIDragDetectorModifier,
	ActivatedCursorIconContent: (self: UIDragDetectorModifier, value: Field<Content | Tween<Content>>) -> UIDragDetectorModifier,
	Archivable: (self: UIDragDetectorModifier, value: Field<boolean | Tween<boolean>>) -> UIDragDetectorModifier,
	BoundingBehavior: (self: UIDragDetectorModifier, value: Field<Enum.UIDragDetectorBoundingBehavior | Tween<Enum.UIDragDetectorBoundingBehavior>>) -> UIDragDetectorModifier,
	BoundingUI: (self: UIDragDetectorModifier, value: Field<GuiBase2d | Tween<GuiBase2d>>) -> UIDragDetectorModifier,
	Capabilities: (self: UIDragDetectorModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> UIDragDetectorModifier,
	CursorIcon: (self: UIDragDetectorModifier, value: Field<Content | Tween<Content>>) -> UIDragDetectorModifier,
	CursorIconContent: (self: UIDragDetectorModifier, value: Field<Content | Tween<Content>>) -> UIDragDetectorModifier,
	DragAxis: (self: UIDragDetectorModifier, value: Field<Vector2 | Tween<Vector2>>) -> UIDragDetectorModifier,
	DragRelativity: (self: UIDragDetectorModifier, value: Field<Enum.UIDragDetectorDragRelativity | Tween<Enum.UIDragDetectorDragRelativity>>) -> UIDragDetectorModifier,
	DragRotation: (self: UIDragDetectorModifier, value: Field<number | Tween<number>>) -> UIDragDetectorModifier,
	DragSpace: (self: UIDragDetectorModifier, value: Field<Enum.UIDragDetectorDragSpace | Tween<Enum.UIDragDetectorDragSpace>>) -> UIDragDetectorModifier,
	DragStyle: (self: UIDragDetectorModifier, value: Field<Enum.UIDragDetectorDragStyle | Tween<Enum.UIDragDetectorDragStyle>>) -> UIDragDetectorModifier,
	DragUDim2: (self: UIDragDetectorModifier, value: Field<UDim2 | Tween<UDim2>>) -> UIDragDetectorModifier,
	Enabled: (self: UIDragDetectorModifier, value: Field<boolean | Tween<boolean>>) -> UIDragDetectorModifier,
	MaxDragAngle: (self: UIDragDetectorModifier, value: Field<number | Tween<number>>) -> UIDragDetectorModifier,
	MaxDragTranslation: (self: UIDragDetectorModifier, value: Field<UDim2 | Tween<UDim2>>) -> UIDragDetectorModifier,
	MinDragAngle: (self: UIDragDetectorModifier, value: Field<number | Tween<number>>) -> UIDragDetectorModifier,
	MinDragTranslation: (self: UIDragDetectorModifier, value: Field<UDim2 | Tween<UDim2>>) -> UIDragDetectorModifier,
	Name: (self: UIDragDetectorModifier, value: Field<string | Tween<string>>) -> UIDragDetectorModifier,
	ReferenceUIInstance: (self: UIDragDetectorModifier, value: Field<GuiObject | Tween<GuiObject>>) -> UIDragDetectorModifier,
	ResponseStyle: (self: UIDragDetectorModifier, value: Field<Enum.UIDragDetectorResponseStyle | Tween<Enum.UIDragDetectorResponseStyle>>) -> UIDragDetectorModifier,
	Sandboxed: (self: UIDragDetectorModifier, value: Field<boolean | Tween<boolean>>) -> UIDragDetectorModifier,
	SelectionModeDragSpeed: (self: UIDragDetectorModifier, value: Field<UDim2 | Tween<UDim2>>) -> UIDragDetectorModifier,
	SelectionModeRotateSpeed: (self: UIDragDetectorModifier, value: Field<number | Tween<number>>) -> UIDragDetectorModifier,
	UIDragSpeedAxisMapping: (self: UIDragDetectorModifier, value: Field<Enum.UIDragSpeedAxisMapping | Tween<Enum.UIDragSpeedAxisMapping>>) -> UIDragDetectorModifier,
}
export type IntoUIDragDetector = { AsUIDragDetector: (self: any) -> UIDragDetectorModifier }
export type UIDragDetectorElem = NewChild | UIDragDetectorOnChange | State<UIDragDetectorOnChange> | { read __quadModifier: "UIDragDetector" | "UIComponent" | "UIBase" | "Instance" }
export type UIDragDetectorMapperElem = UIDragDetectorElem | MapperDescriptor

export type UIFlexItemOnChange =
	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "FlexMode", Callback: (Enum.UIFlexMode) -> () }
	| 	{ Name: "GrowRatio", Callback: (number) -> () }
	| 	{ Name: "ItemLineAlignment", Callback: (Enum.ItemLineAlignment) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "ShrinkRatio", Callback: (number) -> () }
export type UIFlexItemModifier = {
	read __quadModifier: "UIFlexItem", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: UIFlexItemModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: UIFlexItemModifier, ...any) -> any,
	As: <T>(self: UIFlexItemModifier, name: string?) -> T, -- 무검사(11절)
	AsUIFlexItem: (self: UIFlexItemModifier) -> UIFlexItemModifier, -- 항등(Into<UIFlexItem> 구현)
	Archivable: (self: UIFlexItemModifier, value: Field<boolean | Tween<boolean>>) -> UIFlexItemModifier,
	Capabilities: (self: UIFlexItemModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> UIFlexItemModifier,
	FlexMode: (self: UIFlexItemModifier, value: Field<Enum.UIFlexMode | Tween<Enum.UIFlexMode>>) -> UIFlexItemModifier,
	GrowRatio: (self: UIFlexItemModifier, value: Field<number | Tween<number>>) -> UIFlexItemModifier,
	ItemLineAlignment: (self: UIFlexItemModifier, value: Field<Enum.ItemLineAlignment | Tween<Enum.ItemLineAlignment>>) -> UIFlexItemModifier,
	Name: (self: UIFlexItemModifier, value: Field<string | Tween<string>>) -> UIFlexItemModifier,
	Sandboxed: (self: UIFlexItemModifier, value: Field<boolean | Tween<boolean>>) -> UIFlexItemModifier,
	ShrinkRatio: (self: UIFlexItemModifier, value: Field<number | Tween<number>>) -> UIFlexItemModifier,
}
export type IntoUIFlexItem = { AsUIFlexItem: (self: any) -> UIFlexItemModifier }
export type UIFlexItemElem = NewChild | UIFlexItemOnChange | State<UIFlexItemOnChange> | { read __quadModifier: "UIFlexItem" | "UIComponent" | "UIBase" | "Instance" }
export type UIFlexItemMapperElem = UIFlexItemElem | MapperDescriptor

export type UIGradientOnChange =
	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "Color", Callback: (ColorSequence) -> () }
	| 	{ Name: "Enabled", Callback: (boolean) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "Offset", Callback: (Vector2) -> () }
	| 	{ Name: "Rotation", Callback: (number) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "Scale", Callback: (number) -> () }
	| 	{ Name: "TileMode", Callback: (Enum.GradientTileMode) -> () }
	| 	{ Name: "Transparency", Callback: (NumberSequence) -> () }
	| 	{ Name: "Type", Callback: (Enum.GradientType) -> () }
export type UIGradientModifier = {
	read __quadModifier: "UIGradient", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: UIGradientModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: UIGradientModifier, ...any) -> any,
	As: <T>(self: UIGradientModifier, name: string?) -> T, -- 무검사(11절)
	AsUIGradient: (self: UIGradientModifier) -> UIGradientModifier, -- 항등(Into<UIGradient> 구현)
	Archivable: (self: UIGradientModifier, value: Field<boolean | Tween<boolean>>) -> UIGradientModifier,
	Capabilities: (self: UIGradientModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> UIGradientModifier,
	Color: (self: UIGradientModifier, value: Field<ColorSequence | Tween<ColorSequence>>) -> UIGradientModifier,
	Enabled: (self: UIGradientModifier, value: Field<boolean | Tween<boolean>>) -> UIGradientModifier,
	Name: (self: UIGradientModifier, value: Field<string | Tween<string>>) -> UIGradientModifier,
	Offset: (self: UIGradientModifier, value: Field<Vector2 | Tween<Vector2>>) -> UIGradientModifier,
	Rotation: (self: UIGradientModifier, value: Field<number | Tween<number>>) -> UIGradientModifier,
	Sandboxed: (self: UIGradientModifier, value: Field<boolean | Tween<boolean>>) -> UIGradientModifier,
	Scale: (self: UIGradientModifier, value: Field<number | Tween<number>>) -> UIGradientModifier,
	TileMode: (self: UIGradientModifier, value: Field<Enum.GradientTileMode | Tween<Enum.GradientTileMode>>) -> UIGradientModifier,
	Transparency: (self: UIGradientModifier, value: Field<NumberSequence | Tween<NumberSequence>>) -> UIGradientModifier,
	Type: (self: UIGradientModifier, value: Field<Enum.GradientType | Tween<Enum.GradientType>>) -> UIGradientModifier,
}
export type IntoUIGradient = { AsUIGradient: (self: any) -> UIGradientModifier }
export type UIGradientElem = NewChild | UIGradientOnChange | State<UIGradientOnChange> | { read __quadModifier: "UIGradient" | "UIComponent" | "UIBase" | "Instance" }
export type UIGradientMapperElem = UIGradientElem | MapperDescriptor

export type UIGridLayoutOnChange =
	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "CellPadding", Callback: (UDim2) -> () }
	| 	{ Name: "CellSize", Callback: (UDim2) -> () }
	| 	{ Name: "FillDirection", Callback: (Enum.FillDirection) -> () }
	| 	{ Name: "FillDirectionMaxCells", Callback: (number) -> () }
	| 	{ Name: "HorizontalAlignment", Callback: (Enum.HorizontalAlignment) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "SortOrder", Callback: (Enum.SortOrder) -> () }
	| 	{ Name: "StartCorner", Callback: (Enum.StartCorner) -> () }
	| 	{ Name: "VerticalAlignment", Callback: (Enum.VerticalAlignment) -> () }
export type UIGridLayoutModifier = {
	read __quadModifier: "UIGridLayout", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: UIGridLayoutModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: UIGridLayoutModifier, ...any) -> any,
	As: <T>(self: UIGridLayoutModifier, name: string?) -> T, -- 무검사(11절)
	AsUIGridLayout: (self: UIGridLayoutModifier) -> UIGridLayoutModifier, -- 항등(Into<UIGridLayout> 구현)
	Archivable: (self: UIGridLayoutModifier, value: Field<boolean | Tween<boolean>>) -> UIGridLayoutModifier,
	Capabilities: (self: UIGridLayoutModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> UIGridLayoutModifier,
	CellPadding: (self: UIGridLayoutModifier, value: Field<UDim2 | Tween<UDim2>>) -> UIGridLayoutModifier,
	CellSize: (self: UIGridLayoutModifier, value: Field<UDim2 | Tween<UDim2>>) -> UIGridLayoutModifier,
	FillDirection: (self: UIGridLayoutModifier, value: Field<Enum.FillDirection | Tween<Enum.FillDirection>>) -> UIGridLayoutModifier,
	FillDirectionMaxCells: (self: UIGridLayoutModifier, value: Field<number | Tween<number>>) -> UIGridLayoutModifier,
	HorizontalAlignment: (self: UIGridLayoutModifier, value: Field<Enum.HorizontalAlignment | Tween<Enum.HorizontalAlignment>>) -> UIGridLayoutModifier,
	Name: (self: UIGridLayoutModifier, value: Field<string | Tween<string>>) -> UIGridLayoutModifier,
	Sandboxed: (self: UIGridLayoutModifier, value: Field<boolean | Tween<boolean>>) -> UIGridLayoutModifier,
	SortOrder: (self: UIGridLayoutModifier, value: Field<Enum.SortOrder | Tween<Enum.SortOrder>>) -> UIGridLayoutModifier,
	StartCorner: (self: UIGridLayoutModifier, value: Field<Enum.StartCorner | Tween<Enum.StartCorner>>) -> UIGridLayoutModifier,
	VerticalAlignment: (self: UIGridLayoutModifier, value: Field<Enum.VerticalAlignment | Tween<Enum.VerticalAlignment>>) -> UIGridLayoutModifier,
}
export type IntoUIGridLayout = { AsUIGridLayout: (self: any) -> UIGridLayoutModifier }
export type UIGridLayoutElem = NewChild | UIGridLayoutOnChange | State<UIGridLayoutOnChange> | { read __quadModifier: "UIGridLayout" | "UIGridStyleLayout" | "UILayout" | "UIComponent" | "UIBase" | "Instance" }
export type UIGridLayoutMapperElem = UIGridLayoutElem | MapperDescriptor

export type UIGridStyleLayoutModifier = {
	read __quadModifier: "UIGridStyleLayout", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: UIGridStyleLayoutModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: UIGridStyleLayoutModifier, ...any) -> any,
	As: <T>(self: UIGridStyleLayoutModifier, name: string?) -> T, -- 무검사(11절)
	AsUIGridStyleLayout: (self: UIGridStyleLayoutModifier) -> UIGridStyleLayoutModifier, -- 항등(Into<UIGridStyleLayout> 구현)
	AsUIGridLayout: (self: UIGridStyleLayoutModifier) -> UIGridLayoutModifier,
	AsUIListLayout: (self: UIGridStyleLayoutModifier) -> UIListLayoutModifier,
	AsUIPageLayout: (self: UIGridStyleLayoutModifier) -> UIPageLayoutModifier,
	AsUITableLayout: (self: UIGridStyleLayoutModifier) -> UITableLayoutModifier,
	Archivable: (self: UIGridStyleLayoutModifier, value: Field<boolean | Tween<boolean>>) -> UIGridStyleLayoutModifier,
	Capabilities: (self: UIGridStyleLayoutModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> UIGridStyleLayoutModifier,
	FillDirection: (self: UIGridStyleLayoutModifier, value: Field<Enum.FillDirection | Tween<Enum.FillDirection>>) -> UIGridStyleLayoutModifier,
	HorizontalAlignment: (self: UIGridStyleLayoutModifier, value: Field<Enum.HorizontalAlignment | Tween<Enum.HorizontalAlignment>>) -> UIGridStyleLayoutModifier,
	Name: (self: UIGridStyleLayoutModifier, value: Field<string | Tween<string>>) -> UIGridStyleLayoutModifier,
	Sandboxed: (self: UIGridStyleLayoutModifier, value: Field<boolean | Tween<boolean>>) -> UIGridStyleLayoutModifier,
	SortOrder: (self: UIGridStyleLayoutModifier, value: Field<Enum.SortOrder | Tween<Enum.SortOrder>>) -> UIGridStyleLayoutModifier,
	VerticalAlignment: (self: UIGridStyleLayoutModifier, value: Field<Enum.VerticalAlignment | Tween<Enum.VerticalAlignment>>) -> UIGridStyleLayoutModifier,
}
export type IntoUIGridStyleLayout = { AsUIGridStyleLayout: (self: any) -> UIGridStyleLayoutModifier }

export type UILayoutModifier = {
	read __quadModifier: "UILayout", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: UILayoutModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: UILayoutModifier, ...any) -> any,
	As: <T>(self: UILayoutModifier, name: string?) -> T, -- 무검사(11절)
	AsUILayout: (self: UILayoutModifier) -> UILayoutModifier, -- 항등(Into<UILayout> 구현)
	AsUIGridLayout: (self: UILayoutModifier) -> UIGridLayoutModifier,
	AsUIGridStyleLayout: (self: UILayoutModifier) -> UIGridStyleLayoutModifier,
	AsUIListLayout: (self: UILayoutModifier) -> UIListLayoutModifier,
	AsUIPageLayout: (self: UILayoutModifier) -> UIPageLayoutModifier,
	AsUITableLayout: (self: UILayoutModifier) -> UITableLayoutModifier,
	Archivable: (self: UILayoutModifier, value: Field<boolean | Tween<boolean>>) -> UILayoutModifier,
	Capabilities: (self: UILayoutModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> UILayoutModifier,
	Name: (self: UILayoutModifier, value: Field<string | Tween<string>>) -> UILayoutModifier,
	Sandboxed: (self: UILayoutModifier, value: Field<boolean | Tween<boolean>>) -> UILayoutModifier,
}
export type IntoUILayout = { AsUILayout: (self: any) -> UILayoutModifier }

export type UIListLayoutOnChange =
	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "FillDirection", Callback: (Enum.FillDirection) -> () }
	| 	{ Name: "HorizontalAlignment", Callback: (Enum.HorizontalAlignment) -> () }
	| 	{ Name: "HorizontalFlex", Callback: (Enum.UIFlexAlignment) -> () }
	| 	{ Name: "ItemLineAlignment", Callback: (Enum.ItemLineAlignment) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "Padding", Callback: (UDim) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "SortOrder", Callback: (Enum.SortOrder) -> () }
	| 	{ Name: "VerticalAlignment", Callback: (Enum.VerticalAlignment) -> () }
	| 	{ Name: "VerticalFlex", Callback: (Enum.UIFlexAlignment) -> () }
	| 	{ Name: "Wraps", Callback: (boolean) -> () }
export type UIListLayoutModifier = {
	read __quadModifier: "UIListLayout", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: UIListLayoutModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: UIListLayoutModifier, ...any) -> any,
	As: <T>(self: UIListLayoutModifier, name: string?) -> T, -- 무검사(11절)
	AsUIListLayout: (self: UIListLayoutModifier) -> UIListLayoutModifier, -- 항등(Into<UIListLayout> 구현)
	Archivable: (self: UIListLayoutModifier, value: Field<boolean | Tween<boolean>>) -> UIListLayoutModifier,
	Capabilities: (self: UIListLayoutModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> UIListLayoutModifier,
	FillDirection: (self: UIListLayoutModifier, value: Field<Enum.FillDirection | Tween<Enum.FillDirection>>) -> UIListLayoutModifier,
	HorizontalAlignment: (self: UIListLayoutModifier, value: Field<Enum.HorizontalAlignment | Tween<Enum.HorizontalAlignment>>) -> UIListLayoutModifier,
	HorizontalFlex: (self: UIListLayoutModifier, value: Field<Enum.UIFlexAlignment | Tween<Enum.UIFlexAlignment>>) -> UIListLayoutModifier,
	ItemLineAlignment: (self: UIListLayoutModifier, value: Field<Enum.ItemLineAlignment | Tween<Enum.ItemLineAlignment>>) -> UIListLayoutModifier,
	Name: (self: UIListLayoutModifier, value: Field<string | Tween<string>>) -> UIListLayoutModifier,
	Padding: (self: UIListLayoutModifier, value: Field<UDim | Tween<UDim>>) -> UIListLayoutModifier,
	Sandboxed: (self: UIListLayoutModifier, value: Field<boolean | Tween<boolean>>) -> UIListLayoutModifier,
	SortOrder: (self: UIListLayoutModifier, value: Field<Enum.SortOrder | Tween<Enum.SortOrder>>) -> UIListLayoutModifier,
	VerticalAlignment: (self: UIListLayoutModifier, value: Field<Enum.VerticalAlignment | Tween<Enum.VerticalAlignment>>) -> UIListLayoutModifier,
	VerticalFlex: (self: UIListLayoutModifier, value: Field<Enum.UIFlexAlignment | Tween<Enum.UIFlexAlignment>>) -> UIListLayoutModifier,
	Wraps: (self: UIListLayoutModifier, value: Field<boolean | Tween<boolean>>) -> UIListLayoutModifier,
}
export type IntoUIListLayout = { AsUIListLayout: (self: any) -> UIListLayoutModifier }
export type UIListLayoutElem = NewChild | UIListLayoutOnChange | State<UIListLayoutOnChange> | { read __quadModifier: "UIListLayout" | "UIGridStyleLayout" | "UILayout" | "UIComponent" | "UIBase" | "Instance" }
export type UIListLayoutMapperElem = UIListLayoutElem | MapperDescriptor

export type UIPaddingOnChange =
	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "PaddingBottom", Callback: (UDim) -> () }
	| 	{ Name: "PaddingLeft", Callback: (UDim) -> () }
	| 	{ Name: "PaddingRight", Callback: (UDim) -> () }
	| 	{ Name: "PaddingTop", Callback: (UDim) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
export type UIPaddingModifier = {
	read __quadModifier: "UIPadding", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: UIPaddingModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: UIPaddingModifier, ...any) -> any,
	As: <T>(self: UIPaddingModifier, name: string?) -> T, -- 무검사(11절)
	AsUIPadding: (self: UIPaddingModifier) -> UIPaddingModifier, -- 항등(Into<UIPadding> 구현)
	Archivable: (self: UIPaddingModifier, value: Field<boolean | Tween<boolean>>) -> UIPaddingModifier,
	Capabilities: (self: UIPaddingModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> UIPaddingModifier,
	Name: (self: UIPaddingModifier, value: Field<string | Tween<string>>) -> UIPaddingModifier,
	PaddingBottom: (self: UIPaddingModifier, value: Field<UDim | Tween<UDim>>) -> UIPaddingModifier,
	PaddingLeft: (self: UIPaddingModifier, value: Field<UDim | Tween<UDim>>) -> UIPaddingModifier,
	PaddingRight: (self: UIPaddingModifier, value: Field<UDim | Tween<UDim>>) -> UIPaddingModifier,
	PaddingTop: (self: UIPaddingModifier, value: Field<UDim | Tween<UDim>>) -> UIPaddingModifier,
	Sandboxed: (self: UIPaddingModifier, value: Field<boolean | Tween<boolean>>) -> UIPaddingModifier,
}
export type IntoUIPadding = { AsUIPadding: (self: any) -> UIPaddingModifier }
export type UIPaddingElem = NewChild | UIPaddingOnChange | State<UIPaddingOnChange> | { read __quadModifier: "UIPadding" | "UIComponent" | "UIBase" | "Instance" }
export type UIPaddingMapperElem = UIPaddingElem | MapperDescriptor

export type UIPageLayoutOnChange =
	{ Name: "Animated", Callback: (boolean) -> () }
	| 	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "Circular", Callback: (boolean) -> () }
	| 	{ Name: "EasingDirection", Callback: (Enum.EasingDirection) -> () }
	| 	{ Name: "EasingStyle", Callback: (Enum.EasingStyle) -> () }
	| 	{ Name: "FillDirection", Callback: (Enum.FillDirection) -> () }
	| 	{ Name: "GamepadInputEnabled", Callback: (boolean) -> () }
	| 	{ Name: "HorizontalAlignment", Callback: (Enum.HorizontalAlignment) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "Padding", Callback: (UDim) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "ScrollWheelInputEnabled", Callback: (boolean) -> () }
	| 	{ Name: "SortOrder", Callback: (Enum.SortOrder) -> () }
	| 	{ Name: "TouchInputEnabled", Callback: (boolean) -> () }
	| 	{ Name: "TweenTime", Callback: (number) -> () }
	| 	{ Name: "VerticalAlignment", Callback: (Enum.VerticalAlignment) -> () }
export type UIPageLayoutModifier = {
	read __quadModifier: "UIPageLayout", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: UIPageLayoutModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: UIPageLayoutModifier, ...any) -> any,
	As: <T>(self: UIPageLayoutModifier, name: string?) -> T, -- 무검사(11절)
	AsUIPageLayout: (self: UIPageLayoutModifier) -> UIPageLayoutModifier, -- 항등(Into<UIPageLayout> 구현)
	Animated: (self: UIPageLayoutModifier, value: Field<boolean | Tween<boolean>>) -> UIPageLayoutModifier,
	Archivable: (self: UIPageLayoutModifier, value: Field<boolean | Tween<boolean>>) -> UIPageLayoutModifier,
	Capabilities: (self: UIPageLayoutModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> UIPageLayoutModifier,
	Circular: (self: UIPageLayoutModifier, value: Field<boolean | Tween<boolean>>) -> UIPageLayoutModifier,
	EasingDirection: (self: UIPageLayoutModifier, value: Field<Enum.EasingDirection | Tween<Enum.EasingDirection>>) -> UIPageLayoutModifier,
	EasingStyle: (self: UIPageLayoutModifier, value: Field<Enum.EasingStyle | Tween<Enum.EasingStyle>>) -> UIPageLayoutModifier,
	FillDirection: (self: UIPageLayoutModifier, value: Field<Enum.FillDirection | Tween<Enum.FillDirection>>) -> UIPageLayoutModifier,
	GamepadInputEnabled: (self: UIPageLayoutModifier, value: Field<boolean | Tween<boolean>>) -> UIPageLayoutModifier,
	HorizontalAlignment: (self: UIPageLayoutModifier, value: Field<Enum.HorizontalAlignment | Tween<Enum.HorizontalAlignment>>) -> UIPageLayoutModifier,
	Name: (self: UIPageLayoutModifier, value: Field<string | Tween<string>>) -> UIPageLayoutModifier,
	Padding: (self: UIPageLayoutModifier, value: Field<UDim | Tween<UDim>>) -> UIPageLayoutModifier,
	Sandboxed: (self: UIPageLayoutModifier, value: Field<boolean | Tween<boolean>>) -> UIPageLayoutModifier,
	ScrollWheelInputEnabled: (self: UIPageLayoutModifier, value: Field<boolean | Tween<boolean>>) -> UIPageLayoutModifier,
	SortOrder: (self: UIPageLayoutModifier, value: Field<Enum.SortOrder | Tween<Enum.SortOrder>>) -> UIPageLayoutModifier,
	TouchInputEnabled: (self: UIPageLayoutModifier, value: Field<boolean | Tween<boolean>>) -> UIPageLayoutModifier,
	TweenTime: (self: UIPageLayoutModifier, value: Field<number | Tween<number>>) -> UIPageLayoutModifier,
	VerticalAlignment: (self: UIPageLayoutModifier, value: Field<Enum.VerticalAlignment | Tween<Enum.VerticalAlignment>>) -> UIPageLayoutModifier,
}
export type IntoUIPageLayout = { AsUIPageLayout: (self: any) -> UIPageLayoutModifier }
export type UIPageLayoutElem = NewChild | UIPageLayoutOnChange | State<UIPageLayoutOnChange> | { read __quadModifier: "UIPageLayout" | "UIGridStyleLayout" | "UILayout" | "UIComponent" | "UIBase" | "Instance" }
export type UIPageLayoutMapperElem = UIPageLayoutElem | MapperDescriptor

export type UIScaleOnChange =
	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "Scale", Callback: (number) -> () }
export type UIScaleModifier = {
	read __quadModifier: "UIScale", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: UIScaleModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: UIScaleModifier, ...any) -> any,
	As: <T>(self: UIScaleModifier, name: string?) -> T, -- 무검사(11절)
	AsUIScale: (self: UIScaleModifier) -> UIScaleModifier, -- 항등(Into<UIScale> 구현)
	Archivable: (self: UIScaleModifier, value: Field<boolean | Tween<boolean>>) -> UIScaleModifier,
	Capabilities: (self: UIScaleModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> UIScaleModifier,
	Name: (self: UIScaleModifier, value: Field<string | Tween<string>>) -> UIScaleModifier,
	Sandboxed: (self: UIScaleModifier, value: Field<boolean | Tween<boolean>>) -> UIScaleModifier,
	Scale: (self: UIScaleModifier, value: Field<number | Tween<number>>) -> UIScaleModifier,
}
export type IntoUIScale = { AsUIScale: (self: any) -> UIScaleModifier }
export type UIScaleElem = NewChild | UIScaleOnChange | State<UIScaleOnChange> | { read __quadModifier: "UIScale" | "UIComponent" | "UIBase" | "Instance" }
export type UIScaleMapperElem = UIScaleElem | MapperDescriptor

export type UIShadowOnChange =
	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "BlurRadius", Callback: (UDim) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "Color", Callback: (Color3) -> () }
	| 	{ Name: "Enabled", Callback: (boolean) -> () }
	| 	{ Name: "Inset", Callback: (boolean) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "Offset", Callback: (UDim2) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "ShowBehindParent", Callback: (boolean) -> () }
	| 	{ Name: "Spread", Callback: (UDim2) -> () }
	| 	{ Name: "Transparency", Callback: (number) -> () }
	| 	{ Name: "ZIndex", Callback: (number) -> () }
export type UIShadowModifier = {
	read __quadModifier: "UIShadow", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: UIShadowModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: UIShadowModifier, ...any) -> any,
	As: <T>(self: UIShadowModifier, name: string?) -> T, -- 무검사(11절)
	AsUIShadow: (self: UIShadowModifier) -> UIShadowModifier, -- 항등(Into<UIShadow> 구현)
	Archivable: (self: UIShadowModifier, value: Field<boolean | Tween<boolean>>) -> UIShadowModifier,
	BlurRadius: (self: UIShadowModifier, value: Field<UDim | Tween<UDim>>) -> UIShadowModifier,
	Capabilities: (self: UIShadowModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> UIShadowModifier,
	Color: (self: UIShadowModifier, value: Field<Color3 | Tween<Color3>>) -> UIShadowModifier,
	Enabled: (self: UIShadowModifier, value: Field<boolean | Tween<boolean>>) -> UIShadowModifier,
	Inset: (self: UIShadowModifier, value: Field<boolean | Tween<boolean>>) -> UIShadowModifier,
	Name: (self: UIShadowModifier, value: Field<string | Tween<string>>) -> UIShadowModifier,
	Offset: (self: UIShadowModifier, value: Field<UDim2 | Tween<UDim2>>) -> UIShadowModifier,
	Sandboxed: (self: UIShadowModifier, value: Field<boolean | Tween<boolean>>) -> UIShadowModifier,
	ShowBehindParent: (self: UIShadowModifier, value: Field<boolean | Tween<boolean>>) -> UIShadowModifier,
	Spread: (self: UIShadowModifier, value: Field<UDim2 | Tween<UDim2>>) -> UIShadowModifier,
	Transparency: (self: UIShadowModifier, value: Field<number | Tween<number>>) -> UIShadowModifier,
	ZIndex: (self: UIShadowModifier, value: Field<number | Tween<number>>) -> UIShadowModifier,
}
export type IntoUIShadow = { AsUIShadow: (self: any) -> UIShadowModifier }
export type UIShadowElem = NewChild | UIShadowOnChange | State<UIShadowOnChange> | { read __quadModifier: "UIShadow" | "UIComponent" | "UIBase" | "Instance" }
export type UIShadowMapperElem = UIShadowElem | MapperDescriptor

export type UISizeConstraintOnChange =
	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "MaxSize", Callback: (Vector2) -> () }
	| 	{ Name: "MinSize", Callback: (Vector2) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
export type UISizeConstraintModifier = {
	read __quadModifier: "UISizeConstraint", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: UISizeConstraintModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: UISizeConstraintModifier, ...any) -> any,
	As: <T>(self: UISizeConstraintModifier, name: string?) -> T, -- 무검사(11절)
	AsUISizeConstraint: (self: UISizeConstraintModifier) -> UISizeConstraintModifier, -- 항등(Into<UISizeConstraint> 구현)
	Archivable: (self: UISizeConstraintModifier, value: Field<boolean | Tween<boolean>>) -> UISizeConstraintModifier,
	Capabilities: (self: UISizeConstraintModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> UISizeConstraintModifier,
	MaxSize: (self: UISizeConstraintModifier, value: Field<Vector2 | Tween<Vector2>>) -> UISizeConstraintModifier,
	MinSize: (self: UISizeConstraintModifier, value: Field<Vector2 | Tween<Vector2>>) -> UISizeConstraintModifier,
	Name: (self: UISizeConstraintModifier, value: Field<string | Tween<string>>) -> UISizeConstraintModifier,
	Sandboxed: (self: UISizeConstraintModifier, value: Field<boolean | Tween<boolean>>) -> UISizeConstraintModifier,
}
export type IntoUISizeConstraint = { AsUISizeConstraint: (self: any) -> UISizeConstraintModifier }
export type UISizeConstraintElem = NewChild | UISizeConstraintOnChange | State<UISizeConstraintOnChange> | { read __quadModifier: "UISizeConstraint" | "UIConstraint" | "UIComponent" | "UIBase" | "Instance" }
export type UISizeConstraintMapperElem = UISizeConstraintElem | MapperDescriptor

export type UIStrokeOnChange =
	{ Name: "ApplyStrokeMode", Callback: (Enum.ApplyStrokeMode) -> () }
	| 	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "BorderOffset", Callback: (UDim) -> () }
	| 	{ Name: "BorderStrokePosition", Callback: (Enum.BorderStrokePosition) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "Color", Callback: (Color3) -> () }
	| 	{ Name: "Enabled", Callback: (boolean) -> () }
	| 	{ Name: "LineJoinMode", Callback: (Enum.LineJoinMode) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "StrokeSizingMode", Callback: (Enum.StrokeSizingMode) -> () }
	| 	{ Name: "Thickness", Callback: (number) -> () }
	| 	{ Name: "Transparency", Callback: (number) -> () }
	| 	{ Name: "ZIndex", Callback: (number) -> () }
export type UIStrokeModifier = {
	read __quadModifier: "UIStroke", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: UIStrokeModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: UIStrokeModifier, ...any) -> any,
	As: <T>(self: UIStrokeModifier, name: string?) -> T, -- 무검사(11절)
	AsUIStroke: (self: UIStrokeModifier) -> UIStrokeModifier, -- 항등(Into<UIStroke> 구현)
	ApplyStrokeMode: (self: UIStrokeModifier, value: Field<Enum.ApplyStrokeMode | Tween<Enum.ApplyStrokeMode>>) -> UIStrokeModifier,
	Archivable: (self: UIStrokeModifier, value: Field<boolean | Tween<boolean>>) -> UIStrokeModifier,
	BorderOffset: (self: UIStrokeModifier, value: Field<UDim | Tween<UDim>>) -> UIStrokeModifier,
	BorderStrokePosition: (self: UIStrokeModifier, value: Field<Enum.BorderStrokePosition | Tween<Enum.BorderStrokePosition>>) -> UIStrokeModifier,
	Capabilities: (self: UIStrokeModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> UIStrokeModifier,
	Color: (self: UIStrokeModifier, value: Field<Color3 | Tween<Color3>>) -> UIStrokeModifier,
	Enabled: (self: UIStrokeModifier, value: Field<boolean | Tween<boolean>>) -> UIStrokeModifier,
	LineJoinMode: (self: UIStrokeModifier, value: Field<Enum.LineJoinMode | Tween<Enum.LineJoinMode>>) -> UIStrokeModifier,
	Name: (self: UIStrokeModifier, value: Field<string | Tween<string>>) -> UIStrokeModifier,
	Sandboxed: (self: UIStrokeModifier, value: Field<boolean | Tween<boolean>>) -> UIStrokeModifier,
	StrokeSizingMode: (self: UIStrokeModifier, value: Field<Enum.StrokeSizingMode | Tween<Enum.StrokeSizingMode>>) -> UIStrokeModifier,
	Thickness: (self: UIStrokeModifier, value: Field<number | Tween<number>>) -> UIStrokeModifier,
	Transparency: (self: UIStrokeModifier, value: Field<number | Tween<number>>) -> UIStrokeModifier,
	ZIndex: (self: UIStrokeModifier, value: Field<number | Tween<number>>) -> UIStrokeModifier,
}
export type IntoUIStroke = { AsUIStroke: (self: any) -> UIStrokeModifier }
export type UIStrokeElem = NewChild | UIStrokeOnChange | State<UIStrokeOnChange> | { read __quadModifier: "UIStroke" | "UIComponent" | "UIBase" | "Instance" }
export type UIStrokeMapperElem = UIStrokeElem | MapperDescriptor

export type UITableLayoutOnChange =
	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "FillDirection", Callback: (Enum.FillDirection) -> () }
	| 	{ Name: "FillEmptySpaceColumns", Callback: (boolean) -> () }
	| 	{ Name: "FillEmptySpaceRows", Callback: (boolean) -> () }
	| 	{ Name: "HorizontalAlignment", Callback: (Enum.HorizontalAlignment) -> () }
	| 	{ Name: "MajorAxis", Callback: (Enum.TableMajorAxis) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "Padding", Callback: (UDim2) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "SortOrder", Callback: (Enum.SortOrder) -> () }
	| 	{ Name: "VerticalAlignment", Callback: (Enum.VerticalAlignment) -> () }
export type UITableLayoutModifier = {
	read __quadModifier: "UITableLayout", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: UITableLayoutModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: UITableLayoutModifier, ...any) -> any,
	As: <T>(self: UITableLayoutModifier, name: string?) -> T, -- 무검사(11절)
	AsUITableLayout: (self: UITableLayoutModifier) -> UITableLayoutModifier, -- 항등(Into<UITableLayout> 구현)
	Archivable: (self: UITableLayoutModifier, value: Field<boolean | Tween<boolean>>) -> UITableLayoutModifier,
	Capabilities: (self: UITableLayoutModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> UITableLayoutModifier,
	FillDirection: (self: UITableLayoutModifier, value: Field<Enum.FillDirection | Tween<Enum.FillDirection>>) -> UITableLayoutModifier,
	FillEmptySpaceColumns: (self: UITableLayoutModifier, value: Field<boolean | Tween<boolean>>) -> UITableLayoutModifier,
	FillEmptySpaceRows: (self: UITableLayoutModifier, value: Field<boolean | Tween<boolean>>) -> UITableLayoutModifier,
	HorizontalAlignment: (self: UITableLayoutModifier, value: Field<Enum.HorizontalAlignment | Tween<Enum.HorizontalAlignment>>) -> UITableLayoutModifier,
	MajorAxis: (self: UITableLayoutModifier, value: Field<Enum.TableMajorAxis | Tween<Enum.TableMajorAxis>>) -> UITableLayoutModifier,
	Name: (self: UITableLayoutModifier, value: Field<string | Tween<string>>) -> UITableLayoutModifier,
	Padding: (self: UITableLayoutModifier, value: Field<UDim2 | Tween<UDim2>>) -> UITableLayoutModifier,
	Sandboxed: (self: UITableLayoutModifier, value: Field<boolean | Tween<boolean>>) -> UITableLayoutModifier,
	SortOrder: (self: UITableLayoutModifier, value: Field<Enum.SortOrder | Tween<Enum.SortOrder>>) -> UITableLayoutModifier,
	VerticalAlignment: (self: UITableLayoutModifier, value: Field<Enum.VerticalAlignment | Tween<Enum.VerticalAlignment>>) -> UITableLayoutModifier,
}
export type IntoUITableLayout = { AsUITableLayout: (self: any) -> UITableLayoutModifier }
export type UITableLayoutElem = NewChild | UITableLayoutOnChange | State<UITableLayoutOnChange> | { read __quadModifier: "UITableLayout" | "UIGridStyleLayout" | "UILayout" | "UIComponent" | "UIBase" | "Instance" }
export type UITableLayoutMapperElem = UITableLayoutElem | MapperDescriptor

export type UITextSizeConstraintOnChange =
	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "MaxTextSize", Callback: (number) -> () }
	| 	{ Name: "MinTextSize", Callback: (number) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
export type UITextSizeConstraintModifier = {
	read __quadModifier: "UITextSizeConstraint", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: UITextSizeConstraintModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: UITextSizeConstraintModifier, ...any) -> any,
	As: <T>(self: UITextSizeConstraintModifier, name: string?) -> T, -- 무검사(11절)
	AsUITextSizeConstraint: (self: UITextSizeConstraintModifier) -> UITextSizeConstraintModifier, -- 항등(Into<UITextSizeConstraint> 구현)
	Archivable: (self: UITextSizeConstraintModifier, value: Field<boolean | Tween<boolean>>) -> UITextSizeConstraintModifier,
	Capabilities: (self: UITextSizeConstraintModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> UITextSizeConstraintModifier,
	MaxTextSize: (self: UITextSizeConstraintModifier, value: Field<number | Tween<number>>) -> UITextSizeConstraintModifier,
	MinTextSize: (self: UITextSizeConstraintModifier, value: Field<number | Tween<number>>) -> UITextSizeConstraintModifier,
	Name: (self: UITextSizeConstraintModifier, value: Field<string | Tween<string>>) -> UITextSizeConstraintModifier,
	Sandboxed: (self: UITextSizeConstraintModifier, value: Field<boolean | Tween<boolean>>) -> UITextSizeConstraintModifier,
}
export type IntoUITextSizeConstraint = { AsUITextSizeConstraint: (self: any) -> UITextSizeConstraintModifier }
export type UITextSizeConstraintElem = NewChild | UITextSizeConstraintOnChange | State<UITextSizeConstraintOnChange> | { read __quadModifier: "UITextSizeConstraint" | "UIConstraint" | "UIComponent" | "UIBase" | "Instance" }
export type UITextSizeConstraintMapperElem = UITextSizeConstraintElem | MapperDescriptor

export type VideoFrameOnChange =
	{ Name: "Active", Callback: (boolean) -> () }
	| 	{ Name: "AnchorPoint", Callback: (Vector2) -> () }
	| 	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "AutoLocalize", Callback: (boolean) -> () }
	| 	{ Name: "AutomaticSize", Callback: (Enum.AutomaticSize) -> () }
	| 	{ Name: "BackgroundColor3", Callback: (Color3) -> () }
	| 	{ Name: "BackgroundTransparency", Callback: (number) -> () }
	| 	{ Name: "BorderColor3", Callback: (Color3) -> () }
	| 	{ Name: "BorderMode", Callback: (Enum.BorderMode) -> () }
	| 	{ Name: "BorderSizePixel", Callback: (number) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "ClipsDescendants", Callback: (boolean) -> () }
	| 	{ Name: "InputSink", Callback: (Enum.InputSink) -> () }
	| 	{ Name: "Interactable", Callback: (boolean) -> () }
	| 	{ Name: "LayoutOrder", Callback: (number) -> () }
	| 	{ Name: "Looped", Callback: (boolean) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "NextSelectionDown", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionLeft", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionRight", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionUp", Callback: (GuiObject) -> () }
	| 	{ Name: "Playing", Callback: (boolean) -> () }
	| 	{ Name: "Position", Callback: (UDim2) -> () }
	| 	{ Name: "RollOffMaxDistance", Callback: (number) -> () }
	| 	{ Name: "RollOffMinDistance", Callback: (number) -> () }
	| 	{ Name: "RollOffMode", Callback: (Enum.RollOffMode) -> () }
	| 	{ Name: "RootLocalizationTable", Callback: (LocalizationTable) -> () }
	| 	{ Name: "Rotation", Callback: (number) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "Selectable", Callback: (boolean) -> () }
	| 	{ Name: "SelectionBehaviorDown", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorLeft", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorRight", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorUp", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionGroup", Callback: (boolean) -> () }
	| 	{ Name: "SelectionImageObject", Callback: (GuiObject) -> () }
	| 	{ Name: "SelectionOrder", Callback: (number) -> () }
	| 	{ Name: "Size", Callback: (UDim2) -> () }
	| 	{ Name: "SizeConstraint", Callback: (Enum.SizeConstraint) -> () }
	| 	{ Name: "TimePosition", Callback: (number) -> () }
	| 	{ Name: "Video", Callback: (Content) -> () }
	| 	{ Name: "VideoContent", Callback: (Content) -> () }
	| 	{ Name: "Visible", Callback: (boolean) -> () }
	| 	{ Name: "Volume", Callback: (number) -> () }
	| 	{ Name: "ZIndex", Callback: (number) -> () }
export type VideoFrameModifier = {
	read __quadModifier: "VideoFrame", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: VideoFrameModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: VideoFrameModifier, ...any) -> any,
	As: <T>(self: VideoFrameModifier, name: string?) -> T, -- 무검사(11절)
	AsVideoFrame: (self: VideoFrameModifier) -> VideoFrameModifier, -- 항등(Into<VideoFrame> 구현)
	Active: (self: VideoFrameModifier, value: Field<boolean | Tween<boolean>>) -> VideoFrameModifier,
	AnchorPoint: (self: VideoFrameModifier, value: Field<Vector2 | Tween<Vector2>>) -> VideoFrameModifier,
	Archivable: (self: VideoFrameModifier, value: Field<boolean | Tween<boolean>>) -> VideoFrameModifier,
	AutoLocalize: (self: VideoFrameModifier, value: Field<boolean | Tween<boolean>>) -> VideoFrameModifier,
	AutomaticSize: (self: VideoFrameModifier, value: Field<Enum.AutomaticSize | Tween<Enum.AutomaticSize>>) -> VideoFrameModifier,
	BackgroundColor3: (self: VideoFrameModifier, value: Field<Color3 | Tween<Color3>>) -> VideoFrameModifier,
	BackgroundTransparency: (self: VideoFrameModifier, value: Field<number | Tween<number>>) -> VideoFrameModifier,
	BorderColor3: (self: VideoFrameModifier, value: Field<Color3 | Tween<Color3>>) -> VideoFrameModifier,
	BorderMode: (self: VideoFrameModifier, value: Field<Enum.BorderMode | Tween<Enum.BorderMode>>) -> VideoFrameModifier,
	BorderSizePixel: (self: VideoFrameModifier, value: Field<number | Tween<number>>) -> VideoFrameModifier,
	Capabilities: (self: VideoFrameModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> VideoFrameModifier,
	ClipsDescendants: (self: VideoFrameModifier, value: Field<boolean | Tween<boolean>>) -> VideoFrameModifier,
	InputSink: (self: VideoFrameModifier, value: Field<Enum.InputSink | Tween<Enum.InputSink>>) -> VideoFrameModifier,
	Interactable: (self: VideoFrameModifier, value: Field<boolean | Tween<boolean>>) -> VideoFrameModifier,
	LayoutOrder: (self: VideoFrameModifier, value: Field<number | Tween<number>>) -> VideoFrameModifier,
	Looped: (self: VideoFrameModifier, value: Field<boolean | Tween<boolean>>) -> VideoFrameModifier,
	Name: (self: VideoFrameModifier, value: Field<string | Tween<string>>) -> VideoFrameModifier,
	NextSelectionDown: (self: VideoFrameModifier, value: Field<GuiObject | Tween<GuiObject>>) -> VideoFrameModifier,
	NextSelectionLeft: (self: VideoFrameModifier, value: Field<GuiObject | Tween<GuiObject>>) -> VideoFrameModifier,
	NextSelectionRight: (self: VideoFrameModifier, value: Field<GuiObject | Tween<GuiObject>>) -> VideoFrameModifier,
	NextSelectionUp: (self: VideoFrameModifier, value: Field<GuiObject | Tween<GuiObject>>) -> VideoFrameModifier,
	Playing: (self: VideoFrameModifier, value: Field<boolean | Tween<boolean>>) -> VideoFrameModifier,
	Position: (self: VideoFrameModifier, value: Field<UDim2 | Tween<UDim2>>) -> VideoFrameModifier,
	RollOffMaxDistance: (self: VideoFrameModifier, value: Field<number | Tween<number>>) -> VideoFrameModifier,
	RollOffMinDistance: (self: VideoFrameModifier, value: Field<number | Tween<number>>) -> VideoFrameModifier,
	RollOffMode: (self: VideoFrameModifier, value: Field<Enum.RollOffMode | Tween<Enum.RollOffMode>>) -> VideoFrameModifier,
	RootLocalizationTable: (self: VideoFrameModifier, value: Field<LocalizationTable | Tween<LocalizationTable>>) -> VideoFrameModifier,
	Rotation: (self: VideoFrameModifier, value: Field<number | Tween<number>>) -> VideoFrameModifier,
	Sandboxed: (self: VideoFrameModifier, value: Field<boolean | Tween<boolean>>) -> VideoFrameModifier,
	Selectable: (self: VideoFrameModifier, value: Field<boolean | Tween<boolean>>) -> VideoFrameModifier,
	SelectionBehaviorDown: (self: VideoFrameModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> VideoFrameModifier,
	SelectionBehaviorLeft: (self: VideoFrameModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> VideoFrameModifier,
	SelectionBehaviorRight: (self: VideoFrameModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> VideoFrameModifier,
	SelectionBehaviorUp: (self: VideoFrameModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> VideoFrameModifier,
	SelectionGroup: (self: VideoFrameModifier, value: Field<boolean | Tween<boolean>>) -> VideoFrameModifier,
	SelectionImageObject: (self: VideoFrameModifier, value: Field<GuiObject | Tween<GuiObject>>) -> VideoFrameModifier,
	SelectionOrder: (self: VideoFrameModifier, value: Field<number | Tween<number>>) -> VideoFrameModifier,
	Size: (self: VideoFrameModifier, value: Field<UDim2 | Tween<UDim2>>) -> VideoFrameModifier,
	SizeConstraint: (self: VideoFrameModifier, value: Field<Enum.SizeConstraint | Tween<Enum.SizeConstraint>>) -> VideoFrameModifier,
	TimePosition: (self: VideoFrameModifier, value: Field<number | Tween<number>>) -> VideoFrameModifier,
	Video: (self: VideoFrameModifier, value: Field<Content | Tween<Content>>) -> VideoFrameModifier,
	VideoContent: (self: VideoFrameModifier, value: Field<Content | Tween<Content>>) -> VideoFrameModifier,
	Visible: (self: VideoFrameModifier, value: Field<boolean | Tween<boolean>>) -> VideoFrameModifier,
	Volume: (self: VideoFrameModifier, value: Field<number | Tween<number>>) -> VideoFrameModifier,
	ZIndex: (self: VideoFrameModifier, value: Field<number | Tween<number>>) -> VideoFrameModifier,
}
export type IntoVideoFrame = { AsVideoFrame: (self: any) -> VideoFrameModifier }
export type VideoFrameElem = NewChild | VideoFrameOnChange | State<VideoFrameOnChange> | { read __quadModifier: "VideoFrame" | "GuiObject" | "GuiBase2d" | "GuiBase" | "Instance" }
export type VideoFrameMapperElem = VideoFrameElem | MapperDescriptor

export type ViewportFrameOnChange =
	{ Name: "Active", Callback: (boolean) -> () }
	| 	{ Name: "Ambient", Callback: (Color3) -> () }
	| 	{ Name: "AnchorPoint", Callback: (Vector2) -> () }
	| 	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "AutoLocalize", Callback: (boolean) -> () }
	| 	{ Name: "AutomaticSize", Callback: (Enum.AutomaticSize) -> () }
	| 	{ Name: "BackgroundColor3", Callback: (Color3) -> () }
	| 	{ Name: "BackgroundTransparency", Callback: (number) -> () }
	| 	{ Name: "BorderColor3", Callback: (Color3) -> () }
	| 	{ Name: "BorderMode", Callback: (Enum.BorderMode) -> () }
	| 	{ Name: "BorderSizePixel", Callback: (number) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "ClipsDescendants", Callback: (boolean) -> () }
	| 	{ Name: "CurrentCamera", Callback: (Camera) -> () }
	| 	{ Name: "ImageColor3", Callback: (Color3) -> () }
	| 	{ Name: "ImageTransparency", Callback: (number) -> () }
	| 	{ Name: "InputSink", Callback: (Enum.InputSink) -> () }
	| 	{ Name: "Interactable", Callback: (boolean) -> () }
	| 	{ Name: "LayoutOrder", Callback: (number) -> () }
	| 	{ Name: "LightColor", Callback: (Color3) -> () }
	| 	{ Name: "LightDirection", Callback: (Vector3) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "NextSelectionDown", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionLeft", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionRight", Callback: (GuiObject) -> () }
	| 	{ Name: "NextSelectionUp", Callback: (GuiObject) -> () }
	| 	{ Name: "Position", Callback: (UDim2) -> () }
	| 	{ Name: "RootLocalizationTable", Callback: (LocalizationTable) -> () }
	| 	{ Name: "Rotation", Callback: (number) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "Selectable", Callback: (boolean) -> () }
	| 	{ Name: "SelectionBehaviorDown", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorLeft", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorRight", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionBehaviorUp", Callback: (Enum.SelectionBehavior) -> () }
	| 	{ Name: "SelectionGroup", Callback: (boolean) -> () }
	| 	{ Name: "SelectionImageObject", Callback: (GuiObject) -> () }
	| 	{ Name: "SelectionOrder", Callback: (number) -> () }
	| 	{ Name: "Size", Callback: (UDim2) -> () }
	| 	{ Name: "SizeConstraint", Callback: (Enum.SizeConstraint) -> () }
	| 	{ Name: "Visible", Callback: (boolean) -> () }
	| 	{ Name: "ZIndex", Callback: (number) -> () }
export type ViewportFrameModifier = {
	read __quadModifier: "ViewportFrame", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: ViewportFrameModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: ViewportFrameModifier, ...any) -> any,
	As: <T>(self: ViewportFrameModifier, name: string?) -> T, -- 무검사(11절)
	AsViewportFrame: (self: ViewportFrameModifier) -> ViewportFrameModifier, -- 항등(Into<ViewportFrame> 구현)
	Active: (self: ViewportFrameModifier, value: Field<boolean | Tween<boolean>>) -> ViewportFrameModifier,
	Ambient: (self: ViewportFrameModifier, value: Field<Color3 | Tween<Color3>>) -> ViewportFrameModifier,
	AnchorPoint: (self: ViewportFrameModifier, value: Field<Vector2 | Tween<Vector2>>) -> ViewportFrameModifier,
	Archivable: (self: ViewportFrameModifier, value: Field<boolean | Tween<boolean>>) -> ViewportFrameModifier,
	AutoLocalize: (self: ViewportFrameModifier, value: Field<boolean | Tween<boolean>>) -> ViewportFrameModifier,
	AutomaticSize: (self: ViewportFrameModifier, value: Field<Enum.AutomaticSize | Tween<Enum.AutomaticSize>>) -> ViewportFrameModifier,
	BackgroundColor3: (self: ViewportFrameModifier, value: Field<Color3 | Tween<Color3>>) -> ViewportFrameModifier,
	BackgroundTransparency: (self: ViewportFrameModifier, value: Field<number | Tween<number>>) -> ViewportFrameModifier,
	BorderColor3: (self: ViewportFrameModifier, value: Field<Color3 | Tween<Color3>>) -> ViewportFrameModifier,
	BorderMode: (self: ViewportFrameModifier, value: Field<Enum.BorderMode | Tween<Enum.BorderMode>>) -> ViewportFrameModifier,
	BorderSizePixel: (self: ViewportFrameModifier, value: Field<number | Tween<number>>) -> ViewportFrameModifier,
	Capabilities: (self: ViewportFrameModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> ViewportFrameModifier,
	ClipsDescendants: (self: ViewportFrameModifier, value: Field<boolean | Tween<boolean>>) -> ViewportFrameModifier,
	CurrentCamera: (self: ViewportFrameModifier, value: Field<Camera | Tween<Camera>>) -> ViewportFrameModifier,
	ImageColor3: (self: ViewportFrameModifier, value: Field<Color3 | Tween<Color3>>) -> ViewportFrameModifier,
	ImageTransparency: (self: ViewportFrameModifier, value: Field<number | Tween<number>>) -> ViewportFrameModifier,
	InputSink: (self: ViewportFrameModifier, value: Field<Enum.InputSink | Tween<Enum.InputSink>>) -> ViewportFrameModifier,
	Interactable: (self: ViewportFrameModifier, value: Field<boolean | Tween<boolean>>) -> ViewportFrameModifier,
	LayoutOrder: (self: ViewportFrameModifier, value: Field<number | Tween<number>>) -> ViewportFrameModifier,
	LightColor: (self: ViewportFrameModifier, value: Field<Color3 | Tween<Color3>>) -> ViewportFrameModifier,
	LightDirection: (self: ViewportFrameModifier, value: Field<Vector3 | Tween<Vector3>>) -> ViewportFrameModifier,
	Name: (self: ViewportFrameModifier, value: Field<string | Tween<string>>) -> ViewportFrameModifier,
	NextSelectionDown: (self: ViewportFrameModifier, value: Field<GuiObject | Tween<GuiObject>>) -> ViewportFrameModifier,
	NextSelectionLeft: (self: ViewportFrameModifier, value: Field<GuiObject | Tween<GuiObject>>) -> ViewportFrameModifier,
	NextSelectionRight: (self: ViewportFrameModifier, value: Field<GuiObject | Tween<GuiObject>>) -> ViewportFrameModifier,
	NextSelectionUp: (self: ViewportFrameModifier, value: Field<GuiObject | Tween<GuiObject>>) -> ViewportFrameModifier,
	Position: (self: ViewportFrameModifier, value: Field<UDim2 | Tween<UDim2>>) -> ViewportFrameModifier,
	RootLocalizationTable: (self: ViewportFrameModifier, value: Field<LocalizationTable | Tween<LocalizationTable>>) -> ViewportFrameModifier,
	Rotation: (self: ViewportFrameModifier, value: Field<number | Tween<number>>) -> ViewportFrameModifier,
	Sandboxed: (self: ViewportFrameModifier, value: Field<boolean | Tween<boolean>>) -> ViewportFrameModifier,
	Selectable: (self: ViewportFrameModifier, value: Field<boolean | Tween<boolean>>) -> ViewportFrameModifier,
	SelectionBehaviorDown: (self: ViewportFrameModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> ViewportFrameModifier,
	SelectionBehaviorLeft: (self: ViewportFrameModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> ViewportFrameModifier,
	SelectionBehaviorRight: (self: ViewportFrameModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> ViewportFrameModifier,
	SelectionBehaviorUp: (self: ViewportFrameModifier, value: Field<Enum.SelectionBehavior | Tween<Enum.SelectionBehavior>>) -> ViewportFrameModifier,
	SelectionGroup: (self: ViewportFrameModifier, value: Field<boolean | Tween<boolean>>) -> ViewportFrameModifier,
	SelectionImageObject: (self: ViewportFrameModifier, value: Field<GuiObject | Tween<GuiObject>>) -> ViewportFrameModifier,
	SelectionOrder: (self: ViewportFrameModifier, value: Field<number | Tween<number>>) -> ViewportFrameModifier,
	Size: (self: ViewportFrameModifier, value: Field<UDim2 | Tween<UDim2>>) -> ViewportFrameModifier,
	SizeConstraint: (self: ViewportFrameModifier, value: Field<Enum.SizeConstraint | Tween<Enum.SizeConstraint>>) -> ViewportFrameModifier,
	Visible: (self: ViewportFrameModifier, value: Field<boolean | Tween<boolean>>) -> ViewportFrameModifier,
	ZIndex: (self: ViewportFrameModifier, value: Field<number | Tween<number>>) -> ViewportFrameModifier,
}
export type IntoViewportFrame = { AsViewportFrame: (self: any) -> ViewportFrameModifier }
export type ViewportFrameElem = NewChild | ViewportFrameOnChange | State<ViewportFrameOnChange> | { read __quadModifier: "ViewportFrame" | "GuiObject" | "GuiBase2d" | "GuiBase" | "Instance" }
export type ViewportFrameMapperElem = ViewportFrameElem | MapperDescriptor

export type WorldModelOnChange =
	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "ModelStreamingMode", Callback: (Enum.ModelStreamingMode) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "PrimaryPart", Callback: (BasePart) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "UseWorkspaceCollisionGroups", Callback: (boolean) -> () }
	| 	{ Name: "WorldPivot", Callback: (CFrame) -> () }
export type WorldModelModifier = {
	read __quadModifier: "WorldModel", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: WorldModelModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: WorldModelModifier, ...any) -> any,
	As: <T>(self: WorldModelModifier, name: string?) -> T, -- 무검사(11절)
	AsWorldModel: (self: WorldModelModifier) -> WorldModelModifier, -- 항등(Into<WorldModel> 구현)
	Archivable: (self: WorldModelModifier, value: Field<boolean | Tween<boolean>>) -> WorldModelModifier,
	Capabilities: (self: WorldModelModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> WorldModelModifier,
	ModelStreamingMode: (self: WorldModelModifier, value: Field<Enum.ModelStreamingMode | Tween<Enum.ModelStreamingMode>>) -> WorldModelModifier,
	Name: (self: WorldModelModifier, value: Field<string | Tween<string>>) -> WorldModelModifier,
	PrimaryPart: (self: WorldModelModifier, value: Field<BasePart | Tween<BasePart>>) -> WorldModelModifier,
	Sandboxed: (self: WorldModelModifier, value: Field<boolean | Tween<boolean>>) -> WorldModelModifier,
	UseWorkspaceCollisionGroups: (self: WorldModelModifier, value: Field<boolean | Tween<boolean>>) -> WorldModelModifier,
	WorldPivot: (self: WorldModelModifier, value: Field<CFrame | Tween<CFrame>>) -> WorldModelModifier,
}
export type IntoWorldModel = { AsWorldModel: (self: any) -> WorldModelModifier }
export type WorldModelElem = NewChild | WorldModelOnChange | State<WorldModelOnChange> | { read __quadModifier: "WorldModel" | "WorldRoot" | "Model" | "PVInstance" | "Instance" }
export type WorldModelMapperElem = WorldModelElem | MapperDescriptor

export type WorldRootModifier = {
	read __quadModifier: "WorldRoot", -- 클래스 태그(H-300 관례) — 런타임 값의 태그와 같은 리터럴
	Peek: <T>(self: WorldRootModifier, key: string) -> T | State<T> | None | nil,
	Apply: <U>(self: any, factory: (any) -> U) -> U, -- any: 8.9절(재귀 필드 이름 충돌)
	Overridden: (self: WorldRootModifier, ...any) -> any,
	As: <T>(self: WorldRootModifier, name: string?) -> T, -- 무검사(11절)
	AsWorldRoot: (self: WorldRootModifier) -> WorldRootModifier, -- 항등(Into<WorldRoot> 구현)
	AsWorldModel: (self: WorldRootModifier) -> WorldModelModifier,
	Archivable: (self: WorldRootModifier, value: Field<boolean | Tween<boolean>>) -> WorldRootModifier,
	Capabilities: (self: WorldRootModifier, value: Field<SecurityCapabilities | Tween<SecurityCapabilities>>) -> WorldRootModifier,
	ModelStreamingMode: (self: WorldRootModifier, value: Field<Enum.ModelStreamingMode | Tween<Enum.ModelStreamingMode>>) -> WorldRootModifier,
	Name: (self: WorldRootModifier, value: Field<string | Tween<string>>) -> WorldRootModifier,
	PrimaryPart: (self: WorldRootModifier, value: Field<BasePart | Tween<BasePart>>) -> WorldRootModifier,
	Sandboxed: (self: WorldRootModifier, value: Field<boolean | Tween<boolean>>) -> WorldRootModifier,
	WorldPivot: (self: WorldRootModifier, value: Field<CFrame | Tween<CFrame>>) -> WorldRootModifier,
}
export type IntoWorldRoot = { AsWorldRoot: (self: any) -> WorldRootModifier }

-- D 네임스페이스 타입(H-305 (d′)) — `UseProvider` 확장 `RobloxExtension`이
-- 싣는 풀 타입 표면. 아래 런타임 별칭 캐스트와 1:1 — 손 나열 금지 계약대로
-- 생성기가 같이 찍는다.
export type DMapper = {
	Root: MapperRoot,
	BillboardGui: (key: string | MapperRoot) -> (BillboardGuiParam<BillboardGuiMapperElem>) -> MapperDescriptor,
	Camera: (key: string | MapperRoot) -> (CameraParam<CameraMapperElem>) -> MapperDescriptor,
	CanvasGroup: (key: string | MapperRoot) -> (CanvasGroupParam<CanvasGroupMapperElem>) -> MapperDescriptor,
	Folder: (key: string | MapperRoot) -> (FolderParam<FolderMapperElem>) -> MapperDescriptor,
	Frame: (key: string | MapperRoot) -> (FrameParam<FrameMapperElem>) -> MapperDescriptor,
	ImageButton: (key: string | MapperRoot) -> (ImageButtonParam<ImageButtonMapperElem>) -> MapperDescriptor,
	ImageLabel: (key: string | MapperRoot) -> (ImageLabelParam<ImageLabelMapperElem>) -> MapperDescriptor,
	ScreenGui: (key: string | MapperRoot) -> (ScreenGuiParam<ScreenGuiMapperElem>) -> MapperDescriptor,
	ScrollingFrame: (key: string | MapperRoot) -> (ScrollingFrameParam<ScrollingFrameMapperElem>) -> MapperDescriptor,
	SurfaceGui: (key: string | MapperRoot) -> (SurfaceGuiParam<SurfaceGuiMapperElem>) -> MapperDescriptor,
	TextBox: (key: string | MapperRoot) -> (TextBoxParam<TextBoxMapperElem>) -> MapperDescriptor,
	TextButton: (key: string | MapperRoot) -> (TextButtonParam<TextButtonMapperElem>) -> MapperDescriptor,
	TextLabel: (key: string | MapperRoot) -> (TextLabelParam<TextLabelMapperElem>) -> MapperDescriptor,
	UIAspectRatioConstraint: (key: string | MapperRoot) -> (UIAspectRatioConstraintParam<UIAspectRatioConstraintMapperElem>) -> MapperDescriptor,
	UICorner: (key: string | MapperRoot) -> (UICornerParam<UICornerMapperElem>) -> MapperDescriptor,
	UIDragDetector: (key: string | MapperRoot) -> (UIDragDetectorParam<UIDragDetectorMapperElem>) -> MapperDescriptor,
	UIFlexItem: (key: string | MapperRoot) -> (UIFlexItemParam<UIFlexItemMapperElem>) -> MapperDescriptor,
	UIGradient: (key: string | MapperRoot) -> (UIGradientParam<UIGradientMapperElem>) -> MapperDescriptor,
	UIGridLayout: (key: string | MapperRoot) -> (UIGridLayoutParam<UIGridLayoutMapperElem>) -> MapperDescriptor,
	UIListLayout: (key: string | MapperRoot) -> (UIListLayoutParam<UIListLayoutMapperElem>) -> MapperDescriptor,
	UIPadding: (key: string | MapperRoot) -> (UIPaddingParam<UIPaddingMapperElem>) -> MapperDescriptor,
	UIPageLayout: (key: string | MapperRoot) -> (UIPageLayoutParam<UIPageLayoutMapperElem>) -> MapperDescriptor,
	UIScale: (key: string | MapperRoot) -> (UIScaleParam<UIScaleMapperElem>) -> MapperDescriptor,
	UIShadow: (key: string | MapperRoot) -> (UIShadowParam<UIShadowMapperElem>) -> MapperDescriptor,
	UISizeConstraint: (key: string | MapperRoot) -> (UISizeConstraintParam<UISizeConstraintMapperElem>) -> MapperDescriptor,
	UIStroke: (key: string | MapperRoot) -> (UIStrokeParam<UIStrokeMapperElem>) -> MapperDescriptor,
	UITableLayout: (key: string | MapperRoot) -> (UITableLayoutParam<UITableLayoutMapperElem>) -> MapperDescriptor,
	UITextSizeConstraint: (key: string | MapperRoot) -> (UITextSizeConstraintParam<UITextSizeConstraintMapperElem>) -> MapperDescriptor,
	VideoFrame: (key: string | MapperRoot) -> (VideoFrameParam<VideoFrameMapperElem>) -> MapperDescriptor,
	ViewportFrame: (key: string | MapperRoot) -> (ViewportFrameParam<ViewportFrameMapperElem>) -> MapperDescriptor,
	WorldModel: (key: string | MapperRoot) -> (WorldModelParam<WorldModelMapperElem>) -> MapperDescriptor,
}
export type DModifier = {
	BillboardGui: (...(BillboardGuiModifier | { [string]: any })) -> BillboardGuiModifier,
	Camera: (...(CameraModifier | { [string]: any })) -> CameraModifier,
	CanvasGroup: (...(CanvasGroupModifier | { [string]: any })) -> CanvasGroupModifier,
	Folder: (...(FolderModifier | { [string]: any })) -> FolderModifier,
	Frame: (...(FrameModifier | { [string]: any })) -> FrameModifier,
	GuiBase: (...(GuiBaseModifier | { [string]: any })) -> GuiBaseModifier,
	GuiBase2d: (...(GuiBase2dModifier | { [string]: any })) -> GuiBase2dModifier,
	GuiButton: (...(GuiButtonModifier | { [string]: any })) -> GuiButtonModifier,
	GuiLabel: (...(GuiLabelModifier | { [string]: any })) -> GuiLabelModifier,
	GuiObject: (...(GuiObjectModifier | { [string]: any })) -> GuiObjectModifier,
	ImageButton: (...(ImageButtonModifier | { [string]: any })) -> ImageButtonModifier,
	ImageLabel: (...(ImageLabelModifier | { [string]: any })) -> ImageLabelModifier,
	Instance: (...(InstanceModifier | { [string]: any })) -> InstanceModifier,
	LayerCollector: (...(LayerCollectorModifier | { [string]: any })) -> LayerCollectorModifier,
	Model: (...(ModelModifier | { [string]: any })) -> ModelModifier,
	PVInstance: (...(PVInstanceModifier | { [string]: any })) -> PVInstanceModifier,
	ScreenGui: (...(ScreenGuiModifier | { [string]: any })) -> ScreenGuiModifier,
	ScrollingFrame: (...(ScrollingFrameModifier | { [string]: any })) -> ScrollingFrameModifier,
	SurfaceGui: (...(SurfaceGuiModifier | { [string]: any })) -> SurfaceGuiModifier,
	SurfaceGuiBase: (...(SurfaceGuiBaseModifier | { [string]: any })) -> SurfaceGuiBaseModifier,
	TextBox: (...(TextBoxModifier | { [string]: any })) -> TextBoxModifier,
	TextButton: (...(TextButtonModifier | { [string]: any })) -> TextButtonModifier,
	TextLabel: (...(TextLabelModifier | { [string]: any })) -> TextLabelModifier,
	UIAspectRatioConstraint: (...(UIAspectRatioConstraintModifier | { [string]: any })) -> UIAspectRatioConstraintModifier,
	UIBase: (...(UIBaseModifier | { [string]: any })) -> UIBaseModifier,
	UIComponent: (...(UIComponentModifier | { [string]: any })) -> UIComponentModifier,
	UIConstraint: (...(UIConstraintModifier | { [string]: any })) -> UIConstraintModifier,
	UICorner: (...(UICornerModifier | { [string]: any })) -> UICornerModifier,
	UIDragDetector: (...(UIDragDetectorModifier | { [string]: any })) -> UIDragDetectorModifier,
	UIFlexItem: (...(UIFlexItemModifier | { [string]: any })) -> UIFlexItemModifier,
	UIGradient: (...(UIGradientModifier | { [string]: any })) -> UIGradientModifier,
	UIGridLayout: (...(UIGridLayoutModifier | { [string]: any })) -> UIGridLayoutModifier,
	UIGridStyleLayout: (...(UIGridStyleLayoutModifier | { [string]: any })) -> UIGridStyleLayoutModifier,
	UILayout: (...(UILayoutModifier | { [string]: any })) -> UILayoutModifier,
	UIListLayout: (...(UIListLayoutModifier | { [string]: any })) -> UIListLayoutModifier,
	UIPadding: (...(UIPaddingModifier | { [string]: any })) -> UIPaddingModifier,
	UIPageLayout: (...(UIPageLayoutModifier | { [string]: any })) -> UIPageLayoutModifier,
	UIScale: (...(UIScaleModifier | { [string]: any })) -> UIScaleModifier,
	UIShadow: (...(UIShadowModifier | { [string]: any })) -> UIShadowModifier,
	UISizeConstraint: (...(UISizeConstraintModifier | { [string]: any })) -> UISizeConstraintModifier,
	UIStroke: (...(UIStrokeModifier | { [string]: any })) -> UIStrokeModifier,
	UITableLayout: (...(UITableLayoutModifier | { [string]: any })) -> UITableLayoutModifier,
	UITextSizeConstraint: (...(UITextSizeConstraintModifier | { [string]: any })) -> UITextSizeConstraintModifier,
	VideoFrame: (...(VideoFrameModifier | { [string]: any })) -> VideoFrameModifier,
	ViewportFrame: (...(ViewportFrameModifier | { [string]: any })) -> ViewportFrameModifier,
	WorldModel: (...(WorldModelModifier | { [string]: any })) -> WorldModelModifier,
	WorldRoot: (...(WorldRootModifier | { [string]: any })) -> WorldRootModifier,
}
export type D = {
	New: <T>(className: string) -> (props: any) -> T,
	Mapper: DMapper,
	Modifier: DModifier,
	BillboardGui: (BillboardGuiParam<BillboardGuiElem>) -> BillboardGui,
	Camera: (CameraParam<CameraElem>) -> Camera,
	CanvasGroup: (CanvasGroupParam<CanvasGroupElem>) -> CanvasGroup,
	Folder: (FolderParam<FolderElem>) -> Folder,
	Frame: (FrameParam<FrameElem>) -> Frame,
	ImageButton: (ImageButtonParam<ImageButtonElem>) -> ImageButton,
	ImageLabel: (ImageLabelParam<ImageLabelElem>) -> ImageLabel,
	ScreenGui: (ScreenGuiParam<ScreenGuiElem>) -> ScreenGui,
	ScrollingFrame: (ScrollingFrameParam<ScrollingFrameElem>) -> ScrollingFrame,
	SurfaceGui: (SurfaceGuiParam<SurfaceGuiElem>) -> SurfaceGui,
	TextBox: (TextBoxParam<TextBoxElem>) -> TextBox,
	TextButton: (TextButtonParam<TextButtonElem>) -> TextButton,
	TextLabel: (TextLabelParam<TextLabelElem>) -> TextLabel,
	UIAspectRatioConstraint: (UIAspectRatioConstraintParam<UIAspectRatioConstraintElem>) -> UIAspectRatioConstraint,
	UICorner: (UICornerParam<UICornerElem>) -> UICorner,
	UIDragDetector: (UIDragDetectorParam<UIDragDetectorElem>) -> UIDragDetector,
	UIFlexItem: (UIFlexItemParam<UIFlexItemElem>) -> UIFlexItem,
	UIGradient: (UIGradientParam<UIGradientElem>) -> UIGradient,
	UIGridLayout: (UIGridLayoutParam<UIGridLayoutElem>) -> UIGridLayout,
	UIListLayout: (UIListLayoutParam<UIListLayoutElem>) -> UIListLayout,
	UIPadding: (UIPaddingParam<UIPaddingElem>) -> UIPadding,
	UIPageLayout: (UIPageLayoutParam<UIPageLayoutElem>) -> UIPageLayout,
	UIScale: (UIScaleParam<UIScaleElem>) -> UIScale,
	UIShadow: (UIShadowParam<UIShadowElem>) -> UIShadow,
	UISizeConstraint: (UISizeConstraintParam<UISizeConstraintElem>) -> UISizeConstraint,
	UIStroke: (UIStrokeParam<UIStrokeElem>) -> UIStroke,
	UITableLayout: (UITableLayoutParam<UITableLayoutElem>) -> UITableLayout,
	UITextSizeConstraint: (UITextSizeConstraintParam<UITextSizeConstraintElem>) -> UITextSizeConstraint,
	VideoFrame: (VideoFrameParam<VideoFrameElem>) -> VideoFrame,
	ViewportFrame: (ViewportFrameParam<ViewportFrameElem>) -> ViewportFrame,
	WorldModel: (WorldModelParam<WorldModelElem>) -> WorldModel,
}

--[[ InitD(quad) — `UseProvider` 확장(`RobloxExtension.D`)으로 실린다
	(round14 H-299의 module.D 직접 대입 채널을 H-305 (d′)가 병합 채널로 이동).
	New의 ①~④ 순서는 bind-system-plan 파이프라인 의사코드가 계약. ]]
return function(quad: any): D
	local function New<T>(className: string): (props: any) -> T
		local function stage(props: any): T
			local inst = Instance.new(className) -- ①
			quad.nativeClaim(inst) -- ② 생성 직후 무조건, ③④보다 먼저
			-- ③④ — flatten(Modifier 소진)은 drive의 첫 pre-pass(round17 Q4 (a),
			-- 2026-09-04): New와 Claim이 같은 호출 자리를 쓴다
			quad.Dispatch.drive(inst, props)
			return inst :: any
		end
		-- H-238: 범위 밖 클래스의 D.New(name)(props) 경로도 blame이 사용자
		-- 줄에 닿아야 한다 — 스테이지를 만들 때 태그(별칭도 이 경로로 만들어져
		-- 전부 태그됨; 리뷰 발견 반영)
		quad.errorNamespace.setFuncLevel(stage, QuadTypes.ERROR_LEVEL_SURFACE)
		return stage
	end
	-- D.Mapper — Claim용 디스크립터 생성기(claim-plan §2; 본체는 quad-base
	-- Claim.luau의 newMapperClass — 여기선 클래스별 캐스트 별칭만, D.<Class> 동형)
	local Mapper: { [string]: any } = { Root = quad.MapperRoot }
	-- D.Modifier — 클래스별 타입드 Modifier 생성자(round17 §0 Q3 (a); 단위 ④):
	-- quad.Modifier.TypedFactory(name)이 돌려주는 태그 생성자(런타임 병합 본문은
	-- base 하나) + DefineSubtype(parent, name) 간선 — 둘 다 dedup이라 순서 자유
	local ModifierNS: { [string]: any } = {}
	local D: { [string]: any } = { New = New, Mapper = Mapper, Modifier = ModifierNS }
	D.BillboardGui = (New("BillboardGui") :: any) :: (BillboardGuiParam<BillboardGuiElem>) -> BillboardGui
	D.Camera = (New("Camera") :: any) :: (CameraParam<CameraElem>) -> Camera
	D.CanvasGroup = (New("CanvasGroup") :: any) :: (CanvasGroupParam<CanvasGroupElem>) -> CanvasGroup
	D.Folder = (New("Folder") :: any) :: (FolderParam<FolderElem>) -> Folder
	D.Frame = (New("Frame") :: any) :: (FrameParam<FrameElem>) -> Frame
	D.ImageButton = (New("ImageButton") :: any) :: (ImageButtonParam<ImageButtonElem>) -> ImageButton
	D.ImageLabel = (New("ImageLabel") :: any) :: (ImageLabelParam<ImageLabelElem>) -> ImageLabel
	D.ScreenGui = (New("ScreenGui") :: any) :: (ScreenGuiParam<ScreenGuiElem>) -> ScreenGui
	D.ScrollingFrame = (New("ScrollingFrame") :: any) :: (ScrollingFrameParam<ScrollingFrameElem>) -> ScrollingFrame
	D.SurfaceGui = (New("SurfaceGui") :: any) :: (SurfaceGuiParam<SurfaceGuiElem>) -> SurfaceGui
	D.TextBox = (New("TextBox") :: any) :: (TextBoxParam<TextBoxElem>) -> TextBox
	D.TextButton = (New("TextButton") :: any) :: (TextButtonParam<TextButtonElem>) -> TextButton
	D.TextLabel = (New("TextLabel") :: any) :: (TextLabelParam<TextLabelElem>) -> TextLabel
	D.UIAspectRatioConstraint = (New("UIAspectRatioConstraint") :: any) :: (UIAspectRatioConstraintParam<UIAspectRatioConstraintElem>) -> UIAspectRatioConstraint
	D.UICorner = (New("UICorner") :: any) :: (UICornerParam<UICornerElem>) -> UICorner
	D.UIDragDetector = (New("UIDragDetector") :: any) :: (UIDragDetectorParam<UIDragDetectorElem>) -> UIDragDetector
	D.UIFlexItem = (New("UIFlexItem") :: any) :: (UIFlexItemParam<UIFlexItemElem>) -> UIFlexItem
	D.UIGradient = (New("UIGradient") :: any) :: (UIGradientParam<UIGradientElem>) -> UIGradient
	D.UIGridLayout = (New("UIGridLayout") :: any) :: (UIGridLayoutParam<UIGridLayoutElem>) -> UIGridLayout
	D.UIListLayout = (New("UIListLayout") :: any) :: (UIListLayoutParam<UIListLayoutElem>) -> UIListLayout
	D.UIPadding = (New("UIPadding") :: any) :: (UIPaddingParam<UIPaddingElem>) -> UIPadding
	D.UIPageLayout = (New("UIPageLayout") :: any) :: (UIPageLayoutParam<UIPageLayoutElem>) -> UIPageLayout
	D.UIScale = (New("UIScale") :: any) :: (UIScaleParam<UIScaleElem>) -> UIScale
	D.UIShadow = (New("UIShadow") :: any) :: (UIShadowParam<UIShadowElem>) -> UIShadow
	D.UISizeConstraint = (New("UISizeConstraint") :: any) :: (UISizeConstraintParam<UISizeConstraintElem>) -> UISizeConstraint
	D.UIStroke = (New("UIStroke") :: any) :: (UIStrokeParam<UIStrokeElem>) -> UIStroke
	D.UITableLayout = (New("UITableLayout") :: any) :: (UITableLayoutParam<UITableLayoutElem>) -> UITableLayout
	D.UITextSizeConstraint = (New("UITextSizeConstraint") :: any) :: (UITextSizeConstraintParam<UITextSizeConstraintElem>) -> UITextSizeConstraint
	D.VideoFrame = (New("VideoFrame") :: any) :: (VideoFrameParam<VideoFrameElem>) -> VideoFrame
	D.ViewportFrame = (New("ViewportFrame") :: any) :: (ViewportFrameParam<ViewportFrameElem>) -> ViewportFrame
	D.WorldModel = (New("WorldModel") :: any) :: (WorldModelParam<WorldModelElem>) -> WorldModel
	Mapper.BillboardGui = (quad.newMapperClass("BillboardGui") :: any) :: (key: string | MapperRoot) -> (BillboardGuiParam<BillboardGuiMapperElem>) -> MapperDescriptor
	Mapper.Camera = (quad.newMapperClass("Camera") :: any) :: (key: string | MapperRoot) -> (CameraParam<CameraMapperElem>) -> MapperDescriptor
	Mapper.CanvasGroup = (quad.newMapperClass("CanvasGroup") :: any) :: (key: string | MapperRoot) -> (CanvasGroupParam<CanvasGroupMapperElem>) -> MapperDescriptor
	Mapper.Folder = (quad.newMapperClass("Folder") :: any) :: (key: string | MapperRoot) -> (FolderParam<FolderMapperElem>) -> MapperDescriptor
	Mapper.Frame = (quad.newMapperClass("Frame") :: any) :: (key: string | MapperRoot) -> (FrameParam<FrameMapperElem>) -> MapperDescriptor
	Mapper.ImageButton = (quad.newMapperClass("ImageButton") :: any) :: (key: string | MapperRoot) -> (ImageButtonParam<ImageButtonMapperElem>) -> MapperDescriptor
	Mapper.ImageLabel = (quad.newMapperClass("ImageLabel") :: any) :: (key: string | MapperRoot) -> (ImageLabelParam<ImageLabelMapperElem>) -> MapperDescriptor
	Mapper.ScreenGui = (quad.newMapperClass("ScreenGui") :: any) :: (key: string | MapperRoot) -> (ScreenGuiParam<ScreenGuiMapperElem>) -> MapperDescriptor
	Mapper.ScrollingFrame = (quad.newMapperClass("ScrollingFrame") :: any) :: (key: string | MapperRoot) -> (ScrollingFrameParam<ScrollingFrameMapperElem>) -> MapperDescriptor
	Mapper.SurfaceGui = (quad.newMapperClass("SurfaceGui") :: any) :: (key: string | MapperRoot) -> (SurfaceGuiParam<SurfaceGuiMapperElem>) -> MapperDescriptor
	Mapper.TextBox = (quad.newMapperClass("TextBox") :: any) :: (key: string | MapperRoot) -> (TextBoxParam<TextBoxMapperElem>) -> MapperDescriptor
	Mapper.TextButton = (quad.newMapperClass("TextButton") :: any) :: (key: string | MapperRoot) -> (TextButtonParam<TextButtonMapperElem>) -> MapperDescriptor
	Mapper.TextLabel = (quad.newMapperClass("TextLabel") :: any) :: (key: string | MapperRoot) -> (TextLabelParam<TextLabelMapperElem>) -> MapperDescriptor
	Mapper.UIAspectRatioConstraint = (quad.newMapperClass("UIAspectRatioConstraint") :: any) :: (key: string | MapperRoot) -> (UIAspectRatioConstraintParam<UIAspectRatioConstraintMapperElem>) -> MapperDescriptor
	Mapper.UICorner = (quad.newMapperClass("UICorner") :: any) :: (key: string | MapperRoot) -> (UICornerParam<UICornerMapperElem>) -> MapperDescriptor
	Mapper.UIDragDetector = (quad.newMapperClass("UIDragDetector") :: any) :: (key: string | MapperRoot) -> (UIDragDetectorParam<UIDragDetectorMapperElem>) -> MapperDescriptor
	Mapper.UIFlexItem = (quad.newMapperClass("UIFlexItem") :: any) :: (key: string | MapperRoot) -> (UIFlexItemParam<UIFlexItemMapperElem>) -> MapperDescriptor
	Mapper.UIGradient = (quad.newMapperClass("UIGradient") :: any) :: (key: string | MapperRoot) -> (UIGradientParam<UIGradientMapperElem>) -> MapperDescriptor
	Mapper.UIGridLayout = (quad.newMapperClass("UIGridLayout") :: any) :: (key: string | MapperRoot) -> (UIGridLayoutParam<UIGridLayoutMapperElem>) -> MapperDescriptor
	Mapper.UIListLayout = (quad.newMapperClass("UIListLayout") :: any) :: (key: string | MapperRoot) -> (UIListLayoutParam<UIListLayoutMapperElem>) -> MapperDescriptor
	Mapper.UIPadding = (quad.newMapperClass("UIPadding") :: any) :: (key: string | MapperRoot) -> (UIPaddingParam<UIPaddingMapperElem>) -> MapperDescriptor
	Mapper.UIPageLayout = (quad.newMapperClass("UIPageLayout") :: any) :: (key: string | MapperRoot) -> (UIPageLayoutParam<UIPageLayoutMapperElem>) -> MapperDescriptor
	Mapper.UIScale = (quad.newMapperClass("UIScale") :: any) :: (key: string | MapperRoot) -> (UIScaleParam<UIScaleMapperElem>) -> MapperDescriptor
	Mapper.UIShadow = (quad.newMapperClass("UIShadow") :: any) :: (key: string | MapperRoot) -> (UIShadowParam<UIShadowMapperElem>) -> MapperDescriptor
	Mapper.UISizeConstraint = (quad.newMapperClass("UISizeConstraint") :: any) :: (key: string | MapperRoot) -> (UISizeConstraintParam<UISizeConstraintMapperElem>) -> MapperDescriptor
	Mapper.UIStroke = (quad.newMapperClass("UIStroke") :: any) :: (key: string | MapperRoot) -> (UIStrokeParam<UIStrokeMapperElem>) -> MapperDescriptor
	Mapper.UITableLayout = (quad.newMapperClass("UITableLayout") :: any) :: (key: string | MapperRoot) -> (UITableLayoutParam<UITableLayoutMapperElem>) -> MapperDescriptor
	Mapper.UITextSizeConstraint = (quad.newMapperClass("UITextSizeConstraint") :: any) :: (key: string | MapperRoot) -> (UITextSizeConstraintParam<UITextSizeConstraintMapperElem>) -> MapperDescriptor
	Mapper.VideoFrame = (quad.newMapperClass("VideoFrame") :: any) :: (key: string | MapperRoot) -> (VideoFrameParam<VideoFrameMapperElem>) -> MapperDescriptor
	Mapper.ViewportFrame = (quad.newMapperClass("ViewportFrame") :: any) :: (key: string | MapperRoot) -> (ViewportFrameParam<ViewportFrameMapperElem>) -> MapperDescriptor
	Mapper.WorldModel = (quad.newMapperClass("WorldModel") :: any) :: (key: string | MapperRoot) -> (WorldModelParam<WorldModelMapperElem>) -> MapperDescriptor
	ModifierNS.BillboardGui = (quad.Modifier.TypedFactory("BillboardGui") :: any) :: (...(BillboardGuiModifier | { [string]: any })) -> BillboardGuiModifier
	ModifierNS.Camera = (quad.Modifier.TypedFactory("Camera") :: any) :: (...(CameraModifier | { [string]: any })) -> CameraModifier
	ModifierNS.CanvasGroup = (quad.Modifier.TypedFactory("CanvasGroup") :: any) :: (...(CanvasGroupModifier | { [string]: any })) -> CanvasGroupModifier
	ModifierNS.Folder = (quad.Modifier.TypedFactory("Folder") :: any) :: (...(FolderModifier | { [string]: any })) -> FolderModifier
	ModifierNS.Frame = (quad.Modifier.TypedFactory("Frame") :: any) :: (...(FrameModifier | { [string]: any })) -> FrameModifier
	ModifierNS.GuiBase = (quad.Modifier.TypedFactory("GuiBase") :: any) :: (...(GuiBaseModifier | { [string]: any })) -> GuiBaseModifier
	ModifierNS.GuiBase2d = (quad.Modifier.TypedFactory("GuiBase2d") :: any) :: (...(GuiBase2dModifier | { [string]: any })) -> GuiBase2dModifier
	ModifierNS.GuiButton = (quad.Modifier.TypedFactory("GuiButton") :: any) :: (...(GuiButtonModifier | { [string]: any })) -> GuiButtonModifier
	ModifierNS.GuiLabel = (quad.Modifier.TypedFactory("GuiLabel") :: any) :: (...(GuiLabelModifier | { [string]: any })) -> GuiLabelModifier
	ModifierNS.GuiObject = (quad.Modifier.TypedFactory("GuiObject") :: any) :: (...(GuiObjectModifier | { [string]: any })) -> GuiObjectModifier
	ModifierNS.ImageButton = (quad.Modifier.TypedFactory("ImageButton") :: any) :: (...(ImageButtonModifier | { [string]: any })) -> ImageButtonModifier
	ModifierNS.ImageLabel = (quad.Modifier.TypedFactory("ImageLabel") :: any) :: (...(ImageLabelModifier | { [string]: any })) -> ImageLabelModifier
	ModifierNS.Instance = (quad.Modifier.TypedFactory("Instance") :: any) :: (...(InstanceModifier | { [string]: any })) -> InstanceModifier
	ModifierNS.LayerCollector = (quad.Modifier.TypedFactory("LayerCollector") :: any) :: (...(LayerCollectorModifier | { [string]: any })) -> LayerCollectorModifier
	ModifierNS.Model = (quad.Modifier.TypedFactory("Model") :: any) :: (...(ModelModifier | { [string]: any })) -> ModelModifier
	ModifierNS.PVInstance = (quad.Modifier.TypedFactory("PVInstance") :: any) :: (...(PVInstanceModifier | { [string]: any })) -> PVInstanceModifier
	ModifierNS.ScreenGui = (quad.Modifier.TypedFactory("ScreenGui") :: any) :: (...(ScreenGuiModifier | { [string]: any })) -> ScreenGuiModifier
	ModifierNS.ScrollingFrame = (quad.Modifier.TypedFactory("ScrollingFrame") :: any) :: (...(ScrollingFrameModifier | { [string]: any })) -> ScrollingFrameModifier
	ModifierNS.SurfaceGui = (quad.Modifier.TypedFactory("SurfaceGui") :: any) :: (...(SurfaceGuiModifier | { [string]: any })) -> SurfaceGuiModifier
	ModifierNS.SurfaceGuiBase = (quad.Modifier.TypedFactory("SurfaceGuiBase") :: any) :: (...(SurfaceGuiBaseModifier | { [string]: any })) -> SurfaceGuiBaseModifier
	ModifierNS.TextBox = (quad.Modifier.TypedFactory("TextBox") :: any) :: (...(TextBoxModifier | { [string]: any })) -> TextBoxModifier
	ModifierNS.TextButton = (quad.Modifier.TypedFactory("TextButton") :: any) :: (...(TextButtonModifier | { [string]: any })) -> TextButtonModifier
	ModifierNS.TextLabel = (quad.Modifier.TypedFactory("TextLabel") :: any) :: (...(TextLabelModifier | { [string]: any })) -> TextLabelModifier
	ModifierNS.UIAspectRatioConstraint = (quad.Modifier.TypedFactory("UIAspectRatioConstraint") :: any) :: (...(UIAspectRatioConstraintModifier | { [string]: any })) -> UIAspectRatioConstraintModifier
	ModifierNS.UIBase = (quad.Modifier.TypedFactory("UIBase") :: any) :: (...(UIBaseModifier | { [string]: any })) -> UIBaseModifier
	ModifierNS.UIComponent = (quad.Modifier.TypedFactory("UIComponent") :: any) :: (...(UIComponentModifier | { [string]: any })) -> UIComponentModifier
	ModifierNS.UIConstraint = (quad.Modifier.TypedFactory("UIConstraint") :: any) :: (...(UIConstraintModifier | { [string]: any })) -> UIConstraintModifier
	ModifierNS.UICorner = (quad.Modifier.TypedFactory("UICorner") :: any) :: (...(UICornerModifier | { [string]: any })) -> UICornerModifier
	ModifierNS.UIDragDetector = (quad.Modifier.TypedFactory("UIDragDetector") :: any) :: (...(UIDragDetectorModifier | { [string]: any })) -> UIDragDetectorModifier
	ModifierNS.UIFlexItem = (quad.Modifier.TypedFactory("UIFlexItem") :: any) :: (...(UIFlexItemModifier | { [string]: any })) -> UIFlexItemModifier
	ModifierNS.UIGradient = (quad.Modifier.TypedFactory("UIGradient") :: any) :: (...(UIGradientModifier | { [string]: any })) -> UIGradientModifier
	ModifierNS.UIGridLayout = (quad.Modifier.TypedFactory("UIGridLayout") :: any) :: (...(UIGridLayoutModifier | { [string]: any })) -> UIGridLayoutModifier
	ModifierNS.UIGridStyleLayout = (quad.Modifier.TypedFactory("UIGridStyleLayout") :: any) :: (...(UIGridStyleLayoutModifier | { [string]: any })) -> UIGridStyleLayoutModifier
	ModifierNS.UILayout = (quad.Modifier.TypedFactory("UILayout") :: any) :: (...(UILayoutModifier | { [string]: any })) -> UILayoutModifier
	ModifierNS.UIListLayout = (quad.Modifier.TypedFactory("UIListLayout") :: any) :: (...(UIListLayoutModifier | { [string]: any })) -> UIListLayoutModifier
	ModifierNS.UIPadding = (quad.Modifier.TypedFactory("UIPadding") :: any) :: (...(UIPaddingModifier | { [string]: any })) -> UIPaddingModifier
	ModifierNS.UIPageLayout = (quad.Modifier.TypedFactory("UIPageLayout") :: any) :: (...(UIPageLayoutModifier | { [string]: any })) -> UIPageLayoutModifier
	ModifierNS.UIScale = (quad.Modifier.TypedFactory("UIScale") :: any) :: (...(UIScaleModifier | { [string]: any })) -> UIScaleModifier
	ModifierNS.UIShadow = (quad.Modifier.TypedFactory("UIShadow") :: any) :: (...(UIShadowModifier | { [string]: any })) -> UIShadowModifier
	ModifierNS.UISizeConstraint = (quad.Modifier.TypedFactory("UISizeConstraint") :: any) :: (...(UISizeConstraintModifier | { [string]: any })) -> UISizeConstraintModifier
	ModifierNS.UIStroke = (quad.Modifier.TypedFactory("UIStroke") :: any) :: (...(UIStrokeModifier | { [string]: any })) -> UIStrokeModifier
	ModifierNS.UITableLayout = (quad.Modifier.TypedFactory("UITableLayout") :: any) :: (...(UITableLayoutModifier | { [string]: any })) -> UITableLayoutModifier
	ModifierNS.UITextSizeConstraint = (quad.Modifier.TypedFactory("UITextSizeConstraint") :: any) :: (...(UITextSizeConstraintModifier | { [string]: any })) -> UITextSizeConstraintModifier
	ModifierNS.VideoFrame = (quad.Modifier.TypedFactory("VideoFrame") :: any) :: (...(VideoFrameModifier | { [string]: any })) -> VideoFrameModifier
	ModifierNS.ViewportFrame = (quad.Modifier.TypedFactory("ViewportFrame") :: any) :: (...(ViewportFrameModifier | { [string]: any })) -> ViewportFrameModifier
	ModifierNS.WorldModel = (quad.Modifier.TypedFactory("WorldModel") :: any) :: (...(WorldModelModifier | { [string]: any })) -> WorldModelModifier
	ModifierNS.WorldRoot = (quad.Modifier.TypedFactory("WorldRoot") :: any) :: (...(WorldRootModifier | { [string]: any })) -> WorldRootModifier
	quad.Modifier.DefineSubtype("LayerCollector", "BillboardGui")
	quad.Modifier.DefineSubtype("PVInstance", "Camera")
	quad.Modifier.DefineSubtype("GuiObject", "CanvasGroup")
	quad.Modifier.DefineSubtype("Instance", "Folder")
	quad.Modifier.DefineSubtype("GuiObject", "Frame")
	quad.Modifier.DefineSubtype("Instance", "GuiBase")
	quad.Modifier.DefineSubtype("GuiBase", "GuiBase2d")
	quad.Modifier.DefineSubtype("GuiObject", "GuiButton")
	quad.Modifier.DefineSubtype("GuiObject", "GuiLabel")
	quad.Modifier.DefineSubtype("GuiBase2d", "GuiObject")
	quad.Modifier.DefineSubtype("GuiButton", "ImageButton")
	quad.Modifier.DefineSubtype("GuiLabel", "ImageLabel")
	quad.Modifier.DefineSubtype("GuiBase2d", "LayerCollector")
	quad.Modifier.DefineSubtype("PVInstance", "Model")
	quad.Modifier.DefineSubtype("Instance", "PVInstance")
	quad.Modifier.DefineSubtype("LayerCollector", "ScreenGui")
	quad.Modifier.DefineSubtype("GuiObject", "ScrollingFrame")
	quad.Modifier.DefineSubtype("SurfaceGuiBase", "SurfaceGui")
	quad.Modifier.DefineSubtype("LayerCollector", "SurfaceGuiBase")
	quad.Modifier.DefineSubtype("GuiObject", "TextBox")
	quad.Modifier.DefineSubtype("GuiButton", "TextButton")
	quad.Modifier.DefineSubtype("GuiLabel", "TextLabel")
	quad.Modifier.DefineSubtype("UIConstraint", "UIAspectRatioConstraint")
	quad.Modifier.DefineSubtype("Instance", "UIBase")
	quad.Modifier.DefineSubtype("UIBase", "UIComponent")
	quad.Modifier.DefineSubtype("UIComponent", "UIConstraint")
	quad.Modifier.DefineSubtype("UIComponent", "UICorner")
	quad.Modifier.DefineSubtype("UIComponent", "UIDragDetector")
	quad.Modifier.DefineSubtype("UIComponent", "UIFlexItem")
	quad.Modifier.DefineSubtype("UIComponent", "UIGradient")
	quad.Modifier.DefineSubtype("UIGridStyleLayout", "UIGridLayout")
	quad.Modifier.DefineSubtype("UILayout", "UIGridStyleLayout")
	quad.Modifier.DefineSubtype("UIComponent", "UILayout")
	quad.Modifier.DefineSubtype("UIGridStyleLayout", "UIListLayout")
	quad.Modifier.DefineSubtype("UIComponent", "UIPadding")
	quad.Modifier.DefineSubtype("UIGridStyleLayout", "UIPageLayout")
	quad.Modifier.DefineSubtype("UIComponent", "UIScale")
	quad.Modifier.DefineSubtype("UIComponent", "UIShadow")
	quad.Modifier.DefineSubtype("UIConstraint", "UISizeConstraint")
	quad.Modifier.DefineSubtype("UIComponent", "UIStroke")
	quad.Modifier.DefineSubtype("UIGridStyleLayout", "UITableLayout")
	quad.Modifier.DefineSubtype("UIConstraint", "UITextSizeConstraint")
	quad.Modifier.DefineSubtype("GuiObject", "VideoFrame")
	quad.Modifier.DefineSubtype("GuiObject", "ViewportFrame")
	quad.Modifier.DefineSubtype("WorldRoot", "WorldModel")
	quad.Modifier.DefineSubtype("Model", "WorldRoot")
	quad.errorNamespace.setFuncLevel(New, QuadTypes.ERROR_LEVEL_SURFACE) -- 별칭·스테이지는 New 안에서 태그됨
	return (D :: any) :: D
end
