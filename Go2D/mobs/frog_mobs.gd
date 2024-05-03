extends CharacterBody2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var chase = false
var SPEED = 150
var death = false

func _physics_process(delta):
	if death:
		return
	velocity.y += gravity * delta
	if chase == true:
		get_node("AnimatedSprite2D").play("Jump")
		var player = Utils.get_player()
		if player != null:
			var direction = (player.position - self.position).normalized()
			if direction.x > 0:
				get_node("AnimatedSprite2D").flip_h = true
			else:
				get_node("AnimatedSprite2D").flip_h = false	
			velocity.x = direction.x * SPEED
	else:
		get_node("AnimatedSprite2D").play("Idle")
		velocity.x = 0
	move_and_slide()


func _on_player_detection_body_entered(body):
	if str(body.name).contains("player"):
		print("set to true")
		self.chase = true


func _on_player_detection_body_exited(body):
	if str(body.name).contains("player"):
		print("set to false")
		self.chase = false


func Death():
	self.death = true
	self.chase = false
	Game.player_score += 1
	get_node("AnimatedSprite2D").play("Death")
	await get_node("AnimatedSprite2D").animation_finished
	self.queue_free()
	
func _on_deatch_detection_body_entered(body):
	if str(body.name).contains("player"):
		print("hurt top")
		Death()

func _on_hurt_detection_body_entered(body):
	if str(body.name).contains("player"):
		print("hurt v")
		Game.player_health -= 3	
		Death()
