extends CharacterBody2D


const movespeed = 500
var bullet_speed = 2000
var offset_distance = 10
var bullet = preload("res://scenes/bullets/player_bullet.tscn")

func _physics_process(delta):
	var motion = Vector2()
	
	motion.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	motion.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	motion = motion.normalized()
	
	var collision = move_and_collide(motion * movespeed * delta)
	if collision:
		velocity = velocity.slide(collision.get_normal())
	
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("LMB"):
		fire()

func fire():
	var bullet_instance = bullet.instantiate()
	bullet_instance.position = get_global_position() + Vector2(offset_distance, 0).rotated(rotation)
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.linear_velocity = Vector2(bullet_speed,0).rotated(rotation)
	get_tree().get_root().call_deferred("add_child", bullet_instance)
	
