extends Node

var max_health = 100
var health = 0
var body_damage = 10
var bullet_speed = 400
var bullet_penetration = 1
var bullet_damage = 5
var reload = 2
var move_speed = 200

func set_max_health(new_max_health):
	max_health = new_max_health
	
func set_health(new_health):
	health = new_health
	
func set_body_damage(new_body_damage):
	body_damage = new_body_damage
	
func set_bullet_speed(new_bullet_speed):
	bullet_speed = new_bullet_speed
	
func set_bullet_penetration(new_bullet_penetration):
	bullet_penetration = new_bullet_penetration
	
func set_bullet_damage(new_bullet_damage):
	bullet_damage = new_bullet_damage
	
func set_reload(new_reload):
	reload = new_reload
	
func set_move_speed(new_move_speed):
	move_speed = new_move_speed
	
