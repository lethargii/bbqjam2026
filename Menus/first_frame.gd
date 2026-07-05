extends CanvasLayer

func _process(delta: float) -> void:
	$Sprite2D.position.y-=70*delta
	if $Sprite2D.position.y<233.0:
		$Sprite2D2.visible=true
		if $Timer.is_stopped():
			$Timer.start()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Menus/main_menu.tscn")
