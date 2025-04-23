extends Node2D

@export var enemy_scene: PackedScene
@export var spawn_interval = 3
@export var enemy_parent_path: NodePath = "../../Enemies"
@export var spawn_radius: float = 50.0
@export var player_path: NodePath

var enemy_parent:Node
var player: Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemy_parent = get_node(enemy_parent_path)
	player = get_node("/root/Level/Player")
	
	
	spawn_enemy()
	var timer = Timer.new()
	timer.wait_time = spawn_interval
	timer.one_shot = false
	timer.timeout.connect(spawn_enemy)
	add_child(timer)
	timer.start()


func spawn_enemy():
	if not enemy_scene or not is_player_near():
		print("Too far, not spawning.")
		return
		
	print("Spawning enemy!")
	var enemy = enemy_scene.instantiate()
	enemy.global_position = global_position
	enemy_parent.add_child(enemy)
	
func is_player_near() -> bool:
	if not player:
		print("player reference is missing")
		return false
		
	var distance = global_position.distance_to(player.global_position)
	print("Player distance:", distance, " | Spawn radius:", spawn_radius)
	return distance <= spawn_radius
