extends AnimatedSprite2D

@onready var _animated_sprite = %AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_sprite.play("blink")
