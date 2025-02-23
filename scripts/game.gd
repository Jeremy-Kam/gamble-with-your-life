extends Node2D

var basic_enemy_scene = preload("res://scenes/enemies/basic_enemy.tscn")

@onready var player = $Player
@onready var spawn_positions = $SpawnPositions

var cur_level_power

func _ready():
	# TODO this is not correct
	PlayerVariables.set_health(PlayerVariables.max_health)
	cur_level_power = GameManager.get_level_power()
	randomize()

func _on_timer_timeout():
	# Once we run out of power level, stop spawning enemies. Once all enemies are gone from the scene, continue
	if(cur_level_power <= 0):
		if get_children_of_type("enemy").size() <= 0:
			get_tree().reload_current_scene()
		else:
			return
	
	var enemy = basic_enemy_scene.instantiate()
	cur_level_power -= 1
	
	enemy.global_position = player.global_position
	
	var positions = get_spawn_positions()
	
	while enemy.global_position.distance_squared_to(player.global_position) < 500000:
		enemy.global_position = positions[randi() % positions.size()]
	
	add_child(enemy)

func get_spawn_positions():
	var positions = []

	for marker in spawn_positions.get_children():  # Iterate over child nodes
		if marker is Marker2D:  # Check if it's a Marker2D node
			positions.append(marker.global_position)  # Store the global position

	return positions

# Function to get all children of a certain type
func get_children_of_type(target_type: String) -> Array:
	var matching_children: Array = []
	
	for child in get_children():
		if child is Object and child.has_method("get_type") and child.get_type() == target_type:
			matching_children.append(child)
	
	return matching_children
