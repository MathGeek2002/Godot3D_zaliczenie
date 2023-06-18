extends ColorRect


export(Texture) var flask0
export(Texture) var flask1
export(Texture) var flask2
export(Texture) var flask3


onready var icon = $EstusIcon

var flasks

func _ready():
	
	flasks = [ flask0, flask1, flask2, flask3 ]	
	icon.texture = flasks[3]
	
	GlobalSignals.connect("onEstusDrink", self, "actualize_icon")
	

func actualize_icon(use_left):
	
	icon.texture = flasks[use_left]


