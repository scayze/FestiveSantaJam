extends Area

var hit = false

func _ready():
	for child in get_children():
		child.visible = false
	pass

func _on_Area_body_entered( body ):
	if not body.is_in_group("player"): return
	if hit: return
	hit = true
	for child in get_children():
		child.visible = true
		if child.has_method("spawn"): child.spawn()
