extends Node2D

const PIPE: PackedScene = preload("res://scenes/Pipe.tscn")

signal game_over

@onready var spawnTimer: Timer = $SpawnTimer
@onready var pipesSpawnPoint: Marker2D = $PipesSpawnPoint
@onready var pipes: Node2D = $Pipes

func _ready():
	_on_SpawnTimer_timeout()

func _on_SpawnTimer_timeout():
	var new_pipe = PIPE.instantiate()
	new_pipe.position = pipesSpawnPoint.position
	pipes.add_child(new_pipe)


func _on_Bird_is_ded():
	emit_signal("game_over")
