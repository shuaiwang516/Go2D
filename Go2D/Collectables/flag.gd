extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimatedSprite2D").play("Idle")
	get_node("Label").visible = false
	


func _on_body_entered(body):
	if str(body.name).contains("player"):
		var target_score = Game.cur_level * 15
		if Game.player_score >= target_score:
			Game.cur_level += 1
			if Game.cur_level <= 4:
				get_tree().change_scene_to_file("res://map_" + str(Game.cur_level) + ".tscn")
			else:
				get_node("AnimatedSprite2D").queue_free()
				get_node("Label").visible = true
				await get_tree().create_timer(2.0).timeout
				Game.player_health = 10
				Game.player_score = 0
				get_tree().change_scene_to_file("res://main.tscn")
		#var tween = get_tree().create_tween()
		#var tween2 = get_tree().create_tween()
		#tween.tween_property(self, "position", position - Vector2(0,35), 0.35)
		#tween2.tween_property(self, "modulate:a", 0, 0.2)
		#tween.tween_callback(queue_free)
