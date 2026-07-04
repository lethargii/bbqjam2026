extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if %Player.hasAllKey:
			$Open.visible=true
			$timeToWin.start()
			%Player.speed=0
		else:
			$Label.visible=true



func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		$Label.visible=false


func _on_time_to_win_timeout() -> void:
	get_tree().change_scene_to_file("res://Menus/win_menu.tscn")
