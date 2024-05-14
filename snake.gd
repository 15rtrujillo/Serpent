extends Node2D

@export var speed: float = 100.0

var body: Array[Area2D] = []
var direction: Vector2 = Vector2.UP
var to_turn: Vector2 = Vector2.UP
var can_move: bool = true

func _ready():
	body.append($Head)
	body.append($Tail)

func _process(delta):
	if not can_move:
		return	
	
	if Input.is_action_pressed("move_up"):
		to_turn = Vector2.UP
	if Input.is_action_pressed("move_down"):
		to_turn = Vector2.DOWN
	if Input.is_action_pressed("move_right"):
		to_turn = Vector2.RIGHT
	if Input.is_action_pressed("move_left"):
		to_turn = Vector2.LEFT
		
	if to_turn != -direction:
		direction = to_turn

	var head = body[0]
	var old_head_position = head.global_position
	var new_head_position = old_head_position + direction * speed * delta
	new_head_position.x = round(new_head_position.x)
	new_head_position.y = round(new_head_position.y)
	
	var pos_delta = new_head_position - old_head_position
	head.global_position = new_head_position
	print(head.global_position)

func change_color(color: Color):
	pass

func _on_tongue_timer_timeout():
	$TongueTimer.wait_time = randf_range(2.5, 6.0)
	$Head/AnimatedSprite2D.play()


func _on_movement_timer_timeout():
	pass # Replace with function body.
