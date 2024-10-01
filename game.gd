extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("DisplayServer.window_get_size() - ", DisplayServer.window_get_size())
	#print(Globals.pixWidth)
	#get_viewport().get_visible_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
