extends CharacterBody2D

class_name Bubble

# STAŁE
const SPEED_MIN : float = 0.1		# Minimalna szybkość bańki
const SPEED_MAX : float = 5.0		# Maksymalna szybkość bańki

# ZMIENNE
var speed : float 					# Szybkość bańki
@onready var sprite_2d = $Sprite2D


# METODY WBUDOWANE
# Spróbujemy tutaj dodać zbieranie punktów w momencie złapania bańki. 
# Nie wiem czy to dobre miejsce ale działa
func _exit_tree():
	GlobalEvents.OnScoreBubbleDelete.emit()

func _ready():
	new_velocity_vector()
	new_speed()
	new_texture()
	new_position()
	#add_to_group("Bubbles") # Nie trzeba - każda nowa instancja jest dodawana automatycznie do grupy 'Bubbles'
	

func _physics_process(delta):
	var collision : KinematicCollision2D = move_and_collide(velocity * speed)
	if collision:
		velocity = velocity.bounce(collision.get_normal())


# METODY WŁASNE
func new_velocity_vector():
	velocity.x = [-1,1][randi() % 2]
	velocity.y = [-1,1][randi() % 2]
	velocity.normalized()
	
	
func new_texture():
	var sprite_number = randi() % 7 + 1 # +1 powoduje, że funkcja randi() startuje od 1 zamiast od 0
	var path = "res://assets/bubbles/Coloured/32x32/bubble_" + str(sprite_number) + ".png"
	sprite_2d.texture = load(path)
	
	
func new_position():
	position = get_viewport().get_mouse_position()
	
	
func new_speed():
	speed = randf_range(SPEED_MIN, SPEED_MAX)
