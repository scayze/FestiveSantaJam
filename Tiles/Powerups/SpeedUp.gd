extends Area

export var speed_up = 10

func _ready():
	pass

func _process(delta):
	pass


func _on_SpeedUp_body_entered( body ):
	if body.is_in_group("player"):
		body.power_up("speed",0,speed_up)
		queue_free()
