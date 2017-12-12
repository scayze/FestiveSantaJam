extends Area

export var duration = 5
var hit = false
var player

func _ready():
	pass

func _process(delta):
	if hit: duration -= delta
	if duration <= 0:
		player.collision_mask += 2
		print("lel")
		queue_free()


func _on_Ghost_body_entered( body ):
	if body.is_in_group("player"):
		hit = true
		player = body
		player.collision_mask -= 2
