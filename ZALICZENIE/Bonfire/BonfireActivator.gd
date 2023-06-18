extends Interactible


func _ready():
	._ready()
	GlobalSignals.connect("onBossDie",self,"show_bonfire")
	get_parent().visible = false
	$CollisionShape.disabled = true

func show_bonfire():
	get_parent().visible = true
	$CollisionShape.disabled = false
	monitorable = true
	monitoring = true

		
func interaction():
	get_tree().reload_current_scene()
