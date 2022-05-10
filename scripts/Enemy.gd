extends Area2D

export(float) var speed = 50

signal death

func _process(delta):
	position.y += speed * delta

func _on_Enemy_area_entered(area):
	queue_free()
	emit_signal("death")
