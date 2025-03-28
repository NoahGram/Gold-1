extends State
class_name Idle

func enter():
	player.velocity = Vector2.ZERO
	
	if animation_player:
		animation_player.play("Idle")

func process_input(event: InputEvent):
	if event.is_action_pressed("jump"):
		Transitioned.emit(self, "Jumping")
		
	if event.is_action_pressed("down"):
		Transitioned.emit(self, "Disassemble")

func physics_update(_delta: float):
	var input_dir = Input.get_axis("left", "right")
	if input_dir != 0:
		Transitioned.emit(self, "Walking")
		
	if player.velocity.y > 0:
		Transitioned.emit(self, "Falling")
