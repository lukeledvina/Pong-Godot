extends Level

func _process(_delta):
	if ball_in_tree && ball.global_position.x > 640 && ball.linear_velocity.x > 0:
		if ball.global_position.y > opponent.global_position.y:
			opponent.velocity.y = 200
		elif ball.global_position.y <= opponent.global_position.y:
			opponent.velocity.y = -200
	elif ball_in_tree && ball.linear_velocity.x < 0:
		opponent.velocity.y = 0
