class_name Ladder
extends Area2D

@export var _next_level: PackedScene


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func trigger() -> void:
	get_tree().change_scene_to_packed(_next_level)


func _on_body_entered(_body: PhysicsBody2D) -> void:
	trigger()
