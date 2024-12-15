extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame
	var scene_a = load("res://Scenes/Jurasic.tscn").instantiate()
	var scene_b = load("res://Scenes/Museum.tscn").instantiate()
	#call_deferred("setup_scenes", scene_a, scene_b)
	setup_scenes(scene_a, scene_b)
	#pass # Replace with function body.

	#$"Dialog UI".render(Dialog.new().from_file("res://Dialogues/dialog1.json"))



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if WinningConditions.are_you_wining_son:
		WinningConditions.first_cond = false
		WinningConditions.are_you_wining_son= false
		var scene_a = load("res://Scenes/SceneA.tscn").instantiate()
		var scene_b = load("res://Scenes/SceneB.tscn").instantiate()
		setup_scenes(scene_a, scene_b)
		$"Dialog UI".render(Dialog.new().from_file("res://Dialogues/dialog1.json"))


func setup_scenes(left_scene: Node2D, right_scene: Node2D) -> void:
	var left_viewport = $HBoxContainer/LeftViewportContainer/SubViewport
	var right_viewport = $HBoxContainer/RightViewportContainer/SubViewport
	#print($HBoxContainer)
	#print($HBoxContainer)
	# Wyczyść istniejące dzieci w SubViewportach
	for child in left_viewport.get_children():
		left_viewport.remove_child(child)
	for child in right_viewport.get_children():
		right_viewport.remove_child(child)

	# Dodaj nowe sceny do SubViewportów
	left_viewport.add_child(left_scene)
	right_viewport.add_child(right_scene)

	# Opcjonalnie ustaw pozycje lub inne właściwości scen
	left_scene.position = Vector2.ZERO
	right_scene.position = Vector2.ZERO
