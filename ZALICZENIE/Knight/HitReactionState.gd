extends Animation_State
class_name HitReactionStaate

export (float) var exit_time = 0.9

var timer = 0

func enter() -> void:
	
	.enter()
	
	timer = 0


func physics_process(delta):
	
	.physics_process(delta)
	
	timer += delta
	
	if timer > exit_time:
		return next_state
