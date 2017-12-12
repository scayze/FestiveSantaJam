extends Area

export var speed_up = 10
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	pass


func _on_SpeedUp_body_entered( body ):
	if body.is_in_group("player"):
		body.power_up("speed",0,speed_up)
		queue_free()
