extends Area2D
var player_in_area = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_in_area and Input.is_action_just_pressed("interact"):
		WinningConditions.set_second_cond()
	
func _on_body_entered(body):
	player_in_area = true


func _on_body_exited(body: Node2D) -> void:
	player_in_area = false
