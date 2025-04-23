extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

@export var speed = 40
@export var gravity: float = 800.0
@export var player_path: NodePath

var player: Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("/root/Level/Player")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#apply gravity
	velocity.y += gravity * delta
	
	# Determine direction to player (only in x-axis)
	var direction = sign(player.global_position.x - global_position.x)
	
	#moving towards player
	velocity.x = direction * speed
	
	#flip sprite 
	if direction != 0:
		animated_sprite.flip_h = direction < 0
	
	move_and_slide()
