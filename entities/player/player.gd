class_name Player
extends CharacterBody2D

@export var _speed: float = 30
@export var _jump_velocity : float = 30

var _gravity : float = ProjectSettings.get_setting("physics/2d/default_gravity")
var _had_zero_frame : bool = false
var _has_safe_frames : bool = true
var _speed_multiplier : float = 1


func _physics_process(_delta: float) -> void:
	if _has_safe_frames:
		_has_safe_frames = (
			!Input.get_axis("player_left", "player_right") == 0
			||Input.is_action_pressed("player_jump"))
		return
		
	velocity.x = Input.get_axis("player_left", "player_right") * _speed * _speed_multiplier
	if Input.is_action_pressed("player_jump") && velocity.y == 0 && _had_zero_frame:
		_had_zero_frame = false
		velocity.y = -_jump_velocity
	else:
		_had_zero_frame = velocity.y == 0
		velocity.y += _gravity
	if velocity.y < 0:
		collision_mask &= ~2
	else:
		collision_mask |= 2
	move_and_slide()


func tpfreeze() -> void:
	_speed_multiplier = 1
	velocity = Vector2(0, 0)
	_has_safe_frames = true
	

func set_speed_multiplier(speed_multiplier: float) -> void:
	_speed_multiplier = speed_multiplier
