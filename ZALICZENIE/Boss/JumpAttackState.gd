extends Animation_State

export (NodePath) var posAfterJumpPath

onready var posAfterJump = get_node(posAfterJumpPath)

var newPos

func enter() -> void:
	
	newPos = posAfterJump.global_transform.origin
	
	.enter()
	
func exit() -> void:
	
	.exit()
	
	owner.global_transform.origin = newPos
	
