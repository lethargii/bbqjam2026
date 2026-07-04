extends CharacterBody2D
class_name Player

var speed = 75.0
var playerHidden : int = 0
var playerInSmokeyFOV : bool = false
var hasAllKey=false

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("move left", "move right", "move up", "move down")
	
	velocity = direction * speed
	move_and_slide()
