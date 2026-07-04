extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Player) -> void:
	if(body is Player):
		body.playerInSmokeyFOV = true


func _on_area_2d_body_exited(body: Player) -> void:
	if(body is Player):
		body.playerInSmokeyFOV = false
