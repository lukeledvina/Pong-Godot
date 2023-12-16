extends CanvasLayer


@onready var player_score_label = $Control/PlayerScoreMargin/VBoxContainer/HBoxContainer/PlayerScore
@onready var opponent_score_label = $Control/OpponentScoreMargin/VBoxContainer/HBoxContainer/OpponentScore

@onready var player_game_count_container = $Control/Player1GameCount
@onready var opponent_game_count_container = $Control/Player2GameCount

signal game_finished()

var winning_score: int = 1
var game_count_to_win: int = 2

var player_1_win_count: int = 0
var player_2_win_count: int = 0


var player_score: int:
	set(new_score):
		player_score = new_score
		if new_score == winning_score:
			player_1_win_count += 1
		call_deferred("update_score_label", player_score_label, player_score, player_game_count_container, player_1_win_count)

var opponent_score: int:
	set(new_score):
		opponent_score = new_score
		if new_score == winning_score:
			player_2_win_count += 1
		call_deferred("update_score_label", opponent_score_label, opponent_score, opponent_game_count_container, player_2_win_count)

			

func update_score_label(score_label, score, container, win_count):
	score_label.text = str(score)
	
	var game_count_images = container.get_children()
	
	if score == winning_score:
		if win_count == 1:
			game_count_images[0].show()
			emit_signal("game_finished")
			await get_tree().create_timer(1.5).timeout
			player_score = 0
			opponent_score = 0
		elif win_count == game_count_to_win:
			game_count_images[1].show()
			game_count_images[2].show()
			emit_signal("game_finished")
			await get_tree().create_timer(2).timeout
			get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

		
