class_name Animation_State
extends BaseState

export(String) var animation_property_name

export(NodePath) var next_node

var next_state: BaseState 

func _ready():
	
	if next_node != "":
		next_state = get_node(next_node)

var isAnimationEnd = false

func input(event: InputEvent) -> BaseState:
	return null

func physics_process(delta: float) -> BaseState:
	
	if isAnimationEnd == true and next_node != "":
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
