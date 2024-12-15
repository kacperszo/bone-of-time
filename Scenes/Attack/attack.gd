extends Node2D

@export var duration:float = 0.5
@export var rotation_speed:int = 135 * 2

var player:CharacterBody2D

var time_left:float = duration

func _ready():
	player = get_parent()
	self.rotation = -45
	self.position = Vector2(0, 0)

func _process(delta):
	time_left -= delta
	#self.position = player.position
	rotation += deg_to_rad(rotation_speed * delta)
	
	if time_left <= 0:
		queue_free()


func _on_area_2d_body_exited(body):
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	if body.has_method("get_stunned"):
		body.get_stunned()
		
		
