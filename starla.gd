extends Area2D

export var speed = 200
export var moveDist = 400

onready var startX = position.x
onready var targetX = position.x + moveDist

func move_to(current, to, step):
	var new = current
	if new < to:
		new += step
		
		if new > to:
			new = to
	else:
		new -= step
			
		if new < to:
			new = to
	return new
	
func _physics_process(delta):
	position.x = move_to(position.x, targetX, speed * delta)

	if position.x == targetX:
		if targetX == startX:
			targetX = position.x + moveDist
		else:
			targetX = startX


func _on_starla_body_entered(body):
	if body.name == "Player":
		body.die()



func _on_starla3_body_entered(body):
	if body.name == "Player":
		body.die()


func _on_starla2_body_entered(body):
	if body.name == "Player":
		body.die()
