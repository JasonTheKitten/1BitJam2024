extends StaticBody2D


func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("player_duck"):
		collision_layer &= ~2
	else:
		collision_layer |= 2
