extends Health

var hasImmunity = false

func value_change(new_value):
	
	if hasImmunity == true:
		return
	
	.value_change(new_value)
	
func immunityEnd():
	hasImmunity = false

func immunityBegin():
	hasImmunity = true

func _on_Timer_timeout():
	immunityEnd()
