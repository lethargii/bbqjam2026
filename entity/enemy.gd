extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction = "down"


func _physics_process(delta: float) -> void:
	pass


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
