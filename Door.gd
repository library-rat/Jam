extends Area2D


@onready var open_door = preload("res://Door_open.png")
@onready var close_door = preload("res://Door_close.png")
var cell1 : Vector2i
var cell2 : Vector2i
var main : Main

func init(new_main : Main):
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
