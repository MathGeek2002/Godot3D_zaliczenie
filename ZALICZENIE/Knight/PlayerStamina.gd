extends Stat

export(float) var regeneration = 10

func _ready():
	._ready()
	$StaminaTimer.connect("timeout",self, "regenerate_stamina")

func value_change(new_value):
	.value_change(new_value)

func regenerate_stamina():
	add(regeneration)
