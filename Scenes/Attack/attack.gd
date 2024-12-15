extends Node2D

@export var duration:float = 0.5
@export var rotation_speed:int = 135 * 2

var player_sprite:AnimatedSprite2D

var time_left:float = duration

func _ready():
	var player = get_parent()
	
	for child in player.get_children():
		if child != self:  # Pomijamy sam węzeł (bo to nie rodzeństwo)
			if child.name == "AnimatedSprite2D":
				player_sprite = child  # Znaleziono rodzeństwo
				break
	
	self.rotation = -45
	self.position = Vector2(0, 0)

func _process(delta):
	if player_sprite == null:
		push_error("Player sprite is null")
	time_left -= delta
	
	if not player_sprite.flip_h:
		rotation -= deg_to_rad(rotation_speed * delta)
	else:
	
		rotation += deg_to_rad(rotation_speed * delta)
	
	if time_left <= 0:
		queue_free()


func _on_area_2d_body_entered(body):
	if body.has_method("get_stunned"):
		body.get_stunned()
		
		
