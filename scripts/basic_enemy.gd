extends "res://scripts/enemy.gd"

class_name BasicEnemy

var speed = 100

func _physics_process(delta):
	var motion = Vector2()
	var Player = get_parent().get_node("Player")

	motion += (Vector2(Player.position) - position)
	look_at(Player.position)

	motion = motion.normalized() * speed
	move_and_collide(motion * delta)

func _on_area_2d_body_entered(body):
	if body is Player:
		body.take_damage(10)
