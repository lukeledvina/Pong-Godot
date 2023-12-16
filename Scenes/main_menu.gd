extends Control

var level_ai: PackedScene = preload("res://Scenes/level_ai.tscn")
var level_2p: PackedScene = preload("res://Scenes/level_2p.tscn")


func _on_play_button_pressed():
	$MarginContainer/StartingOptions.hide()
	$MarginContainer/PlayOptions.show()


func _on_back_button_pressed():
	if $MarginContainer/PlayOptions.visible or $MarginContainer/OptionsMenu.visible:
		$MarginContainer/PlayOptions.hide()
		$MarginContainer/OptionsMenu.hide()
		$MarginContainer/StartingOptions.show()
		

func _on_options_button_pressed():
	$MarginContainer/StartingOptions.hide()
	$MarginContainer/OptionsMenu.show()


func _on_one_player_button_pressed():
	get_tree().change_scene_to_packed(level_ai)


func _on_two_player_button_pressed():
	get_tree().change_scene_to_packed(level_2p)


func _on_text_edit_text_changed():
	Globals.winning_score = int($MarginContainer/OptionsMenu/TextEdit.text)
	
