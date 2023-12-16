extends Level

func _process(_delta):
	if Input.is_action_pressed("p2_up"):
		opponent.velocity.y = -200
	elif Input.is_action_pressed("p2_down"):
		opponent.velocity.y = 200
	else:
		opponent.velocity.y = 0
