extends Area

export var duration = 3

func _ready():
	pass


func _on_NoSteer_body_entered( body ):
	if body.is_in_group("player"):
		body.power_up("steer",duration,0)
		queue_free()
