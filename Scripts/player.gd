extends CharacterBody2D

const GRAVITY = 600.0

@onready var state_machine = $StateMachine

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	move_and_slide()
