extends State
class_name Assemble

var is_animation_playing = false

func enter():
	player.velocity = Vector2.ZERO
	
	if animation_player:
		animation_player.play("Assemble")
		is_animation_playing = true
		animation_player.animation_finished.connect(on_animation_finished)

func process_input(event: InputEvent):
	if is_animation_playing:
		return
		
	if event.is_action_pressed("down"):
		Transitioned.emit(self, "Disassemble")

func on_animation_finished():
	is_animation_playing = false
	
func physics_update(delta: float) -> void:
	if is_animation_playing:
		return
		
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		Transitioned.emit(self, "Idle")
