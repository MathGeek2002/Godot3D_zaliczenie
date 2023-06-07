extends Health

var hasImmunity = false
 

func value_change(new_value):
	
	if hasImmunity == true:
		return
	
	print("Player's health = " + str(new_value))
	.value_change(new_value)
	
	GlobalSignals.emit_signal("onHealthValueChange",(new_value / maxValue) * 100)
	
func immunityEnd():
	hasImmunity = false

func immunityBegin():
	hasImmunity = true

func _on_Timer_timeout():
	immunityEnd()
