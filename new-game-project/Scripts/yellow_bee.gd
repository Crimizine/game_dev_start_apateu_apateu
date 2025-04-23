extends Node2D

@export var speed = 50
@onready var player: Node2D = get_node("/root/Level/Player") 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Find the player node in the scene
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player:
		var direction = (player.global_position - global_position).normalized()
		position += direction * speed * delta
