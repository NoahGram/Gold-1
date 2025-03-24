extends State
class_name Idle

func enter():
	player.velocity = Vector2.ZERO
	#animation_player.play("idle")
	player.get_node("AnimatedSprite2D").play("Idle")

func process_input(event: InputEvent):
	if event.is_action_pressed("jump"):
		Transitioned.emit(self, "Jumping")

func physics_update(_delta: float):
	var input_dir = Input.get_axis("left", "right")
	if input_dir != 0:
		Transitioned.emit(self, "Walking")
		
	if player.velocity.y > 0:
		Transitioned.emit(self, "Falling")
