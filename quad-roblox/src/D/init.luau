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
]]

local QuadTypes = require("../luau_packages/quad_types")
local Types = require("./types")

type State<T> = QuadTypes.State<T>
type Tween<T> = Types.Tween<T>
type NewChild = Types.NewChild
type None = QuadTypes.None
type MapperDescriptor = QuadTypes.MapperDescriptor
type MapperRoot = QuadTypes.MapperRoot

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
export type BillboardGuiElem = NewChild | BillboardGuiOnChange | State<BillboardGuiOnChange>
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
export type CameraElem = NewChild | CameraOnChange | State<CameraOnChange>
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
export type CanvasGroupElem = NewChild | CanvasGroupOnChange | State<CanvasGroupOnChange>
export type CanvasGroupMapperElem = CanvasGroupElem | MapperDescriptor

export type FolderOnChange =
	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
export type FolderElem = NewChild | FolderOnChange | State<FolderOnChange>
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
export type FrameElem = NewChild | FrameOnChange | State<FrameOnChange>
export type FrameMapperElem = FrameElem | MapperDescriptor

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
export type ImageButtonElem = NewChild | ImageButtonOnChange | State<ImageButtonOnChange>
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
export type ImageLabelElem = NewChild | ImageLabelOnChange | State<ImageLabelOnChange>
export type ImageLabelMapperElem = ImageLabelElem | MapperDescriptor

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
export type ScreenGuiElem = NewChild | ScreenGuiOnChange | State<ScreenGuiOnChange>
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
export type ScrollingFrameElem = NewChild | ScrollingFrameOnChange | State<ScrollingFrameOnChange>
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
export type SurfaceGuiElem = NewChild | SurfaceGuiOnChange | State<SurfaceGuiOnChange>
export type SurfaceGuiMapperElem = SurfaceGuiElem | MapperDescriptor

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
export type TextBoxElem = NewChild | TextBoxOnChange | State<TextBoxOnChange>
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
export type TextButtonElem = NewChild | TextButtonOnChange | State<TextButtonOnChange>
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
export type TextLabelElem = NewChild | TextLabelOnChange | State<TextLabelOnChange>
export type TextLabelMapperElem = TextLabelElem | MapperDescriptor

export type UIAspectRatioConstraintOnChange =
	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "AspectRatio", Callback: (number) -> () }
	| 	{ Name: "AspectType", Callback: (Enum.AspectType) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "DominantAxis", Callback: (Enum.DominantAxis) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
export type UIAspectRatioConstraintElem = NewChild | UIAspectRatioConstraintOnChange | State<UIAspectRatioConstraintOnChange>
export type UIAspectRatioConstraintMapperElem = UIAspectRatioConstraintElem | MapperDescriptor

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
export type UICornerElem = NewChild | UICornerOnChange | State<UICornerOnChange>
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
export type UIDragDetectorElem = NewChild | UIDragDetectorOnChange | State<UIDragDetectorOnChange>
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
export type UIFlexItemElem = NewChild | UIFlexItemOnChange | State<UIFlexItemOnChange>
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
export type UIGradientElem = NewChild | UIGradientOnChange | State<UIGradientOnChange>
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
export type UIGridLayoutElem = NewChild | UIGridLayoutOnChange | State<UIGridLayoutOnChange>
export type UIGridLayoutMapperElem = UIGridLayoutElem | MapperDescriptor

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
export type UIListLayoutElem = NewChild | UIListLayoutOnChange | State<UIListLayoutOnChange>
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
export type UIPaddingElem = NewChild | UIPaddingOnChange | State<UIPaddingOnChange>
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
export type UIPageLayoutElem = NewChild | UIPageLayoutOnChange | State<UIPageLayoutOnChange>
export type UIPageLayoutMapperElem = UIPageLayoutElem | MapperDescriptor

export type UIScaleOnChange =
	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
	| 	{ Name: "Scale", Callback: (number) -> () }
export type UIScaleElem = NewChild | UIScaleOnChange | State<UIScaleOnChange>
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
export type UIShadowElem = NewChild | UIShadowOnChange | State<UIShadowOnChange>
export type UIShadowMapperElem = UIShadowElem | MapperDescriptor

export type UISizeConstraintOnChange =
	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "MaxSize", Callback: (Vector2) -> () }
	| 	{ Name: "MinSize", Callback: (Vector2) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
export type UISizeConstraintElem = NewChild | UISizeConstraintOnChange | State<UISizeConstraintOnChange>
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
export type UIStrokeElem = NewChild | UIStrokeOnChange | State<UIStrokeOnChange>
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
export type UITableLayoutElem = NewChild | UITableLayoutOnChange | State<UITableLayoutOnChange>
export type UITableLayoutMapperElem = UITableLayoutElem | MapperDescriptor

export type UITextSizeConstraintOnChange =
	{ Name: "Archivable", Callback: (boolean) -> () }
	| 	{ Name: "Capabilities", Callback: (SecurityCapabilities) -> () }
	| 	{ Name: "MaxTextSize", Callback: (number) -> () }
	| 	{ Name: "MinTextSize", Callback: (number) -> () }
	| 	{ Name: "Name", Callback: (string) -> () }
	| 	{ Name: "Sandboxed", Callback: (boolean) -> () }
export type UITextSizeConstraintElem = NewChild | UITextSizeConstraintOnChange | State<UITextSizeConstraintOnChange>
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
export type VideoFrameElem = NewChild | VideoFrameOnChange | State<VideoFrameOnChange>
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
export type ViewportFrameElem = NewChild | ViewportFrameOnChange | State<ViewportFrameOnChange>
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
export type WorldModelElem = NewChild | WorldModelOnChange | State<WorldModelOnChange>
export type WorldModelMapperElem = WorldModelElem | MapperDescriptor

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
export type D = {
	New: <T>(className: string) -> (props: any) -> T,
	Mapper: DMapper,
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
	local function flatten(props: any): any
		-- ③ 자리 — M7 Modifier 소진이 여기 온다(modifier-plan "flatten의
		-- 정확한 형태" 정본). M5엔 Modifier 표면이 없어 항등.
		return props
	end
	local function New<T>(className: string): (props: any) -> T
		local function stage(props: any): T
			local inst = Instance.new(className) -- ①
			quad.nativeClaim(inst) -- ② 생성 직후 무조건, ③④보다 먼저
			local flattened = flatten(props) -- ③
			quad.Dispatch.drive(inst, flattened) -- ④
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
	local D: { [string]: any } = { New = New, Mapper = Mapper }
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
	quad.errorNamespace.setFuncLevel(New, QuadTypes.ERROR_LEVEL_SURFACE) -- 별칭·스테이지는 New 안에서 태그됨
	return (D :: any) :: D
end
