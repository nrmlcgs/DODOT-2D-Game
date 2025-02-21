extends Node2D

onready var map = preload("res://Minimap.tscn")
var mm

func _ready():
	set_mm()
	
func set_mm():
	mm=map.instance()
	$MainScene/Camera2D2.add_child(mm)
	mm.rect_position = Vector2(180,-250)
