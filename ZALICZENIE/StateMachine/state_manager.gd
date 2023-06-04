extends Node
class_name StateMachine

export (NodePath) var starting_state
export (NodePath) var playerPath
export (NodePath) var animatorPath

var current_state: BaseState

func change_state(new_state: BaseState) -> void:
	if current_state:
		current_state.exit()

	current_state = new_state
	current_state.enter()
	
func _ready():
	
	var player = get_node(playerPath)
	var animator = get_node(animatorPath)
	
	init(player, animator)

# Initialize the state machine by giving each state a reference to the objects
# owned by the parent that they should be able to take control of
# and set a default state
func init(player: KinematicBody, animator : AnimationTree) -> void:
	for child in get_children():
		child.owner = player
		child.animator = animator

	# Initialize with a default state of idle
	change_state(get_node(starting_state))
	
# Pass through functions for the Player to call,
# handling state changes as needed
func _physics_process(delta: float) -> void:
	
	var new_state = current_state.physics_process(delta)
	if new_state:
		change_state(new_state)

func _input(event: InputEvent) -> void:
	var new_state = current_state.input(event)
	if new_state:
		change_state(new_state)

func _process(delta: float) -> void:
	var new_state = current_state.process(delta)
	if new_state:
		change_state(new_state)

