extends Spatial
class_name Stat


export (float) var maxValue

var value setget value_change 

func _ready():
	value = maxValue


func value_change(new_value):
	value = clamp( new_value , 0, maxValue)
	
func subtract(amount):
	value_change(value - amount)
	
func add(amount):
	value_change(value + amount)

