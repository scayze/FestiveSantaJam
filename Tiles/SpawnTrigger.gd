extends Area

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	for child in get_children():
		if child.has_method("vanish"): child.vanish()
	pass

func _on_Area_body_entered( body ):
	if not body.is_in_group("player"): return
	for child in get_children():
		if child.has_method("spawn"): child.spawn()
