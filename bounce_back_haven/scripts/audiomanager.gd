extends Node

@onready var audio: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	var target_vol = Global.volume
	if target_vol <= 0.001:
		audio.volume_db = -80.0 
	else:
		if target_vol > 1.0:
			target_vol = target_vol / 100.0
		audio.volume_db = linear_to_db(target_vol)
