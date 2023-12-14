extends Node2D

var ball_scene = preload("res://Scenes/ball.tscn")


var ball

var ball_in_tree: bool = false

@onready var opponent = $Opponent


func spawn_new_ball():
	var starting_pos = randi_range(100,620)
	ball = ball_scene.instantiate()
	add_child(ball)
	ball.global_position = Vector2(640, starting_pos)
	ball_in_tree = true
	
func _ready():
	await get_tree().create_timer(2).timeout
	spawn_new_ball()
	
	$Player.connect("side_bounce", _on_player_side_bounce)
	$Player.connect("top_bounce", _on_player_top_bounce)
	
	$Opponent.connect("side_bounce", _on_opponent_side_bounce)
	$Opponent.connect("top_bounce", _on_opponent_top_bounce)
	
func _process(_delta):
	
	
	if ball_in_tree && ball.global_position.x > 640 && ball.linear_velocity.x > 0:
		if ball.global_position.y > opponent.global_position.y:
			opponent.velocity.y = 300
		elif ball.global_position.y <= opponent.global_position.y:
			opponent.velocity.y = -300
	elif ball_in_tree && ball.linear_velocity.x < 0:
		opponent.velocity.y = 0
	#elif ball_in_tree && (ball.global_position.x <= (1280/2)):
		#if opponent.global_position.y == 720/2:
			#opponent.velocity.y = 0
		#elif opponent.global_position.y > 720/2:
			#opponent.velocity.y = -300
		#elif opponent.global_position.y < 720/2:
			#opponent.velocity.y = 300
			
func _on_player_side_bounce(body):
	body.direction.x = -body.direction.x
	ball.speed += 50
	
func _on_player_top_bounce(body):
	body.direction.y = -body.direction.y

func _on_opponent_side_bounce(body):
	body.direction.x = -body.direction.x
	ball.speed += 50

func _on_opponent_top_bounce(body):
	body.direction.y = -body.direction.y

func _on_player_goal_body_entered(body):
	Ui.opponent_score += 1
	body.queue_free()
	ball_in_tree = false
	call_deferred("spawn_new_ball")

func _on_opponent_goal_body_entered(body):
	Ui.player_score += 1
	body.queue_free()
	ball_in_tree = false
	call_deferred("spawn_new_ball")

func _on_bottom_body_entered(body):
	body.direction.y = -body.direction.y

func _on_top_body_entered(body):
	body.direction.y = -body.direction.y
