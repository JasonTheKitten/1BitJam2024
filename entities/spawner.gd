class_name PlayerSpawner
extends Marker2D

@export var _player_scene: PackedScene
var _current_player: CharacterBody2D

func _ready() -> void:
	_current_player = _player_scene.instantiate()
	get_parent().add_child.call_deferred(_current_player)
	call_deferred("respawn")
	
func respawn() -> void:
	_current_player.position = position
	_current_player.tpfreeze()
