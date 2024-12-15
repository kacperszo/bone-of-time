extends Node2D

var player:Node

@export var attack_duration:float = 0.5
@export var max_rotation: float = 135
var rotation_speed:float
var time_left: float

func _ready():
	time_left = attack_duration
	var rotation_speed = max_rotation/attack_duration

func _process(delta):

	rotation_degrees += rotation_speed * delta
	rotation = rotation + rotation_degrees

	time_left -= delta
	if time_left <= 0:
		queue_free()
