extends CharacterBody2D

@export var speed: int = 200
const MOVE_DISTANCE: int = 16

func _physics_process(_delta: float) -> void:
	#var vertical: float = Input.get_axis("up", "down")
	#var horizontal: float = Input.get_axis("left", "right")
	if Input.is_action_just_pressed("up"):
		position.y = position.y - MOVE_DISTANCE
	if Input.is_action_just_pressed("down"):
		position.y = position.y + MOVE_DISTANCE
	if Input.is_action_just_pressed("left"):
		position.x = position.x - MOVE_DISTANCE
	if Input.is_action_just_pressed("right"):
		position.x = position.x + MOVE_DISTANCE
	
	#velocity = Vector2(horizontal, vertical).normalized() * speed
	
	#move_and_slide()
