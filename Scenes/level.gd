extends Node2D
class_name Level

var ball_scene = preload("res://Scenes/ball.tscn")

@onready var Ui = $UI

var ball

var game_active: bool = true

var ball_in_tree: bool = false

@onready var opponent = $Opponent


func spawn_new_ball():
	if game_active:		
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
	
	opponent.connect("side_bounce", _on_opponent_side_bounce)
	opponent.connect("top_bounce", _on_opponent_top_bounce)
	


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
	await get_tree().create_timer(2.05).timeout
	call_deferred("spawn_new_ball")

func _on_opponent_goal_body_entered(body):
	Ui.player_score += 1
	body.queue_free()
	ball_in_tree = false
	await get_tree().create_timer(2.05).timeout
	call_deferred("spawn_new_ball")

func _on_bottom_body_entered(body):
	body.direction.y = -body.direction.y

func _on_top_body_entered(body):
	body.direction.y = -body.direction.y


func _on_ui_game_finished():
	game_active = false
	await get_tree().create_timer(2).timeout
	game_active = true
