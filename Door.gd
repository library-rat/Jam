extends Button


@onready var open_door = preload("res://Door_open.png")
@onready var close_door = preload("res://Door_close.png")
var cell : Vector2i
var main : Main
@export var open :bool = true 

func init(new_main : Main):
	main = new_main
	cell = main.pos_to_grid($Position.get_global_position())
	main.connect("stopall", opening)
	

func opening():
	main.open_door(self)
	open = true;
	self.icon = open_door
	
func closing():
	main.check_open_door()
	main.close_door(self)
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
