extends Control

export(String,FILE) var level = "res://Levels/002.tscn"

var time = "Not Finished"
onready var l_time = get_node("Time")

func _ready():
	update()
	pass

func update():
	l_time.text = "Time: " + time