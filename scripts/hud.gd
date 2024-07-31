extends CanvasLayer

var points = 0
@onready var score_label = $Labels/Score
@onready var end_game_score = $Labels/EndGameScore
@onready var restart_game = $RestartGame
@onready var exit_game = $ExitGame
@onready var game_assets = $GameAssets
@onready var game_info = $GameInfo
@onready var git_hub = $GitHub

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalEvents.OnScoreBubbleDelete.connect(add_point) # wywołujemy metodę 'add_point'
	enable_game_mode()


func add_point():
	points += 1
	score_label.text = "SCORE: " + str(points)


func _on_exit_game_pressed():
	get_tree().quit()

func game_over():
	disable_game_mode()
	end_game_score.text = score_label.text

func enable_game_mode():
	score_label.show()
	end_game_score.hide()
	restart_game.hide()
	exit_game.hide()
	game_assets.hide()
	game_info.hide()
	git_hub.hide()

	
func disable_game_mode():
	score_label.hide()
	end_game_score.show()
	restart_game.show()
	exit_game.show()
	game_assets.show()
	game_info.show()
	git_hub.show()


func _on_restart_game_pressed():
	get_tree().reload_current_scene()
