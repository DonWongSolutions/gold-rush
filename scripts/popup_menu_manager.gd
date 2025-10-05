extends MarginContainer

@export var menu_Screen: VBoxContainer
@export var open_menu_screen: VBoxContainer
@export var help_menu_screen: MarginContainer

var bus_idx = AudioServer.get_bus_index("Master")

func toggle_visibility(object):
	if object.visible:
		object.visible = false
	else:
		object.visible = true	

func _on_toggle_button_menu_pressed() -> void:
	toggle_visibility(menu_Screen)
	toggle_visibility(open_menu_screen)
	AudioServer.set_bus_mute(bus_idx, false) # or false
	get_tree().paused = false


func _on_menu_open_button_pressed() -> void:
	toggle_visibility(open_menu_screen)
	toggle_visibility(menu_Screen)
	AudioServer.set_bus_mute(bus_idx, true) # or false
	get_tree().paused = true


func _on_help_menu_close_button_pressed() -> void:
	toggle_visibility(help_menu_screen)
	toggle_visibility(menu_Screen)


func _on_help_button_pressed() -> void:
	toggle_visibility(help_menu_screen)
	toggle_visibility(menu_Screen)


func _on_pause_button_pressed() -> void:
	print("Game Reset, Score: " + str(Global.score) + " Attempts: " + str(Global.attempts))
	Global.score = 0
	Global.attempts = 0
	get_tree().paused = false
	AudioServer.set_bus_mute(bus_idx, false)
	get_tree().reload_current_scene()


func _on_quit_button_pressed() -> void:
	AudioServer.set_bus_mute(bus_idx, true)
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	
func _mainmenucall_help() -> void:
	toggle_visibility(help_menu_screen)
	
