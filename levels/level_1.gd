extends Node2D

@export var _spawner: PlayerSpawner
@export var _spike_pits: Array[SpikePit]
@export var _reversos: Array[Reverso]

func _ready() -> void:
	for spike_pit: SpikePit in _spike_pits:
		spike_pit.spike_hit.connect(_handle_player_death)
	for reverso: Reverso in _reversos:
		reverso.reverso_activated.connect(_spawner.current_player().set_speed_multiplier)

func _handle_player_death() -> void:
	_spawner.respawn()
