extends KinematicBody

export (NodePath) var navigationAgent

var move_speed = 10
export(float) var Acceleration = 3
export(float) var stoppingDistance = 1

onready var agent = get_node(navigationAgent)

var target

var velocity = Vector3.ZERO

var isStopped = false

var isActive = true

var timer = 0

func _physics_process(delta):
	
	if not isActive:
		return
	
	var dir : Vector3
	dir = (agent.get_next_location() - transform.origin)
	
	var myPos = transform.origin
	var distance = (PlayerPosition.value - myPos)
	
	var velocity = dir.normalized() * move_speed
	
	
	if distance.length_squared() >= stoppingDistance * stoppingDistance:
		isStopped = false
	else:
		isStopped = true
		
	if isStopped:
		velocity = Vector3.ZERO
	
	move_and_slide(velocity, Vector3.UP)
		
		

func set_target(new_target):
	
	target = new_target
	
	if agent != null:
		agent.set_target_location(new_target)

func deactivate():
	isActive = false
	
func activate():
	isActive = true
