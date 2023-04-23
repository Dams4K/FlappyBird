extends Node2D

func _ready():
	randomize()
	position.y = randf_range(-170, 50)
	var tween = get_tree().create_tween()
	tween.tween_property(self, "global_position", Vector2(-36, global_position.y), 3)


func _on_Area2D_body_entered(body):
	if body is Bird:
		ScoreManager.score += 1


func _on_VisibleOnScreenNotifier2D_screen_exited():
	queue_free()
