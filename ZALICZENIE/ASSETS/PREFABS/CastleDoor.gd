extends Area

export(NodePath) var animatorPath

export(String) var doorAnimationName = "DoorOpening"

onready var animator = get_node(animatorPath)

var isPlayerInRange = false

var isOpen = false

func _ready():
	GlobalSignals.connect("onBossBattleStart", self, "close_the_door")

func _on_Doors_body_entered(body):
	
	if body.is_in_group("player") and not isOpen:
		isPlayerInRange = true
		GlobalSignals.emit_signal("onShowActionInfo", "Press E")
		


func _on_Doors_body_exited(body):
	
	if body.is_in_group("player"):
		isPlayerInRange = false
		GlobalSignals.emit_signal("onHideActionInfo")
		
func _input(event):
	
	var input_presssed = event.is_action_pressed("Interact")
	
	if input_presssed and isPlayerInRange and not isOpen:
		animator.play(doorAnimationName)
		GlobalSignals.emit_signal("onHideActionInfo")
		isOpen = true
		

func close_the_door():
	animator.play_backwards(doorAnimationName)
	
