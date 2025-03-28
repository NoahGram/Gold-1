extends Node
class_name StateMachine

@export var initial_state: State
var current_state: State
@onready var state_label: Label = $"../StateLabel"

func _ready() -> void:
	var parent = get_parent()
	
	for state in get_children():
		if state is State:
			state.player = parent
			state.animation_player = parent.get_node("AnimatedSprite2D")
			state.Transitioned.connect(on_change_state)

	if initial_state:
		current_state = initial_state
		current_state.enter()

func _input(event: InputEvent) -> void:
	if current_state:
		current_state.process_input(event)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)
		

func on_change_state(state: State, new_state_name: String):
	if state != current_state:
		return

	var new_state = find_child(new_state_name)
	if new_state and new_state is State:
		current_state.exit()
		current_state = new_state
		current_state.enter()
	
	print(state.name, " --> ", new_state_name)
	state_label.text = str(current_state.name)
