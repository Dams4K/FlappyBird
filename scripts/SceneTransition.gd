extends CanvasLayer

@onready var spriteTop: Sprite2D = $SpriteTop
@onready var spriteBottom: Sprite2D = $SpriteBottom


func close():
	var tween: Tween = self.create_tween().set_pause_mode(Tween.TWEEN_PAUSE_PROCESS).set_parallel(true)
	spriteTop.position.y = -228*2
	spriteBottom.position.y = 228*2
	tween.tween_property(spriteTop, "position", Vector2(spriteTop.position.x, -228), .7).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	tween.tween_property(spriteBottom, "position", Vector2(spriteBottom.position.x, 228), .7).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)


func open():
	var tween: Tween = self.create_tween().set_pause_mode(Tween.TWEEN_PAUSE_PROCESS).set_parallel(true)
	spriteTop.position.y = -228
	spriteBottom.position.y = 228
	tween.tween_property(spriteTop, "position", Vector2(spriteTop.position.x, -228*2), .7).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	tween.tween_property(spriteBottom, "position", Vector2(spriteBottom.position.x, 228*2), .7).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)


func idle():
	spriteTop.position.y = 228
	spriteBottom.position.y = 228
