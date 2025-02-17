extends RigidBody2D

class_name PlayerBullet

@onready var _animated_sprite = %AnimatedSprite2D

@export var speed: int # We use speed when spawning the bullet, so we never actually use it here
@export var penetration: int
@export var damage: int

# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_sprite.play("blink")


func _on_area_2d_body_entered(body):
	if body is Enemy:
		body.take_damage(damage)
		penetration -= 1
		if(penetration <= 0):
			queue_free()
	elif "Wall" in body.name:
		queue_free()
