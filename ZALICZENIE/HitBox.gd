extends Area
class_name HitBox


export (NodePath) var healthPath

var health : Health

func _ready():
	health = get_node(healthPath)
	
func getDamage(amount):
	health.subtract(amount)



