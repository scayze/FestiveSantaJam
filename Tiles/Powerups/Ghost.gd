extends Area

export var duration = 5
var hit = false
var player

func _ready():
	pass

func _process(delta):
	if hit: duration -= delta
	if duration <= 0:
		#player.collision_mask += 2
		player.set_collision_mask_bit(1,true)
		player.get_node("MeshInstance").material_override.flags_transparent = false
		player.get_node("MeshInstance").material_override.albedo_color = Color(1,1,1,1)
		queue_free()


func _on_Ghost_body_entered( body ):
	if body.is_in_group("player"):
		hit = true
		player = body
		player.set_collision_mask_bit(1,false)
		print(player.get_node("MeshInstance"))
		player.get_node("MeshInstance").material_override.flags_transparent = true
		player.get_node("MeshInstance").material_override.albedo_color = Color(1,1,1,0.5)
		#player.collision_mask -= 2
