class_name Snake extends Node2D

@export var speed: float = 100.0

var body: Array[BodyPart] = []
var to_turn: Vector2 = Vector2.UP
var can_move: bool = true

func _ready():
	body.append($Head)
	body.append($Body)
	body.append($Tail)
	change_color(Color.AQUA)

func _process(delta: float):
	if not can_move:
		return	

	process_input()

	for part: BodyPart in body:
		move_body_part(part, delta)
	"""
	# Check that we aren't trying to turn 180
	if to_turn != -direction:
		var is_aligned_x: bool = int(new_head_position.x) % 25 == 0 and not int(new_head_position.x) % 50 == 0
		var is_aligned_y: bool = int(new_head_position.y) % 25 == 0 and not int(new_head_position.x) % 50 == 0
		
		if (to_turn == Vector2.UP or to_turn == Vector2.DOWN) and is_aligned_x:
			direction = to_turn
		elif (to_turn == Vector2.RIGHT or to_turn == Vector2.LEFT) and is_aligned_y:
			direction = to_turn
	
	# print(head.global_position)
	"""

func process_input():
	# Determine which direction we're supposed to turn based on input
	if Input.is_action_pressed("move_up"):
		to_turn = Vector2.UP
	if Input.is_action_pressed("move_down"):
		to_turn = Vector2.DOWN
	if Input.is_action_pressed("move_right"):
		to_turn = Vector2.RIGHT
	if Input.is_action_pressed("move_left"):
		to_turn = Vector2.LEFT
		
func move_body_part(part: BodyPart, delta: float):
	var old_position: Vector2 = part.global_position.round()
	
	# Get the projected position of the head rounded to an int
	var new_position: Vector2 = old_position + part.direction * speed * delta
	new_position.x = round(new_position.x)
	new_position.y = round(new_position.y)
	
	# Move the part
	part.global_position = new_position

func change_color(color: Color):
	for body_part: BodyPart in body:
		body_part.change_color(color)
