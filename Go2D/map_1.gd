extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var camera = get_node("fox_player/Camera2D")
	camera.limit_bottom = 550 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
