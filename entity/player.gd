extends CharacterBody2D
class_name Player

var speed:float = 75.0
var sanitySpeed:float=0.2
var playerHidden : int = 0
var playerInSmokeyFOV : bool = false
var hasAllKey:bool=false
var isLightOn:bool=true
var animationPeriodRotation:float=0 # pour faire fonctionner l'animation du joueur
var animationPeriodVertical:float=0 # pour faire fonctionner l'animation du joueur
var isSafe = false
var timeToLulu:float=100

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("move left", "move right", "move up", "move down")
	if Input.is_action_just_pressed("useMatch"):
		changeLight()
	if isLightOn or $MoonLight.enabled:
		%sanityBar.value+=sanitySpeed*3
	else:
		%sanityBar.value-=sanitySpeed*0.5
		if %sanityBar.value==0:
			Global.causeOfDeath="You need to be cautious about your sanity.\nDon't stay in the dark for too long."
			die()
	if %sanityBar.value<30:
		%dangerFrame.visible=true
	else :
		%dangerFrame.visible=false
	if direction!=Vector2.ZERO:
		animationPeriodRotation+=_delta*45
		$AnimatedSprite2D.rotation=0.2*sin(animationPeriodRotation)
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
		Global.causeOfDeath="That does seem obvious but don't go in front of Smokey.\n"
		die()
	timeToLulu-=10*_delta
	if timeToLulu<=0:
		print("lulu")
		$lulu.play()
		timeToLulu=randf_range(20,150)
	move_and_slide()

func die():
	get_tree().change_scene_to_file("res://Menus/screamer.tscn")

func changeLight():
	isLightOn=not isLightOn
	if isLightOn:
		$AnimatedSprite2D.play("light")
		$Light.visible=true
		$Dark.visible=false
	else:
		$AnimatedSprite2D.play("dark")
		$Light.visible=false
		$Dark.visible=true

func rmVisibile():
	$CollisionShape2D.visible=false
	$AnimatedSprite2D.visible=false

func addVisibile():
	$CollisionShape2D.visible=true
	$AnimatedSprite2D.visible=true
	
func toggleMoonLight(toggle : bool):
	$MoonLight.enabled = toggle
