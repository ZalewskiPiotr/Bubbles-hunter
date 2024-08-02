extends Node

@onready var bubble_score = $BubbleScore
@onready var bubble_killer = $BubbleKiller
@onready var player_death = $PlayerDeath

func _ready():
	print("SFX->_ready: dodałem do drzewa obiekt sfx")
	GlobalEvents.OnScoreBubbleDelete.connect(play_bubble_score)

func play_bubble_score():
	print("SFX->play_bubble_score: zagrałem dźwięk złapanej bańki")
	bubble_score.play()
	

func play_bubble_killer():
	bubble_killer.play()
	

func play_player_death():
	player_death.play()
