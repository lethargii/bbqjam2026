extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction = "down"
var onScreen:bool=false
var surprised:bool=false

func _process(_delta: float) -> void:
	$AnimatedSprite2D.play("front")
	if onScreen and %Player.isLightOn:
		$AnimatedSprite2D.play("surprised")
		if $Timer.is_stopped():
			$Timer.start()

func _on_area_2d_body_entered(body: Player) -> void:
	if(body is Player):
		body.playerInSmokeyFOV = true


func _on_area_2d_body_exited(body: Player) -> void:
	if(body is Player):
		body.playerInSmokeyFOV = false

func look_up():
	direction = "up"

func look_down():
	direction = "down"
	
func look_left():
	direction = "left"
	
func look_right():
	direction = "right"
	
func go_up():
	look_up()
	
func go_down():
	look_down()
	
func go_left():
	look_left()
	
func go_right():
	look_right()


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	onScreen=true


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	onScreen=false


func _on_timer_timeout() -> void:
	if %Player.playerHidden==0:
		print("you died")
		%Player.die()
	else:
		print("you survived")
