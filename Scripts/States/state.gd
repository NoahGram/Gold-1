extends Node
class_name State

signal Transitioned(state: State, new_state_name: String)

var player: CharacterBody2D
var animation_player: AnimatedSprite2D

func enter():
	pass
	
func exit():
	pass

func process_input(event: InputEvent):
	pass

func physics_update(_delta: float):
	pass
