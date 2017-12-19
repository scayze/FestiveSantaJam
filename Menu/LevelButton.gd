extends Control

export var name = "Name"
export var max_presents = 1
export(String,FILE) var level = "res://Levels/002.tscn"

var time = INF
onready var l_time = get_node("Time")
onready var l_name = get_node("Name")

func _ready():
	update()
	pass

func update():
	if time == INF: l_time.text = "Not finished"
	else:          l_time.text = "Record Time: " + str(time).pad_decimals(2)
	l_name.text = name