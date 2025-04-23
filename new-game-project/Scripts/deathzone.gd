extends Area2D
@onready var timer: Timer = $Timer



func _on_body_entered(body: Node2D) -> void:
	if body.name != "Player":
		return
		
	print("you died")
	Engine.time_scale = 0.5
	
	var shape = body.get_node_or_null("CollisionShape2D")
	if shape:
		shape.queue_free()
	else:
		print("CollisionShape2D not found on Player")
		
	timer.start()



func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
