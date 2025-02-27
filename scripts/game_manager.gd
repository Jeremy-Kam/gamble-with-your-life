extends Node

var level = 1
var level_powers = [10, 20, 100, 200]

const game = "res://scenes/game.tscn"
const upgrade_menu = "res://scenes/upgrade_menu.tscn"

func get_level_power():
	return level_powers[level]
	
func switch_to_game():
	get_tree().change_scene_to_file(game)
	
func switch_to_upgrade_menu():
	get_tree().change_scene_to_file(upgrade_menu)
	PlayerVariables.set_health(PlayerVariables.max_health) # Replenish health when going into upgrade menu
