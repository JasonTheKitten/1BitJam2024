class_name Dragon
extends CharacterBody2D

@export var _speed: float = 30
@export var _jump_velocity : float = 30

var _gravity : float = ProjectSettings.get_setting("physics/2d/default_gravity")
var _had_zero_frame : bool = false
var _has_safe_frames : bool = true
var _speed_multiplier : float = 1
var _gravity_orientation: GravityOrientation = GravityOrientation.DOWN
var _movement_disabled_until_collide: Area2D = null
var _has_active_collision : bool = false


func _physics_process(_delta: float) -> void:
	if _has_safe_frames:
		_has_safe_frames = (
			!Input.get_axis("player_left", "player_right") == 0
			|| Input.is_action_pressed("player_jump"))
		return
		
	var is_vertical: bool = (
		_gravity_orientation == GravityOrientation.DOWN
		|| _gravity_orientation == GravityOrientation.UP)
	var is_jump_velocity_zero: bool = velocity.y == 0 if is_vertical else velocity.x == 0
		
	var movement_vector: Vector2 = Vector2(
		Input.get_axis("player_left", "player_right") * _speed * _speed_multiplier, 0)
	
	if Input.is_action_pressed("player_jump") && is_jump_velocity_zero && _had_zero_frame:
		_had_zero_frame = false
		movement_vector.y = -_jump_velocity
	else:
		_had_zero_frame = is_jump_velocity_zero
		movement_vector.y = _gravity
		
	if !(_movement_disabled_until_collide == null || _has_active_collision):
		movement_vector.x = 0
		movement_vector.y = _gravity
		
	match _gravity_orientation:
		GravityOrientation.DOWN:
			velocity.x = movement_vector.x
			velocity.y += movement_vector.y
		GravityOrientation.UP:
			velocity.x = movement_vector.x
			velocity.y -= movement_vector.y
		GravityOrientation.RIGHT:
			velocity.x += movement_vector.y
			velocity.y = -movement_vector.x
		GravityOrientation.LEFT:
			velocity.x -= movement_vector.y
			velocity.y = -movement_vector.x
		
	if velocity.y < 0:
		collision_mask &= ~2
	else:
		collision_mask |= 2
		
	_has_active_collision = move_and_slide()
	if (
		_movement_disabled_until_collide != null
		&& _movement_disabled_until_collide.overlaps_body(self)
	):
		_movement_disabled_until_collide = null


func tpfreeze() -> void:
	velocity = Vector2(0, 0)
	_speed_multiplier = 1
	_has_safe_frames = true
	_gravity_orientation = GravityOrientation.DOWN
	_movement_disabled_until_collide = null
	

func set_speed_multiplier(speed_multiplier: float) -> void:
	_speed_multiplier = speed_multiplier
	
func set_gravity_orientation(orientation: GravityOrientation) -> void:
	_gravity_orientation = orientation
	
func force_player_collide(target_collision: CollisionObject2D) -> void:
	_movement_disabled_until_collide = target_collision

enum GravityOrientation {
	DOWN,
	LEFT,
	UP,
	RIGHT
}

