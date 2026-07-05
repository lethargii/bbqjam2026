extends CanvasLayer

func _ready() -> void:
	$VBoxContainer/Label.text+="\n"+Global.causeOfDeath
	Global.causeOfDeath=""

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
