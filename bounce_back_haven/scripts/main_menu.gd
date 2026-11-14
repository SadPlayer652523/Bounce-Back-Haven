extends Control

@onready var main_buttons: VBoxContainer = $"Main Buttons"
@onready var options: Panel = $Options

# Called when the node enters the scene tree for the first time.
func _process(delta):
	pass # Replace with function body.

func _ready():
	main_buttons.visible = true
	options.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.

	pass


func _on_start5_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/room_1.tscn")


func _on_settings_pressed() -> void:
	print("Settings pressed")
	main_buttons.visible = false
	options.visible = true

func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_back_options_pressed() -> void:
	_ready()
