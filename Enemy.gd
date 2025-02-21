extends Area2D

export var speed = 500
export var moveDist = 500

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
	
func _physics_processs(delta):
	position.x = move_to(position.x, targetX, speed * delta)
	
	if position.x == targetX:
		if targetX == startX:
			targetX = position.x + moveDist
		else:
			targetX = startX

func _on_Enemy_body_entered(body):
	if body.name == "Player":
		body.die()
