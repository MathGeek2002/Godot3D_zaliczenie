extends Stat
class_name Health

export (NodePath) var stateMachinePath
export (NodePath) var hitReactionPath

var stateMachine : StateMachine
var hitReactionState : BaseState

func _ready():
	._ready()
	stateMachine = get_node(stateMachinePath)
	hitReactionState = get_node(hitReactionPath)

func value_change(new_value):
	.value_change(new_value)
	
	if hitReactionPath != null:
		stateMachine.change_state(hitReactionState)
	
