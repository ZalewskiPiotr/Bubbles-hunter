extends CharacterBody2D
signal hit


const SPEED = 400.0


@onready var necromancer : AnimatedSprite2D = $AnimatedSprite2D
# @export var necromancer : AnimatedSprite2D # przy użyciu export można przypisać odpowiedni node do necromancer bezpośrednio w inspektorze
var player_is_killed : bool = false
var points : int = 0 # Ta zmienna nie jest mi do niczego potrzebna w grze. Pokazuje tylko jak można zareagować na event w kilku miejscach


func _ready():
	GlobalEvents.OnScoreBubbleDelete.connect(func():
		points += 1
		print("Score: ", points))


func _physics_process(delta):
	if player_is_killed:
		return
		
	var direction : Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	# Poruszanie postacią gracza
	move(direction)
	play_animation(direction)


func move(direction : Vector2) -> void:
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO
	move_and_slide()
	collide()
			

func collide():
	var collision_count = get_slide_collision_count()
	for i : int in collision_count:
		var collision : KinematicCollision2D = get_slide_collision(i)
		var collider = collision.get_collider()
		# TODO: Tutaj czasem collider jest null a liczba kolizji wynosi 2. 
		# Wygląda tak jakby problem był przy zderzeniu z dwoma obiektami jednocześnie.
		# Sprawa rozwiązana. Używałem, metody 'free()' co powodowało że obiekt był usuwany natychmiast.
		# Zamiast tego należy użyć metody 'queue_free()' co spowoduje że obiekt będzie uwuwany na
		# końcu aktualnej ramki. Dlatego będą możliwe dalsze odwołania do obiektu w trakcie tej ramki.
		# TODO: poniży if do zaremowania po dokładnym sprawdzeniu
		if collider == null:
			print("Collider jest null, ale liczba kolizji wynosi: ", collision_count)
			print("Colision ERROR id: ", collision.get_instance_id())
		if collider is Bubble:
			collider.queue_free() # usuwa obiekt na koniec ramki
			#collider.free() # usuwa obiekt natychmiast
		elif collider is BubbleKiller:
			death()
			

func death():
	print("Killing player")
	player_is_killed = true
	hit.emit()
	get_tree().call_group("Bubbles", "queue_free")
	await get_tree().create_timer(1.5).timeout
	#get_tree().paused = true
	hide()
	print("after pause")
	#queue_free() -> tu raczej trzeba dać hide() lub zostawić animację na leżącym graczu
	#get_tree().reload_current_scene() -> to trzeba przenieść na przycisk START na HUD
	#emisja hit i łapanie w HUD i wyświetlenie ekranu z napisem end of the game	

func play_animation(direction : Vector2):
	if direction and !player_is_killed:
		if direction[0] > 0:
			necromancer.flip_h = false
		elif direction.x < 0:
			necromancer.flip_h = true
		necromancer.play("run")
	elif player_is_killed:
		necromancer.play("death")
	else:
		necromancer.play("idle")
