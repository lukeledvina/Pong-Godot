extends CharacterBody2D

signal top_bounce(body)
signal side_bounce(body)

func _on_side_bounce_area_body_entered(body):
	emit_signal("side_bounce", body)


func _on_top_bounce_area_body_entered(body):
	emit_signal("top_bounce", body)

func _process(_delta):
	
	position.x = 1280 - 64
	
	move_and_slide()
