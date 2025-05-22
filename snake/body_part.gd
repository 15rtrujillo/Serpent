class_name BodyPart extends Area2D

var can_move: bool = true
var direction: Vector2 = Vector2.UP

func move(speed: float):
	if not can_move:
		return
		
	var old_position: Vector2 = global_position.round()
	
	# Get the projected position of the head rounded to an int
	var new_position: Vector2 = old_position + direction * speed
	new_position.x = round(new_position.x)
	new_position.y = round(new_position.y)
	
	# Move the part
	global_position = new_position

func change_color(color: Color):
	modulate = color

func change_direction(to_turn: Vector2):
	direction = to_turn
	if direction == Vector2.UP:
		rotation = 0
	elif direction == Vector2.RIGHT:
		rotation = PI / 2
	elif direction == Vector2.DOWN:
		rotation = PI
	elif direction == Vector2.LEFT:
		rotation = 3 * PI / 2

func is_on_point(point: Vector2, tolerance: float = 1.0) -> bool:
	var dx: float = abs(global_position.x - point.x)
	var dy: float = abs(global_position.y - point.y)
	
	return (dx < tolerance) and (dy < tolerance)
	
func _is_aligned_x() -> bool:
	return int(global_position.x) % 25 == 0 and not int(global_position.x) % 50 == 0

func _is_aligned_y() -> bool:
	return int(global_position.y) % 25 == 0 and not int(global_position.y) % 50 == 0
	
func can_turn(to_turn: Vector2) -> bool:
	if to_turn == direction or to_turn == -direction:
		return false
	elif to_turn == Vector2.UP or to_turn == Vector2.DOWN:
		return _is_aligned_x()
	elif to_turn == Vector2.RIGHT or to_turn == Vector2.LEFT:
		return _is_aligned_y()
	return false
