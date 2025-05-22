class_name Head extends BodyPart

@onready var _animatedSprite2D: AnimatedSprite2D = $AnimatedSprite2D
@onready var _tongueTimer: Timer = $TongueTimer

var changing_direction: bool = false

func _ready():
	area_entered.connect(_on_area_entered)
	_tongueTimer.timeout.connect(_on_tongue_timer_timeout)

func change_color(color: Color):
	_animatedSprite2D.modulate = color
	
func _on_area_entered(area: Area2D):
	print(area.name, " entered the snake's head")
	
func _on_tongue_timer_timeout():
	_tongueTimer.wait_time = randf_range(2.5, 6.0)
	_animatedSprite2D.play()
