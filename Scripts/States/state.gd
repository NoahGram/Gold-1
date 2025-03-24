extends Node
class_name State

signal Transitioned(state: State, new_state_name: String)

var player: CharacterBody2D
var animation_player = AnimatedSprite2D

# The enter method is called when the state is entered
func enter():
	pass
	
# The exit method is called when the state is exited
func exit():
	pass

# process_input will be called on each input event
func process_input(event: InputEvent):
	pass

# physics_update will be called every frame during physics processing
func physics_update(_delta: float):
	pass
