extends Area2D
var SpeedPlayer:float
var isAnimated:bool=false
var animationPeriodVertical:float=0
var PositionY:float
var lightWasOn:bool=false

func _ready() -> void:
	PositionY=position.y

func _process(delta: float) -> void:
	if $note.isPlayerClose and Input.is_action_just_pressed("interact") and not isAnimated:
		enter()
	elif Input.is_action_just_pressed("interact") and isAnimated:
		exit()
	if isAnimated:
		animationPeriodVertical+=delta*3
		$Closed.position.y=PositionY+6-0.25*sin(animationPeriodVertical)
		$Closed.scale.y=1+0.05*sin(animationPeriodVertical)
	
		
func  enter():
	print("entered")
	open()
	$TimeToEnter.start()
	SpeedPlayer=%Player.speed
	%Player.speed=0

func  exit():
	print("exited")
	open()
	isAnimated=false
	%Player.speed=SpeedPlayer
	%Player.addVisibile()
	%Player.changeLight()
	$TimeToClose.start()

func _on_time_to_enter_timeout() -> void:
	%Player.rmVisibile()
	if %Player.isLightOn:
		%Player.changeLight()
		lightWasOn=true
	else:
		lightWasOn=false
	close()
	isAnimated=true

func open():
	$Open.visible=true
	$Closed.visible=false

func close():
	$Open.visible=false
	$Closed.visible=true


func _on_time_to_close_timeout() -> void:
	close()
