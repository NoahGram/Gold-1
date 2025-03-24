extends State
class_name Falling

const GRAVITY = 700.0

func enter():
	pass
	player.get_node("AnimatedSprite2D").play("Jump")

func physics_update(delta: float):
	player.velocity.y += GRAVITY * delta

	var input_dir = Input.get_axis("left", "right")
	player.velocity.x = input_dir * 100.0
	
	if input_dir < 0:
		animation_player.flip_h = true
	else:
		animation_player.flip_h = false

	player.move_and_slide()

	if player.is_on_floor():
		if input_dir != 0:
			Transitioned.emit(self, "Walking")
		else:
			Transitioned.emit(self, "Idle")
