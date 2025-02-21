extends KinematicBody2D

var score = 0

var speed = 200
var jumpForce = 600
var gravity = 15

var vel = Vector2()
var facingDir = Vector2()
var grounded = false

var portal_id = 0

onready var sprite = $AnimatedSprite
onready var anim = $AnimatedSprite
onready var raycast = $RayCast2D
onready var ui = get_node("/root/MainScene/CanvasLayer/UI")

func _physics_process(delta):
	vel.x = 0
	
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
		anim.play("walk")
		anim.flip_h = false
		
	elif Input.is_action_pressed("move_right"):
		vel.x += speed
		anim.play("walk")
		anim.flip_h = true
	else:
		anim.play("idle")
		
	if not is_on_floor():
		anim.play("jump")
		
	vel = move_and_slide(vel,Vector2.UP)
	
	vel.y += gravity + delta
	
	if Input.is_action_just_pressed("jump")  and is_on_floor():
		vel.y -= jumpForce
		
	#calculate the gravity
	#var distance = position.distance_to(gravity_center.position)
	


func die():
	get_tree().reload_current_scene()
	
func collect_coin(value):
	score += value
	ui.set_score_text(score)




func _on_Area2D_area_entered(area):
	if (area.is_in_group("hurt_player")):
		Camera2D.start_shake(1,0.02,3)
		Camera2D.start_flash(0.24,0.5)
	if(area.is_in_group("Portal")):
		if(!area.lockPortal):
			do_teleport(area)
			
func do_teleport(area):
	for portal in get_tree().get_nodes_in_group("Portal"):
		if(portal.id == area.id):
			if(!portal.lockPortal):
				area.do_lock()
				global_position = portal.global_position
