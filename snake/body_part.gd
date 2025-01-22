class_name BodyPart extends Area2D

var direction: Vector2 = Vector2.UP
var to_turn: Vector2 = Vector2.UP

func change_color(color: Color):
	modulate = color
