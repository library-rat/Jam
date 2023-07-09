extends Node2D
class_name Main

var cell_dico = {} 
@onready var map = $TileMap 
@onready var manager = $SpacionauteManager
var doors_dico = {}
func _ready():
	var temp = map.get_used_cells(0);
	for cell in temp :
		cell_dico[cell] = 1
	randomize()
	var spawners = get_tree().get_nodes_in_group("Spawner")
	for spwn in spawners :
		spwn.init(self,manager)
	var doors = get_tree().get_nodes_in_group("Door")
	for do in doors :
		do.init(self)
		doors_dico[do.cell] = do
	print(doors.size())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(pos_to_grid(get_viewport().get_mouse_position()))
	pass
	

func pos_to_grid(glob_pos: Vector2):
	return map.local_to_map(map.to_local(glob_pos))
	
func grid_to_pos(grid_pos : Vector2i):
	return map.to_global( map.map_to_local(grid_pos))

func choices_intersection ( grid_pos:Vector2i ) :
	var retval = []
	var direction = [Vector2i.UP, Vector2i.DOWN, Vector2i.LEFT, Vector2i.RIGHT]
	for dir in direction :
		if cell_dico.has(grid_pos + dir):
			if not(doors_dico.has(grid_pos + dir)) || doors_dico[grid_pos + dir].open :
				retval.append(dir)
				print(doors_dico.has(grid_pos + dir))
	
	return retval


func _on_area_2d_body_entered(body):
	$ColorRect.visible = true
