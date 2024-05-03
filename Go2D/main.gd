extends Node2D


func _on_quit_pressed():
	get_tree().quit()


func _on_start_pressed():
	get_tree().change_scene_to_file("res://map_1.tscn")


func _on_ready():
	Utils.load_game()
	if Game.cur_level <= 1:
		get_node("Restart").disabled = true


func _on_restart_pressed():
	get_tree().change_scene_to_file("res://map_" + str(Game.cur_level) + ".tscn")
