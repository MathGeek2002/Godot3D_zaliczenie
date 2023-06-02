extends AnimationTree

var controller

var animator

func _ready():
	controller = get_parent().get_parent().get_node("Controller")
	animator = self

func _process(delta):
	var movement = Vector2(controller.Direction.x,controller.Direction.z)
	animator.set("parameters/Locomotion/blend_position", movement.normalized())
	
	if Input.is_action_just_pressed("Jump"):
		animator.set("parameters/Jump/active", true)
	
	if Input.is_action_just_pressed("Attack"):
		attackBegin()
		
func attackBegin():
	animator.set("parameters/SlashAttack/active", true)
	controller.tree().paused = true
		
func attackEnd():
	print("Attack end")
	controller.tree().paused = false
	
	
