extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	animated_sprite.modulate = Color.ORANGE
	animated_sprite.play("default")
