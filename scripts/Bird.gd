extends RigidBody2D
class_name Bird

const JUMP_SPEED = 350

signal is_ded

var ded = false

@onready var animatedSprite2D: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta):
	if Input.is_action_just_pressed("jump"):
		jump()
	if is_jumping():
		animatedSprite2D.play()
	if is_falling():
		animatedSprite2D.stop()
		animatedSprite2D.frame = 1


func jump():
	set_linear_velocity(Vector2(get_linear_velocity().x, -JUMP_SPEED))


func is_jumping() -> bool:
	return int(get_linear_velocity().y) < 0


func is_falling() -> bool:
	return get_linear_velocity().y > JUMP_SPEED/2


func _on_Bird_body_entered(body):
	print(body)
	if not ded:
		ded = true
		animatedSprite2D.stop()
		animatedSprite2D.frame = 1
		set_process(false)
		emit_signal("is_ded")
