class_name BaseState
extends Node

# Pass in a reference to the player's kinematic body so that it can be used by the state
var player: KinematicBody
var animator: AnimationTree

func enter() -> void:
	pass

func exit() -> void:
	pass

func input(event: InputEvent) -> BaseState:
	return null

func process(delta: float) -> BaseState:
	return null

func physics_process(delta: float) -> BaseState:
	return null
