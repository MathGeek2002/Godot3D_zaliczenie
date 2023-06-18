extends Health

var hasImmunity = false

export(NodePath) var deathStatePath

export(float) var healAmount = 15

var deathState : BaseState

var isDead = false

func _ready():
	
	deathState = get_node(deathStatePath)
	
	

func value_change(new_value):
	
	if hasImmunity == true:
		return
	
	print("Player's health = " + str(new_value))
	.value_change(new_value)
	
	GlobalSignals.emit_signal("onHealthValueChange",(new_value / maxValue) * 100)
	
	if not isDead and new_value <= 0:
		isDead = true
		stateMachine.change_state(deathState)
		GlobalSignals.emit_signal("onShowRedText", "YOU DIED", 2)
		$ResetLevelTimer.start()
	
func immunityEnd():
	hasImmunity = false

func immunityBegin():
	hasImmunity = true

func _on_Timer_timeout():
	immunityEnd()
	
func heath_potion_drink():
	
	if not isDead:
		add(healAmount)


func _on_ResetLevelTimer_timeout():
	get_tree().reload_current_scene()
