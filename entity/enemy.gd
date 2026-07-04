extends CharacterBody2D


const SPEED = 600.0
var direction = "down"
var onScreen:bool=false
var surprised:bool=false
var move:Vector2 = Vector2.ZERO
var nbAction = 0
@export var actions = ["look_down"]

func _process(_delta: float) -> void:
	$AnimatedSprite2D.play("front")
	if onScreen and %Player.isLightOn:
		$AnimatedSprite2D.play("surprised")
		if $Timer.is_stopped():
			$Timer.start()

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

func look_down():
	direction = "down"
	$NextAction.start()
	
func look_left():
	direction = "left"
	$NextAction.start()
	
func look_right():
	direction = "right"
	$NextAction.start()
	
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
	if %Player.playerHidden==0:
		print("you died")
		%Player.die()
	else:
		print("you survived")


func _on_next_action_timeout() -> void:
	Callable(self, actions[nbAction]).call()
	nbAction = (nbAction + 1) % actions.size()


func _on_walk_timeout() -> void:
	move = Vector2.ZERO
