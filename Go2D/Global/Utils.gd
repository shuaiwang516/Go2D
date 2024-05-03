extends Node

const SAVE_PATH = "res://savegame.bin"

func save_game():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data = {
		"player_health": Game.player_health,
		"player_score": Game.player_score
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	file.close()
	
func load_game():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var cur_line = JSON.parse_string(file.get_line())
			if cur_line:
				Game.player_health = cur_line["player_health"]
				Game.player_score = cur_line["player_score"]
	file.close()

func get_player():
	var players = get_tree().get_nodes_in_group("player_group")
	if players.size() > 0:
		return players[0]
	else:
		return null

func health_zero():
	if Game.player_health > 0:
		return false
	else:
		Game.player_health = 10
		Game.player_score = 0
		Game.player_kills = 0
		return true
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
