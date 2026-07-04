extends CharacterBody2D
class_name Player

var speed:float = 75.0
var sanitySpeed:float=0.2
var playerHidden : int = 0
var playerInSmokeyFOV : bool = false
var hasAllKey:bool=false
var isLightOn:bool=false

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
	if isLightOn:
		%sanityBar.value+=sanitySpeed*5
	else:
		%sanityBar.value-=sanitySpeed
	velocity = direction * speed
	if playerInSmokeyFOV and playerHidden==0:
		die()
	move_and_slide()

func die():
	get_tree().change_scene_to_file("res://Menus/loose_menu.tscn")
