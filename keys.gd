extends Node2D
var nbKeyToRemove:int=0

func _ready() -> void:
	for i in nbKeyToRemove:
		%CanvasLayer.removeKey()

func _on_timer_timeout() -> void:
	var random=RandomNumberGenerator.new().randi_range(0,get_child_count()-2)
	print('random :')
	print(random)
	#get_child(random).queue_free()
	#print(get_children()[random])
	get_children()[random].queue_free()
