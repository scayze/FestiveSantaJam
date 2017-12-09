extends Node

var scene_snow = preload("res://vfx/Particles.tscn")
var vehicle

var current_level
var snow_parts = []
var levels = []

enum game_states {
	MENU
	PLAY
}

var state = MENU

func _ready():
	load_levels()
	spawn_snow()


func spawn_level(path):
	var l = load(path).instance()
	vehicle = l.find_node("Vehicle")
	add_child(l)
	print("Level spawned")

func _process(delta):
	if state == MENU: menu_update()
	elif state == PLAY:
		play_update()
		snow_update()

func play(path):
	state = PLAY
	spawn_level(path)

func menu_update():
#	if Input.is_action_just_pressed("ui_left"):
#		for level in level_instances:
#			level.translation.z -= 32
#	if Input.is_action_just_pressed("ui_right"):
#		for level in level_instances:
#			level.translation.z += 32
	pass


func play_update():
	pass

func spawn_snow():
	for x in range(8):
		for y in range(-1,2):
			var snow = scene_snow.instance()
			snow.translation = Vector3(16+x*32,20,y*32)
			print(snow.translation)
			snow_parts.append(snow)
			add_child(snow)

func snow_update():
	for part in snow_parts:
		if (part.translation - vehicle.translation).length() < 80:
			part.visible = true
		else:
			part.visible = false

func load_levels():
	var dir = Directory.new()
	if dir.open("res://Levels/") == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while (file_name != ""):
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				print("Found file: " + file_name)
				levels.append("res://Levels/" + file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
