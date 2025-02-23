extends Node2D

class_name UpgradeCardSlot

var card_scene = preload("res://scenes/cards/upgrade_card.tscn")

var max_health_card_scene = preload("res://scenes/cards/max_health_card.tscn")
var body_damage_card_scene = preload("res://scenes/cards/body_damage_upgrade_card.tscn")
var bullet_speed_card_scene = preload("res://scenes/cards/bullet_speed_upgrade_card.tscn")
var bullet_penetration_scene = preload("res://scenes/cards/bullet_penetration_upgrade_card.tscn")
var bullet_damage_scene = preload("res://scenes/cards/bullet_damage_upgrade_card.tscn")
var reload_scene = preload("res://scenes/cards/reload_upgrade_card.tscn")
var move_speed_scene = preload("res://scenes/cards/move_speed_upgrade_card.tscn")

var cur_card : UpgradeCard

var all_cards = [max_health_card_scene, body_damage_card_scene, bullet_speed_card_scene, bullet_penetration_scene, bullet_damage_scene, reload_scene, move_speed_scene]

# Called when the node enters the scene tree for the first time.
func _ready():
	# Figure out how to connect a signal to the upgrade function instead of using a hard reference name
	reload()

func upgrade(upgrade_stat):
	var upgraded = false
	
	match upgrade_stat:
		"max_health":
			upgraded = PlayerVariables.upgrade_max_health()
		"body_damage":
			upgraded = PlayerVariables.upgrade_body_damage()
		"bullet_speed":
			upgraded = PlayerVariables.upgrade_bullet_speed()
		"bullet_penetration":
			upgraded = PlayerVariables.upgrade_bullet_penetration()
		"bullet_damage":
			upgraded = PlayerVariables.upgrade_bullet_damage()
		"reload":
			upgraded = PlayerVariables.upgrade_reload()
		"move_speed":
			upgraded = PlayerVariables.upgrade_move_speed()
		_: # default
			print("No upgrade found, maybe a typo?")
			assert(false)
		
	if upgraded:
		reload()

func reload():
	if cur_card:
		cur_card.queue_free()	
	
	cur_card = all_cards[randi() % all_cards.size()].instantiate()
	add_child(cur_card)
