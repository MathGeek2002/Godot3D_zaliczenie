extends ProgressBar



func _ready():
	GlobalSignals.connect("onBossValueChange",self,"changeFillAmount")
	value = 100
	
func changeFillAmount(newValue):
	value = newValue
