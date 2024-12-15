extends Node

var first_cond = false
var second_cond = false
var are_you_wining_son = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func set_first_cond() -> void:
	first_cond = true
	print("First condition satisfied")


func set_second_cond() -> void:
	if first_cond:
		second_cond = true
		are_you_wining_son=true
