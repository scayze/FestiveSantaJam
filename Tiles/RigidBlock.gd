extends RigidBody

var timer = 0.0
var hit = false

onready var mesh = get_node("MeshInstance")
onready var shape = get_node("CollisionShape")

func _ready():
	mesh.scale = scale
	mesh.material_override = mesh.material_override.duplicate()#scale

func _process(delta):
	if hit: timer += delta
	mesh.material_override.albedo_color = Color(1,1,1,1.0-timer)
	if mesh.material_override.albedo_color.a < 0.0: queue_free()


func on_collision( body ):
	if body.is_in_group("player"):
		mesh.material_override.albedo_color = Color(0,1,1,clamp(1.0-timer/2.0,0,1))
		collision_layer = 0
		hit = true
