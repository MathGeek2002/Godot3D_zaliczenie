class_name Animation_State
extends BaseState

export(String) var animation_property_name

export(NodePath) var next_node

export(float)var exit_time = 10

var next_state: BaseState 

var timer = 0

func _ready():
	
	if next_node != "":
		next_state = get_node(next_node)

var isAnimationEnd = false

func input(event: InputEvent) -> BaseState:
	return null

func physics_process(delta: float) -> BaseState:
		
	if isAnimationEnd == true and next_node != "":
		return next_state
	
	timer += delta
	
	if timer > exit_time and next_node != "":
		return next_state
	
	return null
	
func animationEnd():
	isAnimationEnd = true

func exit():
	.exit()

func enter():
	.enter()
	timer = 0
	
	animator.set(animation_property_name, true)
	isAnimationEnd = false
