extends State
class_name Falling

const FALL_MULTIPLIER = 2.5

func enter():
	if animation_player:
		animation_player.play("Fall")

func physics_update(delta: float):
	player.velocity.y += player.GRAVITY * FALL_MULTIPLIER * delta  

	var input_dir = Input.get_axis("left", "right")
	player.velocity.x = input_dir * 100.0
	
	animation_player.flip_h = player.velocity.x < 0

	if player.is_on_floor():
		if input_dir != 0:
			Transitioned.emit(self, "Walking")
		else:
			Transitioned.emit(self, "Idle")
