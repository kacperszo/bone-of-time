class_name PlayerMovement
extends CharacterBody2D

# Signal to be emitted when a collision occurs
signal collision_detected(collider)

# Static variable to track movement state across all players
static var any_player_blocked: bool = false

@export var speed: float = 300.0  # Movement speed
var was_blocked_last_frame: bool = false

func _ready():
	# Reset the global blocked state at the start of each scene
	any_player_blocked = false

func _physics_process(delta: float):
	# Reset the blocked state for this frame before movement
	was_blocked_last_frame = false
	
	# Only attempt movement if no players were blocked in the previous frame
	if not any_player_blocked:
		# Get input direction
		var input_direction = Vector2.ZERO
		input_direction.x = Input.get_axis("ui_left", "ui_right")
		input_direction.y = Input.get_axis("ui_up", "ui_down")
		
		# Normalize input to prevent faster diagonal movement
		input_direction = input_direction.normalized()
		
		# Set velocity based on input and speed
		velocity = input_direction * speed
		
		# Move with collision detection
		move_and_slide()
		
		# Check for collisions
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			if collision:
				# Mark that this player was blocked
				was_blocked_last_frame = true
				any_player_blocked = true
				emit_signal("collision_detected", collision.get_collider())
				
				# Reset velocity to prevent movement
				velocity = Vector2.ZERO
	else:
		# If any player was blocked, ensure this player doesn't move
		velocity = Vector2.ZERO

# Reset the blocked state at the end of the physics frame
func _process(_delta):
	if get_physics_process_delta_time() > 0:
		any_player_blocked = false
