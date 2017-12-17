extends RigidBody
tool

onready var mesh_instance = get_node("Mesh")
onready var shape = get_node("CollisionShape")
export(Mesh) var mesh setget set_mesh

func set_mesh(m):
	mesh = m
	if not mesh_instance: return
	mesh_instance.mesh = mesh
	shape.shape = mesh.create_convex_shape()

func _ready():
	set_mesh(mesh)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
