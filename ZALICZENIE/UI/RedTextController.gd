extends Label


func _ready():
	$Timer.connect("timeout", self, "hide_text")
	GlobalSignals.connect("onShowRedText",self, "show_text_per_seconds")

func show_text(newText: String):
	text = newText
	visible = true
	
func hide_text():
	visible = false
	text = ""
	
func show_text_per_seconds(newText: String, seconds: float):
	
	show_text(newText)
	$Timer.start(seconds)
