extends Control

onready var healthbar : ProgressBar = $stats/healthbar
onready var ammo_left : Label = $stats/ammo_left
onready var enemies_left: Label = $stats/enemies_left

func on_health_change(max_health: float, health: float):
	var health_percentage = health * 100 / max_health
	healthbar.value = health_percentage

func on_ammo_change(ammo: int):
	ammo_left.text = "AMMO: " + str(ammo)

func on_game_over():
	pass

func on_enemy_death(enemies: int):
	enemies_left.text = "ENEMIES LEFT: " + str(enemies)
