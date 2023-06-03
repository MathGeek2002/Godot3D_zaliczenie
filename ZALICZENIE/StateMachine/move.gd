class_name MoveState
extends BaseState

export (float) var move_speed = 10
export(float) var Acceleration = 3
export (NodePath) var roll_node
export (NodePath) var attack_node

onready var roll_state: BaseState = get_node(roll_node)
onready var attack_state: BaseState = get_node(attack_node)

var Speed = Vector3()

var gravity = -9.81
var JumpAcceleration = 3
var CurrentVerticalSpeed = Vector3()
var Movement = Vector3()

func input(event: InputEvent) -> BaseState:
	
	if Input.is_action_just_pressed("Jump") and owner.is_on_floor():
		return roll_state
	
	if Input.is_action_just_pressed("Attack") and owner.is_on_floor():
		return attack_state
	
	return null

func physics_process(delta: float) -> BaseState:
	
	var move = get_movement_input()
	
	var movement = Vector2(move.x,move.z)
	animator.set("parameters/Locomotion/blend_position", movement.normalized())
	
	var MaxSpeed = move_speed * move
	Speed = Speed.linear_interpolate(MaxSpeed, delta * Acceleration)
	
	var velY = owner.velocity.y
	
	owner.velocity = owner.transform.basis * (Speed)
	
	owner.velocity.y = velY + gravity * delta * JumpAcceleration
	
	return null

func get_movement_input() -> Vector3:
	
	var Direction = Vector3.ZERO
	
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
	
	return Direction
	
func exit():
	.exit()

func enter():
	.enter()
	
