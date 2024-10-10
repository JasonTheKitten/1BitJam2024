extends Node2D

@export var _spawner: PlayerSpawner
@export var _spike_pits: Array[SpikePit]
@export var _reversos: Array[Reverso]
@export var _gravity_switches: Array[GravitySwitch]
@export var _checkpoints: Array[Checkpoint]

func _ready() -> void:
	for spike_pit: SpikePit in _spike_pits:
		spike_pit.spike_hit.connect(_handle_player_death)
	for reverso: Reverso in _reversos:
		reverso.reverso_activated.connect(_spawner.current_player().set_speed_multiplier)
	for gravity_switch: GravitySwitch in _gravity_switches:
		gravity_switch.gravity_change.connect(_handle_gravity_switch)
	for check_point: Checkpoint in _checkpoints:
		check_point.reached.connect(_handle_checkpoint)


func _handle_player_death() -> void:
	_spawner.respawn()


func _handle_gravity_switch(
	gravity_orientation: Player.GravityOrientation,
	target_section: CollisionObject2D
) -> void:
	var current_player: Player = _spawner.current_player()
	current_player.set_gravity_orientation(gravity_orientation)
	current_player.force_player_collide(target_section)


func _handle_checkpoint(new_spawn_point: Marker2D) -> void:
	_spawner.position = new_spawn_point.position
