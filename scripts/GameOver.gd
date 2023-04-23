extends CanvasLayer

signal retry

@onready var scoreLabel: Label = $Container/VBoxContainer/ScoreLabel
@onready var bestScoreLabel: Label = $Container/VBoxContainer/BestScoreLabel
@onready var container = $Container

func _ready():
	hide_gameover()


func show_gameover():
	container.show()
	scoreLabel.text = "Score: " + str(ScoreManager.score)
	bestScoreLabel.text = "Best Score: " + str(ScoreManager.best_score)


func hide_gameover():
	container.hide()


func _on_Button_pressed():
	emit_signal("retry")
