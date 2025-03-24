extends State
class_name Walking

const WALK_SPEED = 150.0

func enter():
	player.get_node("AnimatedSprite2D").play("Walk")
	#pass#animation_player.play("walk")

func process_input(event: InputEvent):
	if event.is_action_pressed("jump") and player.is_on_floor():
		Transitioned.emit(self, "Jumping")

func physics_update(delta: float):
	var input_dir = Input.get_axis("left", "right")
	if input_dir == 0:
		Transitioned.emit(self, "Idle")
		return
	
	if Input.is_action_pressed("run"):
		Transitioned.emit(self, "Running")
		return
	
	if input_dir < 0:
		animation_player.flip_h = true
	else:
		animation_player.flip_h = false
		
	if player.velocity.y > 0:
		Transitioned.emit(self, "Falling")
	player.velocity.x = input_dir * WALK_SPEED
