extends StateMachine

export(NodePath) var staminaPath

var stamina

var isActive = true

func _ready():
	
	stamina = get_node(staminaPath)

	._ready()

func change_state(new_state: BaseState) -> void:
	
	stamina = get_node(staminaPath)
	
	if stamina.get_value() < new_state.stamina_cost:
		return
		
	stamina.subtract(new_state.stamina_cost)
	
	.change_state(new_state)
	
func _physics_process(delta):
	
	if not isActive:
		return
	
	._physics_process(delta)
	
func deactivate():
	isActive = false
	
func activate():
	isActive = true


