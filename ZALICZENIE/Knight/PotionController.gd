extends Spatial


export(int) var max_number_of_use = 3

var use_left 

func _ready():
	
	use_left = max_number_of_use

func drink_potion():
	
	use_left -= 1
	
	GlobalSignals.emit_signal("onEstusDrink", use_left)
	
	
func can_drink_potion() -> bool:
	
	return use_left > 0
