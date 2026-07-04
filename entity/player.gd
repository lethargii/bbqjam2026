extends CharacterBody2D
class_name Player

const SPEED = 75.0

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("move left", "move right", "move up", "move down")
	
	velocity = direction * SPEED
	move_and_slide()
