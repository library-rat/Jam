extends Node2D
class_name Main

var cell_dico = {} 
@onready var map = $TileMap 
@onready var manager = $SpacionauteManager
var doors_dico = {}

var count_door = 4
var array_door = []

var spawner_array = []

var count_death = 0

var waveNum = 10

var waveCount = 15
var waveCooldown = 16
signal stopall()
signal startall()

func _ready():
	var temp = map.get_used_cells(0);
	for cell in temp :
		cell_dico[cell] = 1
	randomize()
	var spawners = get_tree().get_nodes_in_group("Spawner")
	for spwn in spawners :
		spwn.init(self,manager)
		spawner_array.append(spwn)
	var doors = get_tree().get_nodes_in_group("Door")
	for do in doors :
		do.init(self)
		doors_dico[do.cell] = do


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	waveCount += delta
	if  waveCount > waveCooldown :
		waveCount -= waveCooldown
		for i in range(waveNum) :
			var index = randi()% spawner_array.size()
			spawner_array[index].spawn()
		waveNum += 1
	#print(pos_to_grid(get_viewport().get_mouse_position()))


func check_open_door() :
	if count_door == 0 :
		array_door[0].opening()


func open_door(door):
	array_door.erase(door)
	count_door += 1
	
func close_door(door):
	count_door -= 1
	array_door.append(door)
	
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
	
	return retval

func on_death():
	count_death += 1
	$Label.text = str(count_death)

func _on_area_2d_body_entered(body):
	$GameOver.visible = true
	emit_signal("stopall")
	array_door = []
	count_door = 4


func _on_button_pressed():
	emit_signal("startall")
	$GameOver.visible = false
	waveNum = 1
	count_death = 0
	waveCount = 15
	$Label.text = str(count_death)
