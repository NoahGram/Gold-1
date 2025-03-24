extends State
class_name Jumping

const JUMP_FORCE = -400.0
const GRAVITY = 600.0

func enter():
	player.velocity.y = JUMP_FORCE
	player.get_node("AnimatedSprite2D").play("Jump")
	#if animation_player:
		#animation_player.new().play("Jump")
	

func physics_update(delta: float):
	# Apply gravity while jumping
	player.velocity.y += GRAVITY * delta

	# Get horizontal input
	var input_dir = Input.get_axis("left", "right")
	if not Input.is_action_pressed("run"):
		player.velocity.x = input_dir * 100.0
	player.velocity.x = input_dir * 200.0

	if input_dir < 0:
		animation_player.flip_h = true
	else:
		animation_player.flip_h = false
	# Transition to falling if velocity in Y axis is positive
	if player.velocity.y > 0:
		Transitioned.emit(self, "Falling")
