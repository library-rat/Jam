extends Node2D


var cell_dico = {} ;

func _ready():
	var temp = $TileMap.get_used_cells(0);
	for cell in temp :
		cell_dico[cell] = 1;
	print(cell_dico);
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
