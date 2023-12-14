extends CharacterBody2D

const SPEED: int = 200

signal side_bounce(body)
signal top_bounce(body)

func _process(_delta):
	
	position.x = 64
	
	if Input.is_action_pressed("up"):
		velocity.y = -SPEED
	elif Input.is_action_pressed("down"):
		velocity.y = SPEED
	else:
		velocity = Vector2.ZERO
		
	move_and_slide()



func _on_bounce_zone_body_entered(body):
	emit_signal("side_bounce", body)


func _on_top_bounce_body_entered(body):
	emit_signal("top_bounce", body)
