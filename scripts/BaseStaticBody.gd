extends StaticBody2D

@onready var baseSprite: Sprite2D = $BaseSprite
@onready var tween = self.create_tween().set_loops()

func _ready():
	tween.tween_property(baseSprite, "position", Vector2(-72, baseSprite.position.y ), 0.6)
	tween.play()
	tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween.tween_callback(reset_tween)


func reset_tween():
	baseSprite.set_position(Vector2(0, baseSprite.position.y))
