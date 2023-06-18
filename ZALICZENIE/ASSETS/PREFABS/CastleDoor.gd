extends Interactible

export(NodePath) var animatorPath

export(String) var doorAnimationName = "DoorOpening"

onready var animator = get_node(animatorPath)

var isPlayerInRange = false

var isOpen = false

func _ready():
	._ready()
	GlobalSignals.connect("onBossBattleStart", self, "close_the_door")
		
func _input(event):
	
	var input_presssed = event.is_action_pressed("Interact")
	
	if not isOpen or not input_presssed:
		return
	
	._input(event)
		

func close_the_door():
	animator.play_backwards(doorAnimationName)
	
func interaction():
	animator.play(doorAnimationName)
	GlobalSignals.emit_signal("onHideActionInfo")
	isOpen = true
