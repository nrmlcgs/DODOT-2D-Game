extends Area2D


export var value = 1

func _process(delta):
	rotation_degrees += 5 + delta
	
func _on_Battery_body_entered(body):
	if body.name == "Player":
		body.collect_coin(value)
		queue_free()

