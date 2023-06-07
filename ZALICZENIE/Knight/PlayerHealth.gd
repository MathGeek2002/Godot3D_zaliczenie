extends Health

var hasImmunity = false

func value_change(new_value):
	
	if hasImmunity == true:
		return
	
	print("Player's health = " + str(new_value))
	.value_change(new_value)
	
func immunityEnd():
	hasImmunity = false

func immunityBegin():
	hasImmunity = true

func _on_Timer_timeout():
	immunityEnd()
