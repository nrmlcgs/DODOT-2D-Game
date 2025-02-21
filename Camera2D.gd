extends Camera2D


export var target : Node2D
export var smooth_speed : float = 10

func _process(delta):
	if target:
		var new_pos = position.linear_inerpolate(target.position, smooth_speed * delta)
		position = new_pos
