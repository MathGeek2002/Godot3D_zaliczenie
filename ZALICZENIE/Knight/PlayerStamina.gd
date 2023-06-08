extends Stat

export(float) var regeneration = 10

func _ready():
	._ready()
	$StaminaTimer.connect("timeout",self, "regenerate_stamina")

func value_change(new_value):
	.value_change(new_value)
	GlobalSignals.emit_signal("onStaminaValueChange",(new_value / maxValue) * 100)

func regenerate_stamina():
	add(regeneration)
	

func get_value():
	return value
