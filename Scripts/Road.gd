extends MeshInstance
tool

var old_scale = Vector3(0,0,0)
onready var static_body = get_node("StaticBody")
onready var collision_shape = get_node("StaticBody/CollisionShape")

func _ready():
	pass#update_mat()

func update_mat():
	if not Engine.is_editor_hint():
		print("lil")
	collision_shape.shape = BoxShape.new()
	collision_shape.shape.extents = Vector3(4,0.5,4) * scale
	collision_shape.shape.extents.y = 0.5
	var mat = SpatialMaterial.new()
	mat.albedo_texture = load("res://Data/Textures/groundtexture.png")
	mat.uv1_offset = Vector3(0.5,0.5,0.5)
	mat.uv1_scale = Vector3(0.125,0.125,0.125 * scale.z)
	mat.uv1_triplanar = true
	mat.roughness = 1
	mat.flags_unshaded =true
	material_override = mat
	pass

func _process(delta):
	if scale != old_scale:
		old_scale = scale
		update_mat()