extends Area2D

var parent_node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))
	parent_node = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func _on_body_entered(body):
	print("Wykryto gracza: ", body.name)
	parent_node.set_chasing(true)
	
func _on_body_exited(body):
	print("Gracz wyszedl ", body.name)
	parent_node.set_chasing(false)
