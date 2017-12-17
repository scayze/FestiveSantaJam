extends RigidBody

onready var anim = get_node("AnimationPlayer")
onready var shape = get_node("CollisionShape")
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

func _on_col( body ):
	if body.is_in_group("player"):
		print("lol")
		if body.has_method("set_linear_velocity"):
			if body.get_linear_velocity().length() > 13:
				shape.disabled = true
				anim.play("Break")
