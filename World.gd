extends Node

var scene_snow = preload("res://vfx/Particles.tscn")

var snow_parts = []
var levels = []

func _ready():
	load_worlds()
	for x in range(8):
		for y in range(-1,2):
			var snow = scene_snow.instance()
			snow.translation = Vector3(16+x*32,20,y*32)
			print(snow.translation)
			snow_parts.append(snow)
			add_child(snow)

func spawn_level():
	randomize()
	var rand_idx = rand_range(0,levels.size())
	var part = levels[rand_idx].instance()
	part.position = Vector2(1024,0)
	add_child(part)
	print("Level spawned")

func _process(delta):
	snow_update()

func snow_update():
	for part in snow_parts:
		if (part.translation - get_node("VehicleBody").translation).length() < 80:
			part.visible = true
		else:
			part.visible = false

func load_worlds():
	var dir = Directory.new()
	if dir.open("res://Levels/") == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while (file_name != ""):
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				print("Found file: " + file_name)
				levels.append(load("res://Levels/" + file_name))
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
