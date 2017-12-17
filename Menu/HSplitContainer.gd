extends Control

var selected_level = null
var selected_idx = 0

func _ready():
	update()

func update_stats(time):
	if selected_level.time.is_valid_float(): 
		if float(time) > float(selected_level.time):
			selected_level.time = time
	else: selected_level.time = time

func update():
	selected_level = get_child(selected_idx)
	for i in range(get_child_count()):
		get_child(i).update()
		if selected_idx == i: get_child(i).show() 
		else:                 get_child(i).hide()

func _on_Next_pressed():
	selected_idx += 1
	if selected_idx >= get_child_count(): selected_idx = 0
	update()
