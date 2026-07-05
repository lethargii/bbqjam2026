extends Area2D
@export var text:String
@export var frame:int
var isPlayerClose:bool=false

func _ready() -> void:
	if frame!=-1:
		get_child(frame).visible=true
	$Label.text=text



func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		$Label.visible=true
		isPlayerClose=true




func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		$Label.visible=false
		isPlayerClose=false
