extends Node2D

export(NodePath) var player
export(NodePath) var UI
export(NodePath) var spawner

func _ready():
	get_node(player).connect("ammo_change", get_node(UI), "on_ammo_change")
	get_node(spawner).connect("enemy_death", get_node(UI), "on_enemy_death")
