extends Node2D
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight

const SPEED = 60
var direction = 1
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#print("the worm is here") # Replace with function body.
	
#

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if ray_cast_right.is_colliding():
		direction = -1
	elif ray_cast_left.is_colliding():
		direction = 1
		
	#position.x += SPEED * delta *direction
