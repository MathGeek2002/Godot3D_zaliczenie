extends ProgressBar


func _ready():
	GlobalSignals.connect("onHealthValueChange",self,"changeFillAmount")
	value = 100
	
func changeFillAmount(newValue):
	value = newValue
