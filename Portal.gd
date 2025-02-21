extends Area2D


export(int) var id = 0

var lockPortal = false

func do_lockl():
	lockPortal = true
	yield(get_tree().create_timer(0.3), "timeout")
	lockPortal = false
	
