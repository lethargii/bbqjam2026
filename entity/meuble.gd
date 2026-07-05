extends Area2D
var SpeedPlayer:float=%Player.speed
var isAnimated:bool=false

func _process(delta: float) -> void:
	if $note.isPlayerClose and Input.is_action_just_pressed("interact"):
		enter()

func  enter():
	open()
	$TimeToEnter.start()
	%Player.speed=0
	%Player.visible=false
	if %Player.isLightOn:
		%Player.changeLight()


func _on_time_to_enter_timeout() -> void:
	close()

func open():
	$Open.visible=true

func close():
	$Open.visible=false
