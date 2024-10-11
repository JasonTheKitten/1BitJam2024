class_name Player
extends CharacterBody2D

@export var _speed: float = 30
@export var _sprite: Sprite2D

var _gravity : float = ProjectSettings.get_setting("physics/2d/default_gravity")
var _speed_multiplier : float = 1
var _has_active_collision : bool = false


func _physics_process(_delta: float) -> void:
	velocity = Vector2(
		Input.get_axis("player_left", "player_right") * _speed * _speed_multiplier,
		Input.get_axis("player_up", "player_down") * _speed * _speed_multiplier)
	
	_sprite.flip_h = velocity.x < 0
		
	move_and_slide()
	

func set_speed_multiplier(speed_multiplier: float) -> void:
	_speed_multiplier = speed_multiplier

enum GravityOrientation {
	DOWN,
	LEFT,
	UP,
	RIGHT
}

