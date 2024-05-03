extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Health_label").text = "HP:    " + str(Game.player_health)
	get_node("Score_label").text =  "Score: " + str(Game.player_score)
