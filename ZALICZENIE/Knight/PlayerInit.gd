extends Node


func _ready():
	var player = get_parent().get_parent()
	var animator = player.get_node("RootNode/AnimationTree")
	
	var stateMachine = get_parent()
	
	stateMachine.init(player,animator)
