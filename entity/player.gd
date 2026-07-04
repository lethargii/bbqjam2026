extends CharacterBody2D
class_name Player

var speed = 750.0
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
			$Light.visible=true
			$Dark.visible=false
		else:
			$AnimatedSprite2D.play("dark")
			$Light.visible=false
			$Dark.visible=true
	velocity = direction * speed
	if playerInSmokeyFOV and playerHidden==0:
		die()
	move_and_slide()

func die():
	get_tree().change_scene_to_file("res://Menus/loose_menu.tscn")
