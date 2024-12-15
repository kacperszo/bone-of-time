extends Sprite2D

signal animation_finished

var parent_node
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.connect("animation_finished", Callable(self, "_on_animation_finished"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	parent_node = get_parent()
	if parent_node.rolling:
		$AnimationPlayer.play("rolled")
		parent_node.rolling=false
		
func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "rolled":
		emit_signal("animation_finished")
