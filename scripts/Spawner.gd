extends Node2D

const enemy_prefab = preload("res://scenes/Enemy.tscn")

var wave : int = 1
var enemies_to_spawn : int = 10
var enemies_left : int = 10
var time_per_enemy : int = 3

signal enemy_death(enemies)

func _ready():
	$Timer.start(time_per_enemy)

func _on_Timer_timeout():
	if enemies_to_spawn < 1: return
	enemies_to_spawn -= 1
	var enemy = enemy_prefab.instance()
	enemy.position = Vector2(randi() % 640-48 + 48, -50)
	enemy.connect("death", self, "on_enemy_death")
	add_child(enemy)
	$Timer.start(time_per_enemy)

func on_enemy_death():
	enemies_left -= 1
	emit_signal("enemy_death", enemies_left)
