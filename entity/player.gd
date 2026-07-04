extends CharacterBody2D
class_name Player

var speed = 75.0
var playerHidden : int = 0
var playerInSmokeyFOV : bool = false
var hasAllKey=false
var isLightOn=false

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("move left", "move right", "move up", "move down")
	if Input.is_action_just_pressed("useMatch"):
		isLightOn=not isLightOn
		if isLightOn:
			$AnimatedSprite2D.play("light")
		else:
			$AnimatedSprite2D.play("dark")
	velocity = direction * speed
	move_and_slide()
