extends Node2D

@onready var instanceAstro = preload("res://Astronaut.tscn")
@onready var AstroCooldown = 0
var count = 0;
var cell :Vector2i
var main : Main
var manager : Node2D
var queue = []
var off = false

# Called when the node enters the scene tree for the first time.
func init(newm : Main, newmana :Node2D):
	main = newm
	cell = main.pos_to_grid(main.to_local(position))
	manager = newmana
	main.connect("startall",turn_on)
	main.connect("stopall",turn_off)
	#print(main.pos_to_grid(position))
	#print(main.choices_intersection(Vector2i(54,21)))

func turn_on():
	off = false

func turn_off():
	off = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if off :
		return
	if not(queue.is_empty()) :
		count -= delta
		if count < 0 :
			var next = queue.pop_front()
			manager.add_child(next)
			count += AstroCooldown
	else :
		count = 0
#	count += delta
#	if count > AstroCooldown :
#		count -= AstroCooldown
#		manager.add_child(new_astro)
		
func spawn():
	var new_astro = instanceAstro.instantiate()
	AstroCooldown =new_astro.cooldown *2
	new_astro.init(Vector2i(cell),main)
	queue.append(new_astro)
