extends Health

export(NodePath) var deathStatePath

onready var death_state = get_node(deathStatePath)

var isDead = false

func value_change(new_value):
	
	print("Boss's health = " + str(new_value))
	.value_change(new_value)
	
	GlobalSignals.emit_signal("onBossValueChange", (value / maxValue) * 100)
	
	if not isDead and value == 0:
		GlobalSignals.emit_signal("onShowRedText", "DARK LORD FALLEN", 3)
		GlobalSignals.emit_signal("onBossDie")
		stateMachine.change_state(death_state)

