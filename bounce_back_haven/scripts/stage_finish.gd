extends Area2D

var next_level = Global.current_level + 1

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("die"):
		Global.current_level += 1
		get_tree().change_scene_to_file("res://scenes/room_" + str(next_level) +".tscn")
