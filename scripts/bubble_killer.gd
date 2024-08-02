extends CharacterBody2D

class_name BubbleKiller

# STAŁE
const SPEED_MIN : float = 0.1		# Minimalna szybkość bańki
const SPEED_MAX : float = 5.0		# Maksymalna szybkość bańki

# ZMIENNE
var speed : float 					# Szybkość bańki
@onready var sprite_2d = $Sprite2D


# METODY WBUDOWANE
func _ready():
	print("bubble->_ready(): tworzę bańkę killer")
	new_velocity_vector()
	new_speed()
	new_position()
	#add_to_group("Bubbles") # Nie trzeba - każda nowa instancja jest dodawana do tej grupy
	

func _physics_process(delta):
	var collision : KinematicCollision2D = move_and_collide(velocity * speed)
	if collision:
		velocity = velocity.bounce(collision.get_normal())


# METODY WŁASNE
func new_velocity_vector():
	velocity.x = [-1,1][randi() % 2]
	velocity.y = [-1,1][randi() % 2]
	velocity.normalized()
	
	
func new_position():
	position = get_viewport().get_mouse_position()
	
	
func new_speed():
	speed = randf_range(SPEED_MIN, SPEED_MAX)
