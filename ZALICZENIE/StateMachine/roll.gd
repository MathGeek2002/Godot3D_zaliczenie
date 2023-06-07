extends BaseState
class_name RollState

export (float) var move_speed = 10

export (NodePath) var attack_node
export (NodePath) var move_node
export (NodePath) var stab_node

export (float) var stab_enabled_time = 1.2

onready var attack_state: BaseState = get_node(attack_node)
onready var move_state: BaseState = get_node(move_node)
onready var stab_state: BaseState = get_node(stab_node)

var animationEnded = false

var damping

var timer = 0

func enter() -> void:
	# This calls the base class enter function, which is necessary here
	# to make sure the animation switches
	.enter()
	
	animator.set("parameters/Roll/active", true)
	
	animationEnded = false
	
	damping = owner.damping
	owner.damping = 1
	
	owner.velocity = owner.transform.basis * -Vector3.FORWARD * move_speed
	
	timer = 0


func physics_process(delta: float) -> BaseState:
	
	if animationEnded == true:
		return move_state
		
	if timer >= stab_enabled_time and Input.is_action_just_pressed("Attack"):
		return stab_state
		
	timer += delta
	
	return null

func animationEnd():
	animationEnded = true
	owner.damping = damping
