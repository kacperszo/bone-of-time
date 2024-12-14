extends CharacterBody2D


const SPEED = 150.0
const CHASING_SPEED = 300
const JUMP_VELOCITY = -400.0
var target_position: Vector2
var pos1: Vector2
var pos2: Vector2
var chasing: bool

var player_reference: PlayerMovement
var parent_node

func _ready():
	# Reset the global blocked state at the start of each scene
	parent_node = get_parent()
	pos1 = parent_node.first_position
	pos2 = parent_node.second_position
	#print("Pierwsza pozycja: ", pos1)
	#print("Druga pozycja: ", pos2)
	self.position = pos1
	print(self.position)
	player_reference= parent_node.get_player_movement()
	print(player_reference)



func _physics_process(delta: float) -> void:
	pass
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	#move_and_slide()


func set_chasing(is_chasing) -> void:
	chasing=is_chasing

func get_chasing() -> bool:
	return chasing
	
	
func _process(delta: float)->void:
	if not player_reference:
		player_reference= parent_node.get_player_movement()
	if target_position == Vector2.ZERO and target_position != pos1:
		target_position = pos2
	
	if not chasing:
		var direction = (target_position - self.position).normalized()
		#print("porusza sie", direction)
		self.position += direction * SPEED * delta
		
		#print(self.position)
		
		if self.position.distance_to(target_position) < 5:
			if target_position == pos1:
				#print("change1")
				target_position = pos2
			else:
				#print("change2")
				target_position = pos1
	
	else:
		var direction = (player_reference.position - self.position).normalized()
		#print(player_reference.position.y,"     ",self.position.y)
		if player_reference.position.y > self.position.y:
			print("gora")
			#direction.y = abs(direction.y)
			self.position += direction * CHASING_SPEED * delta
		elif player_reference.position.y < self.position.y:
			print(player_reference.position.y,"     ",self.position.y)
			print("dol")
			direction.y = -abs(direction.y)
			self.position += direction * CHASING_SPEED * delta
		#self.position += direction * CHASING_SPEED * delta