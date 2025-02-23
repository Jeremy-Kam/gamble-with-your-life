extends Node

var level = 1
var level_powers = [10, 20, 100, 200]

const game = preload("res://scenes/game.tscn")
const upgrade_menu = preload("res://scenes/upgrade_menu.tscn")

func get_level_power():
	return level_powers[level]
	
