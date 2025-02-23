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
	
func upgrade_max_health() -> bool:
	if(health > 20):
		max_health += 10
		health -= 20
		print_all_stats()
		return true
	else:
		return false

func set_health(new_health):
	health = new_health
	
func set_body_damage(new_body_damage):
	body_damage = new_body_damage
	
func upgrade_body_damage() -> bool:
	if(health > 10):
		body_damage += 3
		health -= 10
		print_all_stats()
		return true
	else:
		return false
	
func set_bullet_speed(new_bullet_speed):
	bullet_speed = new_bullet_speed

func upgrade_bullet_speed() -> bool:
	if(health > 15):
		bullet_speed += 50
		health -= 15
		print_all_stats()
		return true
	else:
		return false
	
func set_bullet_penetration(new_bullet_penetration):
	bullet_penetration = new_bullet_penetration
	
func upgrade_bullet_penetration() -> bool:
	if(health > 40):
		bullet_penetration += 1
		health -= 40
		print_all_stats()
		return true
	else:
		return false

func set_bullet_damage(new_bullet_damage):
	bullet_damage = new_bullet_damage
	
func upgrade_bullet_damage() -> bool:
	if(health > 25):
		bullet_damage += 1
		health -= 25
		print_all_stats()
		return true
	else:
		return false
		
func set_reload(new_reload):
	reload = new_reload

func upgrade_reload() -> bool:
	if(health > 35):
		reload += 1
		health -= 35
		print_all_stats()
		return true
	else:
		return false

func set_move_speed(new_move_speed):
	move_speed = new_move_speed

func upgrade_move_speed() -> bool:
	if(health > 30):
		move_speed += 20
		health -= 30
		print_all_stats()
		return true
	else:
		return false

func reroll() -> bool:
	if(health > 5):
		health -= 5
		print_all_stats()
		return true
	else:
		return false

func print_all_stats():
	print("Max health: ", max_health)
	print("Health: ", health)
	print("Body Damage: ", body_damage)
	print("Bullet Speed: ", bullet_speed)
	print("Bullet Penetration: ", bullet_penetration)
	print("Bullet Damage: ", bullet_damage)
	print("Reload: ", reload)
	print("Move Speed: ", move_speed)
	print("\n")
