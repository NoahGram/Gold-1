extends State
class_name Disassemble

func enter():
	player.velocity = Vector2.ZERO
	
	if animation_player:
		animation_player.play("Disassemble")

func process_input(event: InputEvent):
	if event.is_action_pressed("up") or event.is_action_pressed("left") or event.is_action_pressed("right"):
		Transitioned.emit(self, "Assemble")
