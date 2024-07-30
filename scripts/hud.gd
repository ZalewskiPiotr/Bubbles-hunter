extends CanvasLayer

var points = 0
@onready var score_label = $Score

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalEvents.OnScoreBubbleDelete.connect(add_point) # wywołujemy metodę 'add_point'


func add_point():
	points += 1
	score_label.text = "SCORE: " + str(points)


func _on_exit_game_pressed():
	get_tree().quit()
