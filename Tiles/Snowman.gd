extends Area

onready var mesh_instance = get_node("Mesh")
var hit = false
onready var anim = get_node("AnimationPlayer")

func _ready():
	randomize()
	var r = int(rand_range(0,3))
	if r==0: mesh_instance.mesh = load("res://Mesh/snowman01.tres")
	elif r==1: mesh_instance.mesh = load("res://Mesh/snowman02.tres")
	elif r==2: mesh_instance.mesh = load("res://Mesh/snowman03.tres")

func spawn():
	visible = true


func _on_Snowman_body_entered( body ):
	if hit: return
	if body.is_in_group("player"):
		hit = true
		if body.has_method("set_linear_velocity"): body.set_linear_velocity(body.get_linear_velocity()/1.25)
		anim.play("Break")
