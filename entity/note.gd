extends Area2D
@export var text:String
@export var frame:int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_child(frame).visible=true
	$Label.text=text



func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		$Label.visible=true




func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		$Label.visible=false
