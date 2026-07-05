extends CanvasLayer

func _ready() -> void:
	get_child(RandomNumberGenerator.new().randi_range(1,2)).play()


func _on_val_1_finished() -> void:
	next()
func _on_val_2_finished() -> void:
	next()
func next():
	get_tree().change_scene_to_file("res://Menus/loose_menu.tscn")
