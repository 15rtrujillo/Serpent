class_name snake extends Node2D

@export var speed: float = 100.0

var body: Array[Area2D] = []
var direction: Vector2 = Vector2.UP
var to_turn: Vector2 = Vector2.UP
var can_move: bool = true

func _ready():
	body.append($Head)
	body.append($Body)
	body.append($Tail)

func _process(delta: float):
	if not can_move:
		return	
	
	# Determine which direction we're supposed to turn based on input
	if Input.is_action_pressed("move_up"):
		to_turn = Vector2.UP
	if Input.is_action_pressed("move_down"):
		to_turn = Vector2.DOWN
	if Input.is_action_pressed("move_right"):
		to_turn = Vector2.RIGHT
	if Input.is_action_pressed("move_left"):
		to_turn = Vector2.LEFT

	# Get the current position of the head rounded to the nearest int
	var head: Area2D = body[0]
	var old_head_position: Vector2 = head.global_position.round()
	
	# Get the projected position of the head rounded to an int
	var new_head_position: Vector2 = old_head_position + direction * speed * delta
	new_head_position.x = round(new_head_position.x)
	new_head_position.y = round(new_head_position.y)
	
	# var pos_delta: Vector2 = new_head_position - old_head_position
	
	# Move the head
	head.global_position = new_head_position
	
	if to_turn != -direction:
		var is_aligned_x: bool = int(new_head_position.x) % 25 == 0 and not int(new_head_position.x) % 50 == 0
		var is_aligned_y: bool = int(new_head_position.y) % 25 == 0 and not int(new_head_position.x) % 50 == 0
		if (to_turn == Vector2.UP or to_turn == Vector2.DOWN) and is_aligned_x:
			direction = to_turn
		elif (to_turn == Vector2.RIGHT or to_turn == Vector2.LEFT) and is_aligned_y:
			direction = to_turn
	
	# print(head.global_position)

func change_color(color: Color):
	pass

func _on_tongue_timer_timeout():
	$TongueTimer.wait_time = randf_range(2.5, 6.0)
	$Head/AnimatedSprite2D.play()


func _on_movement_timer_timeout():
	pass # Replace with function body.
