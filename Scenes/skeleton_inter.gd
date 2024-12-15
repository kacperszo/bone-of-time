extends Area2D

var isInside = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if isInside  and Input.is_action_just_pressed("interact"):
		WinningConditions.set_second_cond()


func _on_body_entered(body: Node2D) -> void:
	isInside = true


func _on_body_exited(body: Node2D) -> void:
	isInside = false
