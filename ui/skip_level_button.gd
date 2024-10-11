class_name SkipLevelButton
extends Button

signal level_skipped


func _ready() -> void:
	pressed.connect(_on_button_pressed)


func _on_button_pressed() -> void:
	level_skipped.emit()
