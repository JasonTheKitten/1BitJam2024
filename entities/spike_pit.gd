class_name SpikePit
extends Area2D

signal spike_hit


func _ready() -> void:
	body_entered.connect(_emit_spike_hit)


func _emit_spike_hit(_body: PhysicsBody2D) -> void:
	spike_hit.emit()
