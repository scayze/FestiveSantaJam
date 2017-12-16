extends RigidBody

var hit = false
onready var anim = get_node("AnimationPlayer")
onready var vel = linear_velocity
onready var ang = angular_velocity

func _ready():
	pass

func spawn():
	visible = true
	mode = RigidBody.MODE_RIGID
	angular_velocity = ang
	linear_velocity = vel
	anim.play("Spawn")

func _on_Snowball_body_entered( body ):
	if body.is_in_group("player"):
		collision_layer = 0
		hit = true
		anim.play("Break")