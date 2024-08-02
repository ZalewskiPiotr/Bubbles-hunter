extends Node

@onready var bubble_score = $BubbleScore
@onready var bubble_killer = $BubbleKiller
@onready var player_death = $PlayerDeath


func play_bubble_score():
	bubble_score.play()
	

func play_bubble_killer():
	bubble_killer.play()
	

func play_player_death():
	player_death.play()
