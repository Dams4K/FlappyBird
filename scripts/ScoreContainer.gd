extends HBoxContainer

var SPRITE_NUMBERS = {
	"0": load("res://assets/sprites/0.png"),
	"1": load("res://assets/sprites/1.png"),
	"2": load("res://assets/sprites/2.png"),
	"3": load("res://assets/sprites/3.png"),
	"4": load("res://assets/sprites/4.png"),
	"5": load("res://assets/sprites/5.png"),
	"6": load("res://assets/sprites/6.png"),
	"7": load("res://assets/sprites/7.png"),
	"8": load("res://assets/sprites/8.png"),
	"9": load("res://assets/sprites/9.png")
}

func _ready():
	ScoreManager.connect("score_changed", _on_score_changed)
	
func _on_score_changed():
	var new_score = ScoreManager.score
	if len(str(new_score)) > get_child_count():
		add_child(TextureRect.new())
	for i in range(len(str(ScoreManager.score))):
		var nbr = str(ScoreManager.score)[i]
		get_child(i).texture = SPRITE_NUMBERS[nbr]
