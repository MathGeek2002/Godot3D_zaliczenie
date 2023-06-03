extends BaseState

export (float) var move_speed = 10

export (NodePath) var attack_node
export (NodePath) var move_node

onready var attack_state: BaseState = get_node(attack_node)
onready var move_state: BaseState = get_node(move_node)

var animationEnded = false

var damping

func enter() -> void:
	# This calls the base class enter function, which is necessary here
	# to make sure the animation switches
	.enter()
	
	animator.set("parameters/Roll/active", true)
	
	animationEnded = false
	
	damping = player.damping
	player.damping = 1
	
	player.velocity = player.transform.basis * -Vector3.FORWARD * move_speed


func physics_process(delta: float) -> BaseState:
	
	print("ROLL")
	
	if animationEnded == true:
		return move_state
	
	return null

func animationEnd():
	animationEnded = true
	player.damping = damping