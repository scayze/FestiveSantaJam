extends VehicleBody

export var inverse_acceleration = 20.0
export var force = 20.0
export var STEER_LIMIT = -0.35
export var STEER_SPEED = 1.0
export var SPEED_LIMIT = 35

var steer_angle = 0.0
var steer_target = 0.0

func _ready():
	engine_force = 50
	friction = 0.1
	pass

func _physics_process(delta):
	friction += delta
	clamp(friction,0,1)
	
	#Keep the player from falling over when turning at too high speeds
	STEER_LIMIT = -0.35 + (get_linear_velocity().length()/100.0)
	#Dont let the steering inverse when too fast =p
	STEER_LIMIT = clamp(STEER_LIMIT,-0.35,-0.06)
	
	if Input.is_key_pressed(KEY_W): engine_force = force
	else:                           engine_force = 0.0
	if get_linear_velocity().length() > SPEED_LIMIT: engine_force = 0.0
	
	if Input.is_key_pressed(KEY_S): brake = 1.0
	else:                           brake = 0.0
	
	if Input.is_key_pressed(KEY_A):   steer_target = -STEER_LIMIT
	elif Input.is_key_pressed(KEY_D): steer_target = STEER_LIMIT
	else:                             steer_target = 0.0
	
	
	if (steer_target < steer_angle):
		steer_angle -= STEER_SPEED*delta
		if (steer_target > steer_angle):
			steer_angle = steer_target
	elif (steer_target > steer_angle):
		steer_angle += STEER_SPEED*delta
		if (steer_target < steer_angle):
			steer_angle = steer_target
	
	steering = steer_angle
