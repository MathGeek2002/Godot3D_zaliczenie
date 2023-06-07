extends ProgressBar



func _ready():
	GlobalSignals.connect("onStaminaValueChange",self,"changeFillAmount")
	value = 100
	
func changeFillAmount(newValue):
	value = newValue
