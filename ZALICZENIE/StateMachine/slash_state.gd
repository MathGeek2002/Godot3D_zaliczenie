extends BaseState
class_name SlashAttackState

export (float) var exit_time = 2

export (NodePath) var move_node
export (NodePath) var jump_node

onready var jump_state: BaseState = get_node(jump_node)
onready var move_state: BaseState = get_node(move_node)

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
		
	return null
