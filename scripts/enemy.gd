extends CharacterBody2D

class_name Enemy

var max_health = 1;
var health = 0;

func _ready():
	health = max_health

func take_damage(damage_val):
	health -= damage_val
	if(health <= 0):
		queue_free()

func get_type():
	return "enemy"
