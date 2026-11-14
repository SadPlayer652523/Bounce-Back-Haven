extends Control

@onready var screens = $"Screens"

const screens_offset = [0, 648]

func _process(delta):
	pass # Replace with function body.

func _ready():
	pass

func _on_start5_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/room_1.tscn")

func _on_settings_pressed() -> void:
	var tween = create_tween().set_parallel(true).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.tween_property(screens, "position:y", screens_offset[1], 0.3)

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_back_options_pressed() -> void:
	var tween = create_tween().set_parallel(true).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.tween_property(screens, "position:y", screens_offset[0], 0.3)
