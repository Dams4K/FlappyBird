extends Control

@onready var sceneTransition = $SceneTransition
@onready var gameOver = $GameOver
@onready var game: Node2D = $Game

func _ready():
	sceneTransition.open()
	get_tree().paused = true


func _input(event):
	if event is InputEventKey:
		get_tree().paused = false


func _on_Game_game_over():
	sceneTransition.close()
	gameOver.show_gameover()

func _on_game_over_retry() -> void:
	ScoreManager.reload()
	get_tree().reload_current_scene()
