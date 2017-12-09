extends Control

onready var select_frame = get_parent().get_node("TextureButton")
var selected_level = null

func _ready():
	#dragger_visibility = DRAGGER_VISIBLE
	pass

func select_level(level):
	selected_level = level
	select_frame.rect_position = level.rect_position
	pass
