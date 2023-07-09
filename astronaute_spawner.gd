extends Node2D

@onready var instanceAstro = preload("res://Astronaut.tscn")
@export var AstroCooldown : float = 5
var count = 0
var cell :Vector2i
var main : Main
var manager : Node2D
# Called when the node enters the scene tree for the first time.
func init(newm : Main, newmana :Node2D):
	main = newm
	cell = main.pos_to_grid(main.to_local(position))
	manager = newmana
	#print(main.pos_to_grid(position))
	#print(main.choices_intersection(Vector2i(54,21)))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	count += delta
	if count > AstroCooldown :
		count -= AstroCooldown
		var new_astro = instanceAstro.instantiate()
		new_astro.init(Vector2i(cell),main)
		manager.add_child(new_astro)
