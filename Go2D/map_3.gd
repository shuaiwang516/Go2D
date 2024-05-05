extends Node2D

@onready var health_timer = get_node("Timer")
var elapsed = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	Game.cur_level = 3
	var camera = get_node("Player/fox_player/Camera2D")
	camera.limit_bottom = 1295 
	Utils.save_game()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	elapsed += delta
	var player = get_node("Player/fox_player")
	var cur_position_y = player.position.y
	if cur_position_y >= 1000:
		if elapsed >= 1.5:
			Game.player_health -= 1
			elapsed = 0
	else:
		elapsed = 0
