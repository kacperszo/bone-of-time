extends Node2D

@export var attack_scene: PackedScene 
@export var attack_offset: Vector2 = Vector2(50, 0)

var cooldown:float

func _ready():
	set_process_input(true)
	cooldown = 0.5

func _process(delta):
	cooldown-=delta

func _input(event):
	if Input.is_action_just_pressed("attack") and cooldown<=0:
		spawn_attack()
		cooldown = 0.5



func spawn_attack():
	if attack_scene == null:
		return
	var attack_instance = attack_scene.instantiate()

	if attack_instance == null:
		return
		
	get_parent().add_child(attack_instance)
	
