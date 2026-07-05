extends CharacterBody2D


const SPEED = 2048.0
var direction = "down"
var onScreen:bool=false
var surprised:bool=false
var move:Vector2 = Vector2.ZERO
var nbAction = 0
var actionTime = 0

@export var actions : Array[String] = ["look_down"]
@export var actionsTimes : Array[int] = [1]

var anger:float=0 # si elle monte a 10 die()


func _process(_delta: float) -> void:
	if onScreen and %Player.isLightOn:
		$AnimatedSprite2D.play("surprised")
		if $Timer.is_stopped():
			$Timer.start()
			$SfxrStreamPlayer2D.play()
		anger+=_delta*35
		if anger>10:
			Global.causeOfDeath="Smokey is sensible to the smoke of your matches.\nTurn off the lights when he is near."
			%Player.die()
	else:
		anger-=_delta*2

func _physics_process(delta: float) -> void:
		velocity = delta * SPEED * move
		move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body is Player):
		body.playerInSmokeyFOV = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if(body is Player):
		body.playerInSmokeyFOV = false

func look_up():
	direction = "up"
	$NextAction.start()
	$AnimatedSprite2D.play("back")
	$Area2D.rotation = PI

func look_down():
	direction = "down"
	$NextAction.start()
	$AnimatedSprite2D.play("front")
	$Area2D.rotation = 0
	
func look_left():
	direction = "left"
	$NextAction.start()
	$AnimatedSprite2D.play("left")
	$AnimatedSprite2D.flip_h=false
	$Area2D.rotation = PI/2
	
func look_right():
	direction = "right"
	$NextAction.start()
	$AnimatedSprite2D.play("left")
	$AnimatedSprite2D.flip_h=true
	$Area2D.rotation = -PI/2
	
func go_up():
	look_up()
	trigger_move()
	
func go_down():
	look_down()
	trigger_move()
	
func go_left():
	look_left()
	trigger_move()
	
func go_right():
	look_right()
	trigger_move()
	
func trigger_move():
	match direction:
		"down":
			move = Vector2.DOWN
		"up":
			move = Vector2.UP
		"left":
			move = Vector2.LEFT
		"right":
			move = Vector2.RIGHT
	$Walk.start()

func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	onScreen=true


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	onScreen=false


func _on_timer_timeout() -> void:
	if %Player.isLightOn:
		print("you died")
		%Player.die()
	else:
		print("you survived")


func _on_next_action_timeout() -> void:
	Callable(self, actions[nbAction]).call()
	actionTime += 1
	if(actionTime == actionsTimes[nbAction]):
		nbAction = (nbAction + 1) % actions.size()
		actionTime = 0


func _on_walk_timeout() -> void:
	move = Vector2.ZERO
