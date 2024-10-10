class_name Checkpoint
extends Area2D

@export var _respawn_point: Marker2D

signal reached


func _ready() -> void:
	body_entered.connect(_on_collision)


func _on_collision(_body: PhysicsBody2D) -> void:
	reached.emit(_respawn_point)
