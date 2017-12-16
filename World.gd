extends Node

var scene_snow = preload("res://vfx/Particles.tscn")
onready var main_menu = get_node("Menu")
onready var finish_menu = get_node("FinishMenu")
onready var pause_menu = get_node("PauseMenu")
onready var timer = get_node("Timer")
onready var camera = get_node("Camera")

var vehicle
var current_level
var current_path
var snow_parts = []
var levels = []

enum game_states {
	MENU
	PLAY
	POST_PLAY
}

var state = MENU

func _ready():
	load_levels()
	spawn_snow()

func restart():
	play(current_path)
	print("Level restarted")
	
func spawn_level(path):
	var l = load(path).instance()
	if current_level: current_level.free()
	current_level = l
	current_path = path
	vehicle = l.find_node("Vehicle")
	add_child(l)
	print("Level spawned")

func _process(delta):
	if state == MENU: pass#menu_update(delta)
	elif state == PLAY: play_update(delta)


func play_update(delta):
	camera.translation = vehicle.translation - Vector3(8,-9,0)
	camera.translation.z = vehicle.translation.z
	snow_update()
	
	if Input.is_action_just_pressed("restart"): restart()
	if Input.is_action_just_pressed("pause"):
		pause_menu.visible = not pause_menu.visible
		get_tree().set_pause(not get_tree().is_paused())
		print(get_tree().is_paused())

func play(path):
	state = PLAY
	finish_menu.hide()
	timer.time_passed = 0.0
	timer.show()
	spawn_level(path)

func finish():
	state = POST_PLAY
	finish_menu.show()
	timer.hide()

func back():
	state = MENU
	timer.hide()
	if current_level:
		current_level.queue_free()
		current_level = null
	finish_menu.hide()
	main_menu.reset()

func spawn_snow():
	for x in range(8):
		var snow = scene_snow.instance()
		snow.translation = Vector3(16+x*32,30,0)
		snow_parts.append(snow)
		add_child(snow)

func snow_update():
	for part in snow_parts:
		if (part.translation - vehicle.translation).length() < 120:
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
