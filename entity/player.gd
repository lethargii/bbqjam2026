extends CharacterBody2D
class_name Player

var speed:float = 75.0
var sanitySpeed:float=0.2
var playerHidden : int = 0
var playerInSmokeyFOV : bool = false
var hasAllKey:bool=false
var isLightOn:bool=false
var animationPeriodRotation:float=0 # pour faire fonctionner l'animation du joueur
var animationPeriodVertical:float=0 # pour faire fonctionner l'animation du joueur

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
		%sanityBar.value+=sanitySpeed*3
	else:
		%sanityBar.value-=sanitySpeed
		if %sanityBar.value==0:
			die()
	if direction!=Vector2.ZERO:
		animationPeriodRotation+=_delta*45
		$AnimatedSprite2D.rotation=0.2*sin(animationPeriodRotation)
		print(rotation)
	else:
		$AnimatedSprite2D.rotation=0
	if isLightOn:
		animationPeriodVertical+=_delta*10
	else:
		animationPeriodVertical+=_delta*3
	$AnimatedSprite2D.scale.y=1+0.1*sin(animationPeriodVertical)
	$AnimatedSprite2D.position.y=-4-1*sin(animationPeriodVertical)
	velocity = direction * speed
	if playerInSmokeyFOV and playerHidden==0:
		die()
	move_and_slide()

func die():
	get_tree().change_scene_to_file("res://Menus/loose_menu.tscn")
