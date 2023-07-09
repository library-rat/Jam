extends Sprite2D

@export var direction : Vector2i
var dead = false
var cooldown = 0.5
var count = 0
@export var cell : Vector2i
@export var mainscene : Main

func _process(delta):
	if dead :
		return
	count += delta
	if count >cooldown :
		count -= cooldown
		move()

func init(init_cell : Vector2i, init_main : Main):
	cell = init_cell
	mainscene = init_main
	
func update_cell(new_cell :Vector2i):
	direction = new_cell - cell
	cell = new_cell;
	position = mainscene.grid_to_pos(new_cell)


func move():
	var choice = mainscene.choices_intersection(cell)
	if choice.size() == 1 :
		update_cell(cell + choice[0])
	else :
		var new_direction = -direction
		while (new_direction == -direction):
			var index = randi() % choice.size()
			new_direction = choice[index]
		update_cell(cell + new_direction)
