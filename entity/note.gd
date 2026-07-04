extends Area2D
@export var text:String
@export var frame:int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_child(frame).visibility=true
