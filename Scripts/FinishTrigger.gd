extends Area

func _on_Area_body_entered( body ):
	if body.is_in_group("player"): get_tree().get_root().get_node("World").finish()
