extends KinematicBody

export (NodePath) var navigationAgent

var move_speed = 10
export(float) var Acceleration = 3
export(float) var stoppingDistance = 1

onready var agent = get_node(navigationAgent)

var target

var velocity = Vector3.ZERO

var isStopped = false

func _physics_process(delta):
	
	var dir : Vector3
	dir = (agent.get_next_location() - transform.origin)
	
	var myPos = transform.origin
	var distance = (PlayerPosition.value - myPos)
	
	var velocity = dir.normalized() * move_speed
	
	if distance.length_squared() >= stoppingDistance * stoppingDistance:
		move_and_slide(velocity, Vector3.UP)
		isStopped = false
	else:
		isStopped = true
		move_speed = 0
		

func set_target(new_target):
	
	target = new_target
	
	if agent != null:
		agent.set_target_location(new_target)
