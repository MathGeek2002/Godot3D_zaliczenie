extends KinematicBody
 
export(float) var damping = 0.95

var velocity = Vector3.ZERO

var gravity = -9.81
var JumpAcceleration = 3
var CurrentVerticalSpeed = Vector3()
var Movement = Vector3()

var isActive = true

func _ready():
	PlayerPosition.value = transform.origin

func _physics_process(delta):
	
	if not isActive:
		return
	
	var velocityY = velocity.y
	
	velocity *= damping
	
	velocity.y = velocityY
	
	move_and_slide( velocity, Vector3.UP )
	
	if is_on_floor():
		velocity.y = 0
		
	PlayerPosition.value = transform.origin
	
func deactivate():
	isActive = false
	move_and_slide( Vector3.ZERO, Vector3.UP )
