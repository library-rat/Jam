extends Button


@onready var open_door = preload("res://Door_open.png")
@onready var close_door = preload("res://Door_close.png")
var cell : Vector2i
var main : Main
@export var open :bool 

func init(new_main : Main):
	main = new_main
	cell = main.pos_to_grid($Position.get_global_position())
	

func opening():
	open = true;
	self.icon = open_door
	
func closing():
	open = false
	self.icon = close_door

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_down():
	if open :
		closing()
	else :
		opening()
