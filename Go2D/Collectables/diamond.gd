extends Area2D

var meet = false


func _on_body_entered(body):
	if str(body.name).contains("player") and not meet:
		Game.player_score += 5
		meet = true
		var tween = get_tree().create_tween()
		var tween2 = get_tree().create_tween()
		tween.tween_property(self, "position", position - Vector2(0,35), 0.35)
		tween2.tween_property(self, "modulate:a", 0, 0.2)
		tween.tween_callback(queue_free)



func _on_ready():
	get_node("AnimatedSprite2D").play("Idle")
