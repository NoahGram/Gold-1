extends State
class_name Jumping

const JUMP_FORCE = -400.0
const GRAVITY = 600.0

func enter():
	player.velocity.y = JUMP_FORCE
	if animation_player:
		animation_player.play("Jump")
	

func physics_update(delta: float):
	player.velocity.y += GRAVITY * delta

	var input_dir = Input.get_axis("left", "right")
	if not Input.is_action_pressed("run"):
		player.velocity.x = input_dir * 100.0
	else:
		player.velocity.x = input_dir * 200.0

	animation_player.flip_h = player.velocity.x < 0

	if player.velocity.y > 0:
		Transitioned.emit(self, "Falling")
