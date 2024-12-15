extends CharacterBody2D

class_name Player
# Signal to be emitted when a collision occurs
signal collision_detected(collider)
@export var speed: float = 300.0  # Movement speed

# Local state for this player
var was_blocked_last_frame: bool = false
@export var is_hidden = false

func _ready():
	# Reset the global blocked state at the start of the scene
	MovementSynchronizer.reset_blocked_state()

func _physics_process(delta: float):
	# Reset the blocked state for this frame
	was_blocked_last_frame = false

	# Check the global blocked state
	if not MovementSynchronizer.is_any_player_blocked():
		# Get input direction
		var input_direction = Vector2.ZERO
		input_direction.x = Input.get_axis("ui_left", "ui_right")
		input_direction.y = Input.get_axis("ui_up", "ui_down")

		# Normalize input to prevent faster diagonal movement
		input_direction = input_direction.normalized()

		# Set velocity based on input and speed
		velocity = input_direction * speed
		#animation
		if velocity.length() != 0:
			$AnimatedSprite2D.animation = "walk"
			$AnimatedSprite2D.flip_v = false
			$AnimatedSprite2D.flip_h = velocity.x > 0
			$AnimatedSprite2D.play()
		else:
			$AnimatedSprite2D.animation = "idle"
			$AnimatedSprite2D.stop()
		# Move with collision detection
		move_and_slide()

		# Check for collisions
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			if collision:
				# Mark that this player was blocked
				was_blocked_last_frame = true
				MovementSynchronizer.set_any_player_blocked(true)
				emit_signal("collision_detected", collision.get_collider())

				# Reset velocity to prevent movement
				velocity = Vector2.ZERO
	else:
		# If any player was blocked, ensure this player doesn't move
		velocity = Vector2.ZERO

	# At the end of the physics frame, report whether this player was blocked
	if not was_blocked_last_frame:
		MovementSynchronizer.report_player_unblocked()
