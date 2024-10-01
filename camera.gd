extends Camera2D

var player: CharacterBody2D

#@onready var stretch_scale: Vector2 = get_viewport_transform().get_scale()
var window_width: int
var window_height: int

func _ready():
	player = get_node("../Player")
	window_width = get_viewport_rect().size[0]
	window_height = get_viewport_rect().size[1]
	set_anchor_mode(ANCHOR_MODE_FIXED_TOP_LEFT)
	set_initial_camera_limits()
	print(player.get_global_position())
	print(str("viewport rect = ", get_viewport_rect().size))
	print(str("viewport width = ", get_viewport_rect().size[0]))


func _process(_delta: float) -> void:
	update_screen()
	
func update_screen():
	var limit_left: int = get_limit(SIDE_LEFT)
	var limit_right: int = get_limit(SIDE_RIGHT)
	var limit_top: int = get_limit(SIDE_TOP)
	var limit_bottom: int = get_limit(SIDE_BOTTOM)
	var player_pos: Vector2 = player.get_global_position()
	var do_offset: bool = false
	
	if player_pos[0] > get_limit(SIDE_RIGHT):
		limit_right += window_width
		limit_left += window_width
		do_offset = true
	elif player_pos[0] < get_limit(SIDE_LEFT):
		limit_right -= window_width
		limit_left -= window_width
		do_offset = true
	elif player_pos[1] > get_limit(SIDE_BOTTOM):
		limit_top += window_height
		limit_bottom += window_height
		do_offset = true
	elif player_pos[1] < get_limit(SIDE_TOP):
		limit_top -= window_height
		limit_bottom -= window_height
		do_offset = true
	
	if do_offset:
		set_limit(SIDE_RIGHT, limit_right)
		set_limit(SIDE_BOTTOM, limit_bottom)
		set_limit(SIDE_LEFT, limit_left)
		set_limit(SIDE_TOP, limit_top)
		self.position = Vector2i(limit_left, limit_top)
		print("self.position - ", self.position)
		

	#var s_right: int = get_limit(SIDE_RIGHT)
	#var s_top: int = get_limit(SIDE_TOP)
	#if player.get_global_position()[0] > s_right:
		#
		#print("right side hit")
	#elif  player.get_global_position()[0] < s_left:
		#set_offset(Vector2i(s_right,s_top))
		#set_limit(SIDE_LEFT, s_left - window_widht)
		#print("no side - ", get_limit(SIDE_TOP))

func set_initial_camera_limits():
	set_limit(SIDE_RIGHT, window_width)
	set_limit(SIDE_BOTTOM, window_height)
	set_limit(SIDE_LEFT, 0)
	set_limit(SIDE_TOP, 0)
	print("get_offset() - ", get_offset())
