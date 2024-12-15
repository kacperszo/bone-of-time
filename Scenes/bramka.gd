extends Area2D

var player_in_range = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_in_range:
		$fizyczna_bramka.queue_free()
		self.queue_free()

func _on_body_entered(body: Node2D) -> void:
	player_in_range = true


func _on_body_exited(body: Node2D) -> void:
	player_in_range = false
