extends Area2D

const speed = 350

func _process(delta):
	if position.y < -48: 
		queue_free()

	position.y += -speed * delta


func _on_Bullet_area_entered(area):
	queue_free()
