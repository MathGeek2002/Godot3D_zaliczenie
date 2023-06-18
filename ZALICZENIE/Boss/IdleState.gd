extends BaseState


export (NodePath) var movement_node

onready var movement_state: BaseState = get_node(movement_node)

var battleBegined = false

func enter():
	.enter()
	
	owner.set_target(owner)
	
	GlobalSignals.connect("onBossBattleStart", self, "begin_battle")
	
	owner.deactivate()
	
func physics_process(delta):
	
	if battleBegined:
		return movement_state
	
	return null
	
func begin_battle():
	battleBegined = true
	
func exit():
	.exit()
	
	owner.activate()


