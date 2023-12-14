extends CanvasLayer


@onready var player_score_label = $Control/PlayerScoreMargin/VBoxContainer/HBoxContainer/PlayerScore
@onready var opponent_score_label = $Control/OpponentScoreMargin/VBoxContainer/HBoxContainer/OpponentScore


var player_score: int:
	set(new_score):
		player_score = new_score
		update_score_label(player_score_label, player_score)

var opponent_score: int:
	set(new_score):
		opponent_score = new_score
		update_score_label(opponent_score_label, opponent_score)

func update_score_label(score_label, score):
	score_label.text = str(score)
