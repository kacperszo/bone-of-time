extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var x = Dialog.new().from_file("res://Dialogues/test.json")
	print(x.dialog_id)
