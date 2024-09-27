class_name Player
extends CharacterBody2D

@export var _speed: float = 30
@export var _jump_velocity: float = 30

var gravity : float = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	velocity.x = Input.get_axis("player_left", "player_right") * _speed
	if Input.is_action_just_pressed("player_jump"):
		velocity.y = -_jump_velocity
	else:
		velocity.y += gravity
	if velocity.y < 0:
		collision_mask &= ~2
	else:
		collision_mask |= 2
	move_and_slide()
