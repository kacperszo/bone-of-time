extends Node2D

#@export var first_position: Vector2 = Vector2(100, 150)
#@export var second_position: Vector2 = Vector2(100, 150)
@export var first_position: Vector2
@export var second_position: Vector2

var player: CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("../Player")  # Względna ścieżka do gracza

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func get_player_movement() -> CharacterBody2D:

