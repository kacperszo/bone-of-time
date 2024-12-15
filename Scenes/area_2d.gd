extends Area2D


signal interaction(interaction_id)
var player_in_area_of_interaction = false
@export var interaction_id = 0;
var parent_node


func _process(delta: float) -> void:
	parent_node = get_parent()
	if Input.is_action_just_pressed("interact") and player_in_area_of_interaction:
		#emit_signal("interaction", interaction_id)
		print("skamieliny tududu")
		parent_node.rolling=true

func _on_body_entered(body: Node2D) -> void:
	print("dupa")
	player_in_area_of_interaction = true


func _on_body_exited(body: Node2D) -> void:
	player_in_area_of_interaction = false
