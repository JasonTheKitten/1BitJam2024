class_name Reverso
extends Area2D

@export var _speed_multiplier : float = 1

signal reverso_activated

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(_body: PhysicsBody2D) -> void:
	reverso_activated.emit(_speed_multiplier)
