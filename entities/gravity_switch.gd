class_name GravitySwitch
extends Area2D

@export var _orientation: Player.GravityOrientation = Player.GravityOrientation.DOWN


signal gravity_change


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(_body: PhysicsBody2D) -> void:
	gravity_change.emit(_orientation)
