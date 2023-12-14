extends RigidBody2D

var speed: int = 300
var direction: Vector2 = Vector2(-(randf_range(0.25,1)), (randf_range(0.5,1.5))).normalized()
var rand_x_dir = randi_range(0,1)
var rand_y_dir = randi_range(0,1)

func _ready():
	if rand_x_dir == 1:
		direction.x = -direction.x
	if rand_y_dir == 1:
		direction.y = -direction.y

func _process(delta):
	linear_velocity = speed * direction * delta
	
	move_and_collide(linear_velocity)
	

