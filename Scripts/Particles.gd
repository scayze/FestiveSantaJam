extends Particles

var player

func _ready():
	player = get_tree().get_root().get_node("World").vehicle

func _process(delta):
	visible = (translation-player.translation).length() < 120