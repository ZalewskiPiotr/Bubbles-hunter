extends Node2D

## Moduł nadzoruje całą grę
##
## Parametry gry, które można zmieniać:
## - Maksymalna ilość baniek, które mogą być utworzone za jednym razem.
## Jest dostępny w skrypcie 'game.gd' jako zmienna 'max_bubbles_quantity_spawn'
## - W jakich odstępach czasu generują się bańki
## Jest dostępny w timerze 'BubbleGenerator' w oknie inspektora jako 'Wait time'
## - Minimalna szybkość bańki
## Jest dostępny w skrypcie 'bubble.gd' jako stała 'SPEED_MIN'
## - Maksymalna szybkość bańki
## Jest dostępny w skrypcie 'bubble.gd' jako stała 'SPEED_MAX'

# ZMIENNE
@export var bubble_scene : PackedScene # w inspektorze trzeba załadować odpowiednią scenę lub napisać tak w kodzie var bubble_scene = preload("res://scenes/bubble.tscn")
@export var killer_bubble_scene : PackedScene
@onready var timer_bubble_generator = %BubbleGenerator
@onready var hud = $HUD


var max_bubbles_quantity_spawn : int = 5 # MAksymalna ilość baniek, które mogą być utworzone za jednym razem

# FUNKCJE WBUDOWANE
# In global scope, you can find a randomize() method. This method should be called only once when your 
# project starts to initialize the random seed. Calling it multiple times is unnecessary and may 
# impact performance negatively. 
# Putting it in your main scene script's _ready() method is a good choice:
func _ready():
	randomize()
	

# Funkcja sprawdza wciśnięcie klawiszy	
func _input(event):
	if event.is_action_pressed("LPM") and !timer_bubble_generator.is_stopped(): # na gameover zatrzymujemy generator baniek. W związku z tym na LPM też nie pomgą tworzyć się bańki
		create_bubble()


# ZDARZENIA
## Metoda nadzorująca tworzenie baniek
##
## W metodzie generowane są nowe bańki. Metoda jest wywoływana przez timer 'BubbleGenerator'
func _on_bubble_generator_timeout():
	create_score_bubbles()
	create_killer_bubbles()
	
# METODY SKRYPTU
func create_score_bubbles():
	var amount_of_bubbles_prodeced = randi() % max_bubbles_quantity_spawn + 1
	for i in amount_of_bubbles_prodeced:
		await get_tree().create_timer(0.2).timeout # dodałem bo dziwne rzeczy działy się jak tworzyło się na raz kilka bąbelków
		create_bubble()


## Tworzenie nowych baniek killerów
##
## Metoda tworzy nową instancję obiektu bańki, która niszczy gracza (BubbleKiller). Reszta ustawień odbywa się w metodzie
## _on_ready(), konkretnej instancji obiektu BubbleKiller
func create_killer_bubbles():
	var if_create_killer = [true,false][randi()%2]
	if if_create_killer:
		print('Making killer bubble')
		var new_killer_bubble = killer_bubble_scene.instantiate()
		add_child(new_killer_bubble)


## Tworzenie nowej bańki
##
## Metoda tworzy nową instancję obiektu bańki (Bubble). Reszta ustawień odbywa się w metodzie
## _on_ready(), konkretnej instancji obiektu Bubble
func create_bubble():
	var new_ball = bubble_scene.instantiate()
	add_child(new_ball)
	
func game_over():
	timer_bubble_generator.stop()
	hud.game_over()
	print("game over")
	# TODO: dodać jeszcze wyświetlanie planszy końcowej (game over, punkty, button next game, author, version, home page link)
