class_name Animation_State
extends BaseState

export(String) var animation_property_name

export(NodePath) var next_node
export (NodePath) var locomotion_node


onready var locomotion_state: BaseState = get_node(locomotion_node)
onready var next_state: BaseState = get_node(next_node)

var isAnimationEnd = false

func input(event: InputEvent) -> BaseState:
	return null

func physics_process(delta: float) -> BaseState:
	
	if isAnimationEnd == true:
		return next_state
	
	return null
	
func animationEnd():
	isAnimationEnd = true

func exit():
	.exit()

func enter():
	.enter()
	
	animator.set(animation_property_name, true)
	isAnimationEnd = false
