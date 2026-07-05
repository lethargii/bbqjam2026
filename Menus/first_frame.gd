extends CanvasLayer

func _process(delta: float) -> void:
	$Sprite2D.position.y-=70*delta
	if $Sprite2D.position.y<233.0:
		$Sprite2D2.position.y-=500*delta
		if $Sprite2D2.position.y<300 and $Sprite2D2.position.y>-300:
			get_tree().change_scene_to_file("res://Menus/main_menu.tscn")
