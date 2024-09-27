extends Node2D

@export var _spawner: PlayerSpawner
@export var _spike_pits: Array[SpikePit]

func _ready() -> void:
	for spike_pit: SpikePit in _spike_pits:
		spike_pit.spike_hit.connect(_handle_player_death)

func _handle_player_death() -> void:
	_spawner.respawn()
