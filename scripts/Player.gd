extends KinematicBody2D

const bullet_prefab = preload("res://scenes/Bullet.tscn")

const speed = 250

var velocity := Vector2.ZERO
var ammo : int = 15

var max_health: float = 100.0
var current_health: float = 80.0

signal game_over
signal ammo_change(ammo)
signal health_change(max_health, current_health)

func _process(delta: float) -> void:
	input_process()
	if Input.is_action_just_pressed("ui_accept"):
		attack()

	move_and_slide(velocity, Vector2.UP)

func attack() -> void:
	if(ammo <= 0): return
	
	ammo -= 1;
	
	var bullet = bullet_prefab.instance()
	bullet.position = position
	get_parent().add_child(bullet)
	
	emit_signal("ammo_change", ammo)

func take_damage(amount: float) -> void:
	if(amount <= 0): return;
	
	current_health -= amount
	
	emit_signal("health_change", max_health, current_health)
	
	if(current_health <= 0):
		current_health = 0
		emit_signal("game_over")

func input_process() -> void:
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		velocity.x += -speed;
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed;
