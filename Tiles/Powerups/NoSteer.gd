extends Area

export var duration = 3
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	pass

func _on_NoSteer_body_entered( body ):
	if body.is_in_group("player"):
		body.power_up("steer",duration,0)
		queue_free()