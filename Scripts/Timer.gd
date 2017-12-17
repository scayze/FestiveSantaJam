extends Label

var time_passed = 0.0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	time_passed+=delta
	text = str(time_passed).pad_decimals(2)
