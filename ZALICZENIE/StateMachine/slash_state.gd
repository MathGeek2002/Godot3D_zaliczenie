extends BaseState
class_name SlashAttackState

export (float) var exit_time = 2
export (float) var secoond_attack_available_time = 0.8

export (NodePath) var move_node
export (NodePath) var jump_node
export (NodePath) var second_attack_node

onready var jump_state: BaseState = get_node(jump_node)
onready var move_state: BaseState = get_node(move_node)
onready var second_attack_state : BaseState = get_node(second_attack_node)

var gravity = -9.81

var timer = 0

func enter() -> void:
	.enter()
	
	animator.set("parameters/SlashAttack/active", true)
	
	timer = 0

func physics_process(delta: float) -> BaseState:
	
	timer += delta
	
	if timer > exit_time:
		return move_state
	elif timer > secoond_attack_available_time and Input.is_action_just_pressed("Attack"):
		return second_attack_state
		
	return null
