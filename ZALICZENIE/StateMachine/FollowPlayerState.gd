class_name FollowPlayerState
extends BaseState

export (NodePath) var timerPath
export (float) var move_speed = 10
export(float) var Acceleration = 3
export(float) var runDistance
export(float) var run_speed = 6
export(float) var turn_speed = 4

export (NodePath) var attack_node
export (NodePath) var attack_combo_node
export (NodePath) var tount_node
export (NodePath) var magic_attack_node
export (NodePath) var jump_attack_node
export (NodePath) var eyesPath

onready var attack_state: BaseState = get_node(attack_node)
onready var attack_combo_state: BaseState = get_node(attack_combo_node)
onready var tount_state: BaseState = get_node(tount_node)
onready var magic_attack_state: BaseState = get_node(magic_attack_node)
onready var jump_attack_state: BaseState = get_node(jump_attack_node)

onready var timer = get_node(timerPath)
onready var eyes = get_node(eyesPath)

var Speed = Vector3()

var gravity = -9.81
var JumpAcceleration = 3
var CurrentVerticalSpeed = Vector3()
var Movement = Vector3()

var target

var previous_attack_state : BaseState = null

func input(event: InputEvent) -> BaseState:
	return null

func physics_process(delta: float) -> BaseState:
	
	var myPos = owner.transform.origin
	var distance = (PlayerPosition.value - myPos)
	
	if owner.isStopped == true and IsLookingAtPlayer():
		return getRandomAction()
		
	elif distance.length_squared() >= runDistance * runDistance:
		owner.move_speed = run_speed
	else:
		owner.move_speed = move_speed
		
	animator.set("parameters/Locomotion/blend_position", owner.move_speed / run_speed)

	
	eyes.look_at(PlayerPosition.value, Vector3.UP)
	owner.rotate_y(rad2deg(eyes.rotation.y * turn_speed * delta))
	
	return null

func calculatePath():
	
	target = PlayerPosition.value
	owner.set_target(target)
	
func getRandomAction():
	
	var attacks = [
	attack_state,
	attack_combo_state, 
	magic_attack_state,
	tount_state
	#,jump_attack_state
	]
	
	var new_attack = attacks[randi() % attacks.size()]
	
	while new_attack == previous_attack_state:
		new_attack = attacks[randi() % attacks.size()]
	
	previous_attack_state = new_attack
	return new_attack
	
func exit():
	.exit()
	timer.disconnect("timeout", self, "calculatePath")
	owner.deactivate()

func enter():
	.enter()
		
	calculatePath()
	timer.connect("timeout", self, "calculatePath")
	timer.start()
	owner.isStopped = false
	owner.activate()
	
func IsLookingAtPlayer():
	
	var playerDir = (PlayerPosition.value - owner.transform.origin).normalized()
	
	var forward = -owner.get_global_transform().basis.z
	
	return forward.dot(playerDir) > 0.8
