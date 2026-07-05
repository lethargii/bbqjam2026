extends AnimatedSprite2D

func _on_animation_looped() -> void:
	if visible:
		$SfxrStreamPlayer2D.play()
