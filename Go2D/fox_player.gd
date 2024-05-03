extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_count = 0
var max_jumps = 2

@onready var player = get_node("AnimationPlayer")
@onready var anim = get_node("AnimatedSprite2D")


func _on_ready():
	var players = "player_group"
	# Retrieve all nodes in the 'player' group
	var player_nodes = get_tree().get_nodes_in_group(players)
	# Remove each node from the group
	for node in player_nodes:
		node.remove_from_group(players)
	# Optionally, add this node to the 'player' group if needed
	add_to_group(players)


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		jump_count = 0

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and jump_count < max_jumps:
		velocity.y = JUMP_VELOCITY
		jump_count += 1
		player.play("Jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction == -1:
		anim.flip_h = true
	elif direction == 1:
		anim.flip_h = false
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			player.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			player.play("Idle")
	if velocity.y > 0:
		player.play("Fall")
	move_and_slide()
	
	if Utils.health_zero():
		queue_free()
		get_tree().change_scene_to_file("res://main.tscn")

func _input(event):
	if Input.is_key_pressed(KEY_1):
		Game.player_health -= 1
	if Input.is_key_pressed(KEY_2):
		Game.player_score += 1
