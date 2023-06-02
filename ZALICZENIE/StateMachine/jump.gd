extends BaseState

export (float) var jump_force = 100
export (float) var move_speed = 10
export(float) var MaxJump = 10
var JumpAcceleration = 3

export (NodePath) var attack_node
export (NodePath) var move_node

onready var attack_state: BaseState = get_node(attack_node)
onready var move_state: BaseState = get_node(move_node)

var gravity = -9.81

var isFirstFrame = true

func enter() -> void:
	# This calls the base class enter function, which is necessary here
	# to make sure the animation switches
	.enter()
	
	animator.set("parameters/Jump/active", true)
	
	player.velocity = Vector3(0,MaxJump,0)
	isFirstFrame = true

func physics_process(delta: float) -> BaseState:
	
	print("JUMP")
	
	player.velocity += Vector3.UP * gravity * delta * JumpAcceleration

	if player.is_on_floor() and not isFirstFrame:
		return move_state
	
	isFirstFrame = false
		
	return null
