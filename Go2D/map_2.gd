extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Game.cur_level = 2
	var camera = get_node("Player/fox_player/Camera2D")
	camera.limit_bottom = 1295 
	Utils.save_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
