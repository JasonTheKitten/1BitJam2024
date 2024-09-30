class_name PlayerSpawner
extends Marker2D

@export var _player_scene: PackedScene
@export var _current_player: CharacterBody2D

func _ready() -> void:
	if _current_player == null:
		_current_player = _player_scene.instantiate()
	get_parent().add_child.call_deferred(_current_player)
	call_deferred("respawn")
	
func respawn() -> void:
	_current_player.position = position
	_current_player.tpfreeze()
	
func current_player() -> CharacterBody2D:
	return _current_player
