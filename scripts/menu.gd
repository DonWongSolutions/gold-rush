extends Control

var bus_idx = AudioServer.get_bus_index("Master")
@onready var popup_menu_node: Node = $inGameUI/popupMenu # Ensure this path points to the node with popup_menu.gd
@onready var help_menu_container: MarginContainer = $helpMenuContainer

func toggle_visibility(object):
	if object.visible:
		object.visible = false
	else:
		object.visible = true

func _ready() -> void:
	AudioServer.set_bus_mute(bus_idx, false)

func _on_start_button_pressed() -> void:
	AudioServer.set_bus_mute(bus_idx, false)
	get_tree().change_scene_to_file("res://scenes/levelselector.tscn")

func _on_options_button_pressed() -> void:
	toggle_visibility(help_menu_container)
	
func _on_help_menu_close_button_pressed() -> void:
	toggle_visibility(help_menu_container)
	print("pressed close button in main menu")

func _on_quit_button_pressed() -> void:
	get_tree().quit()
