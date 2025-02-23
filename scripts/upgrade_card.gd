extends Node2D

class_name UpgradeCard

@onready var _animated_sprite = $AnimatedSprite2D

@export var upgrade_stat : String

signal upgraded_stat(upgrade_stat)

# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_sprite.play("front")

func _on_area_2d_mouse_entered():
	_animated_sprite.play("back")

func _on_area_2d_mouse_exited():
	_animated_sprite.play("front")

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		get_parent().upgrade(upgrade_stat)
		upgraded_stat.emit(upgrade_stat)
		
