extends Spatial

export(NodePath) var PlayerPath  = "" #You must specify this in the inspector!
export(float) var MovementSpeed = 10
export(float) var Acceleration = 3
export(float) var MaxJump = 19
export(float) var MouseSensitivity = 2
export(float) var RotationLimit = 45
export(float) var MaxZoom = 0.5
export(float) var MinZoom = 1.5
export(float) var ZoomSpeed = 2

var Player
var InnerGimbal
var Direction = Vector3()
var Rotation = Vector2()
var gravity = -10
var Movement = Vector3()
var ZoomFactor = 1
var ActualZoom = 1
var Speed = Vector3()
var CurrentVerticalSpeed = Vector3()
var JumpAcceleration = 3
var IsAirborne = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Player = get_node(PlayerPath)
	InnerGimbal =  $InnerGimbal
	pass

func _unhandled_input(event):
	
	if event is InputEventMouseMotion :
		Rotation = event.relative
	
	if event is InputEventMouseButton:
		match event.button_index:
			BUTTON_WHEEL_UP:
				ZoomFactor -= 0.05
			BUTTON_WHEEL_DOWN:
				ZoomFactor += 0.05
		ZoomFactor = clamp(ZoomFactor, MaxZoom, MinZoom)
	
	if event is InputEventKey and event.pressed:
		match event.scancode:
			KEY_ESCAPE:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if event is InputEventKey and not event.pressed:
		match event.scancode:
			KEY_SPACE:
				if not IsAirborne:
					CurrentVerticalSpeed = Vector3(0,MaxJump,0)
					IsAirborne = true

func _process(delta):
	
	Direction = Vector3.ZERO
	
	if Input.is_action_pressed("Forward"):
		Direction.z = 1
	elif Input.is_action_pressed("Back"):
		Direction.z = -1
	
	if Input.is_action_pressed("Right"):
		Direction.x = -1
	elif Input.is_action_pressed("Left"):
		Direction.x = 1
		
	if Direction != Vector3.ZERO:
		Direction = Direction.normalized()
	
		
func _physics_process(delta):
	#Rotation
	Player.rotate_y(deg2rad(-Rotation.x)*delta*MouseSensitivity)
	InnerGimbal.rotate_x(deg2rad(-Rotation.y)*delta*MouseSensitivity)
	InnerGimbal.rotation_degrees.x = clamp(InnerGimbal.rotation_degrees.x, -RotationLimit, RotationLimit)
	Rotation = Vector2()
	
	
	#Zoom
	ActualZoom = lerp(ActualZoom, ZoomFactor, delta * ZoomSpeed)
	InnerGimbal.set_scale(Vector3(ActualZoom,ActualZoom,ActualZoom))
