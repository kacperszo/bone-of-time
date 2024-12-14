extends Area2D
signal interaction(interaction_id)
var player_in_area_of_interaction = false
@export var interaction_id = 0;
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_in_area_of_interaction:
		print("Interacting with...", interaction_id )
		emit_signal("interaction", interaction_id)

func _on_body_entered(body: Node2D) -> void:
	player_in_area_of_interaction = true


func _on_body_exited(body: Node2D) -> void:
	player_in_area_of_interaction = false
