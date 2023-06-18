extends ColorRect


func _ready():
	GlobalSignals.connect("onShowActionInfo",self, "showActionInfo")
	GlobalSignals.connect("onHideActionInfo",self, "hideActionInfo")
	
	visible = false
	
func showActionInfo(text):
	
	visible = true
	$Label.text = text

func hideActionInfo():
	
	visible = false
