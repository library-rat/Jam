extends Button


@onready var open_door = preload("res://Door_open.png")
@onready var close_door = preload("res://Door_close.png")
var cell1 : Vector2i
var cell2 : Vector2i
var main : Main
@export var open :bool 

func init(new_main : Main):
	main = new_main
	cell1 = main.pos_to_grid($Side1.get_global_position())
	cell2 = main.pos_to_grid($Side2.get_global_position())
	print(cell1)
	print(cell2)
	

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
