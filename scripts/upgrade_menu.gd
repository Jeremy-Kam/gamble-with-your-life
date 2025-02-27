extends Node2D

class_name UpgradeMenu

func reroll():
	var upgrade_slots = get_upgrade_slots()
	
	for card_slot in upgrade_slots:
		card_slot.reload()
		
	
func get_upgrade_slots():
	var slots = []

	for slot in get_children():  # Iterate over child nodes
		if slot is UpgradeCardSlot:  # Check if it's a UpgradeCardSlot node
			slots.append(slot)  # Store the card slot

	return slots


func _on_button_button_up():
	if PlayerVariables.reroll():
		reroll()


func _on_start_button_button_up():
	GameManager.switch_to_game()
