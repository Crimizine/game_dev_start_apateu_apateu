extends Node2D

@export var enemy_scene: PackedScene
@export var spawn_internval = 3
@export var enemy_parent_path: NodePath = "../../Enemies"


var enemy_parent:Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemy_parent = get_node(enemy_parent_path)
	
	
	spawn_enemy()
	var timer = Timer.new()
	timer.wait_time = spawn_internval
	timer.one_shot = false
	timer.timeout.connect(spawn_enemy)
	add_child(timer)
	timer.start()


func spawn_enemy():
	if not enemy_scene:
		return
	var enemy = enemy_scene.instantiate()
	enemy.global_position = global_position
	enemy_parent.add_child(enemy)
	
