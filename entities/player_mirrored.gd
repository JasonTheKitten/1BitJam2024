extends CharacterBody2D

@export var _player: CharacterBody2D


func _physics_process(_delta: float) -> void:
	position.x = 1920 - _player.position.x
	position.y = _player.position.y
