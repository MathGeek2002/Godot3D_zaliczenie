extends StaticBody


var isActive = false

var playerEntered = false


func _ready():
	GlobalSignals.connect("onBossDie",self,"show_bonfire")
	visible = false

func show_bonfire():
	visible = true
	$CollisionShape.disabled = false
	$InterctionArea.monitorable = true
	$InterctionArea.monitoring = true


func _on_InterctionArea_body_entered(body):
	
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("onShowActionInfo", "Press E")
		playerEntered = true

func _on_InterctionArea_body_exited(body):
	
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("onHideActionInfo")
		playerEntered = false
		
func _input(event):
	
	if event.is_action_pressed("Interact") and playerEntered:
		get_tree().reload_current_scene()
