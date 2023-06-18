extends Area
class_name Interactible

var playerInRange = false

func _ready():
	connect("body_entered", self, "on_body_entered")
	connect("body_exited", self, "on_body_exited")
	
func on_body_entered(body):
	
	if not  body.is_in_group("player"):
		return
		
	GlobalSignals.emit_signal("onShowActionInfo", "Press E")
	playerInRange = true

func on_body_exited(body):
	
	if not body.is_in_group("player"):
		return
		
	GlobalSignals.emit_signal("onHideActionInfo")
	playerInRange = false
	
	
func _input(event):
	
	if event.is_action_pressed("Interact") and playerInRange:
		interaction()
	else:
		return
		
func interaction():
	pass
