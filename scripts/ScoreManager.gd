extends Node

const data_path = "user://data"

signal score_changed

var score: int = 0: 
	set(v):
		score = v
		update_score()
var best_score: int = 0
var json = JSON.new()

func _ready():
	if not FileAccess.file_exists(data_path):
		save_best_score()
	load_best_score()


func update_score():
	emit_signal("score_changed")
	print(score)
	if score > best_score:
		best_score = score
		save_best_score()


func reload():
	score = 0


func save_best_score():
	var file = FileAccess.open(data_path, FileAccess.WRITE)
	file.store_string(json.stringify({"best_score": best_score}))
	file.close()


func load_best_score():
	var file = FileAccess.open(data_path, FileAccess.READ)
	json.parse(file.get_as_text())
	best_score = json.get_data()["best_score"]
	file.close()
