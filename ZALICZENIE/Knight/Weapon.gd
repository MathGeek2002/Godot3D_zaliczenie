extends Area


export (float) var damage = 20

func _ready():
	connect("area_entered", self, "_on_Area_area_entered")
	deactivate()

func _on_Area_area_entered(area):
	
	if area.has_method("getDamage"):
		area.getDamage(damage)
		print("damage " + str(damage))
		
func activate():
	monitoring = true
	monitorable = true
	
func deactivate():
	monitoring = false
	monitorable = false
