extends Camera2D

onready var target = get_node("/root/MainScene/Player")

func _process(delta):
	position.x = player.position.x
