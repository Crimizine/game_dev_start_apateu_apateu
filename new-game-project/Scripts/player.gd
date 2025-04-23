extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 92.0
const SPRINT_SPEED = 137.6
const JUMP_VELOCITY = - 250.0
const SPRINT_SCALING = 2
var is_sprinting = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction: -1,0,1
	var direction := Input.get_axis("left", "right")
	#flip the poition of the sprite based on directionw
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		
	#play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		elif direction != 0 and is_sprinting == true:
				animated_sprite_2d.play("sprint")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jumping")
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_pressed("sprint"):
		is_sprinting = true
	else:
		is_sprinting = false
	
	if is_sprinting:
		velocity.x = direction * SPRINT_SPEED
	else:
		velocity.x = direction * SPEED
		
	#print(velocity.x)
	move_and_slide()
