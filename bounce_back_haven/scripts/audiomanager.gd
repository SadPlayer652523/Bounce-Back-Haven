extends Node

@export var audio_bus_name : String

var audio_bus_id

func _ready() -> void:
	audio_bus_id = AudioServer.get_bus_index(audio_bus_name)

func _process(delta: float) -> void:
	AudioServer.set_bus_volume_db(audio_bus_id, Global.volume)
