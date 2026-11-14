extends HSlider

func _ready():
	pass

func _on_value_changed(value: float) -> void:
	var db = linear_to_db(value)
	Global.volume = db
