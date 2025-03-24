extends CharacterBody2D

const GRAVITY = 600.0  # Gravity force

@onready var state_machine = $StateMachine

func _physics_process(delta: float) -> void:
	# Apply gravity if player is not on the floor
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Move player based on current velocity
	move_and_slide()
