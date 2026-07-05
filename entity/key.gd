extends Area2D

func _ready() -> void:
	%CanvasLayer.addKey()

func _on_body_entered(body: Node2D) -> void:
	print("got key")
	if body is Player:
		$CollisionShape2D.queue_free()
		$sprite.queue_free()
		%CanvasLayer.gotKey()
		$SfxrStreamPlayer2D.play()
		$timeToQueueFree.start()
		


func _on_time_to_queue_free_timeout() -> void:
	queue_free()
