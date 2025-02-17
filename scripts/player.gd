extends CharacterBody2D

class_name Player

var offset_distance = 10
var time_since_last_shot = 1 # always starting able to shoot

var bullet = preload("res://scenes/bullets/player_bullet.tscn")

func _physics_process(delta):
	var motion = Vector2()
	
	motion.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	motion.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	motion = motion.normalized()
	
	var collision = move_and_collide(motion * PlayerVariables.move_speed * delta)
	if collision:
		velocity = velocity.slide(collision.get_normal())
	
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("LMB") && time_since_last_shot > (1.0/PlayerVariables.reload):
		time_since_last_shot = 0
		fire()
	else:
		time_since_last_shot += delta
		if time_since_last_shot < 0: # if it overflowed for some reason
			time_since_last_shot = 1

func fire():
	var bullet_instance = bullet.instantiate()
	
	bullet_instance.penetration = PlayerVariables.bullet_penetration
	bullet_instance.damage = PlayerVariables.bullet_damage
	
	bullet_instance.position = get_global_position() + Vector2(offset_distance, 0).rotated(rotation)
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.linear_velocity = Vector2(PlayerVariables.bullet_speed,0).rotated(rotation)
	get_tree().get_root().call_deferred("add_child", bullet_instance)
	
func take_damage(damage_val):
	print("ouch")
	PlayerVariables.set_health(PlayerVariables.health - damage_val)
	if PlayerVariables.health <= 0:
		print("player died")
		get_tree().reload_current_scene()
	

func _on_area_2d_body_entered(body):
	if "Enemy" in body.name:
		body.take_damage(PlayerVariables.body_damage)
		
