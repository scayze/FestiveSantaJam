extends Control

export var name = "Name"
export(String,FILE) var level = "res://Levels/002.tscn"

var time = "Not Finished"
onready var l_time = get_node("Time")
onready var l_name = get_node("Name")

func _ready():
	update()
	pass

func update():
	l_time.text = "Record Time: " + time
	l_name.text = name