extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimatedSprite2D").play("Idle")
	


func _on_body_entered(body):
	if str(body.name).contains("player"):
		var target_score = Game.cur_level * 15
		if Game.player_score >= target_score:
			Game.cur_level += 1
			get_tree().change_scene_to_file("res://map_" + str(Game.cur_level) + ".tscn")
		#var tween = get_tree().create_tween()
		#var tween2 = get_tree().create_tween()
		#tween.tween_property(self, "position", position - Vector2(0,35), 0.35)
		#tween2.tween_property(self, "modulate:a", 0, 0.2)
		#tween.tween_callback(queue_free)
