extends Area2D


export var speed = 200
export var moveDist = 400

onready var startY = position.y
onready var targetY = position.y + moveDist

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
	position.y = move_to(position.y, targetY, speed * delta)

	if position.y == targetY:
		if targetY == startY:
			targetY = position.y + moveDist
		else:
			targetY = startY

func _on_Enemy1_body_entered(body):
	if body.name == "Player":
		body.die()
