class_name Snake extends Node2D

@export var speed: float = 100.0

var body: Array[BodyPart] = []
var to_turn: Vector2 = Vector2.UP
var direction_changes: Dictionary = {}
var can_move: bool = true

func _ready():
	body.append($Head)
	body.append($Body)
	body.append($Tail)
	
func _unhandled_key_input(event):
	if not event is InputEventKey:
		return
	
	if event.is_action_pressed("move_up"):
		to_turn = Vector2.UP
	if event.is_action_pressed("move_down"):
		to_turn = Vector2.DOWN
	if event.is_action_pressed("move_right"):
		to_turn = Vector2.RIGHT
	if event.is_action_pressed("move_left"):
		to_turn = Vector2.LEFT

func _process(delta: float):
	for part: BodyPart in body:
		part.move(speed * delta)
		
		if part is Head:
			if part.can_turn(to_turn):
				print("Can turn")
				part.change_direction(to_turn)
				direction_changes[part.global_position] = to_turn
		else:
			var pos: Vector2 = part.global_position
			if pos in direction_changes.keys():
				part.change_direction(direction_changes[pos])
				if part.name == "Tail":
					direction_changes.erase(pos)

func change_color(color: Color):
	for part: BodyPart in body:
		part.change_color(color)
