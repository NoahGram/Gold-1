extends State
class_name Running

const RUN_SPEED = 250.0

func enter():
	#animation_player.new().play("Run")
	player.get_node("AnimatedSprite2D").play("Run")
	#pass

func process_input(event: InputEvent):
	if event.is_action_pressed("jump") and player.is_on_floor():
		Transitioned.emit(self, "Jumping")

func physics_update(delta: float):
	# Get horizontal input
	var input_dir = Input.get_axis("left", "right")
	
	# If there's no input, transition to idle
	if input_dir == 0:
		Transitioned.emit(self, "Idle")
		return

	if not Input.is_action_pressed("run"):
		Transitioned.emit(self, "Walking")
		return
		
	if input_dir < 0:
		animation_player.flip_h = true
	else:
		animation_player.flip_h = false
		
	if player.velocity.y > 0:
		Transitioned.emit(self, "Falling")
	# Set running velocity
	player.velocity.x = input_dir * RUN_SPEED
	
