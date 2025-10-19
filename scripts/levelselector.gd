extends Control
var bus_idx = AudioServer.get_bus_index("Master")

@onready var level_2_button = $Level_2
@onready var level_3_button = $Level_3
@onready var level_4_button = $Level_4
@onready var level_5_button = $Level_5
@onready var progresslabel: Label = $progresslabel
@onready var tokenslabel: Label = $tokenslabel

# The _input function checks for key presses outside of UI elements
func _input(event: InputEvent) -> void:
	# Check if the "bypass" keyset (you must define this in Project Settings -> Input Map) is pressed
	if event.is_action_pressed("bypass"):
		if Global.bypass == 0:
			Global.bypass = 1
			print("Bypass mode activated!")
		else:
			Global.bypass = 0
			print("Bypass mode deactivated.")
		
		# Immediately update the button states
		_update_button_lock()

func _lock_button(button: Button, level_number: int) -> void:
	if not button: return
	# Only disable the button, no visual style changes
	button.disabled = true
	button.text = "Level " + str(level_number) # Ensure text is correct for locked state
	
	# Cleanly remove all the visual overrides we added before
	button.remove_theme_color_override("font_color")
	button.remove_theme_color_override("font_color.disabled")
	button.remove_theme_stylebox_override("normal")
	button.remove_theme_stylebox_override("disabled")

func _unlock_button(button: Button, level_number: int) -> void:
	if not button: return
	button.disabled = false
	button.text = "Level " + str(level_number)
	button.remove_theme_color_override("font_color")
	button.remove_theme_color_override("font_color.disabled")
	button.remove_theme_stylebox_override("normal")
	button.remove_theme_stylebox_override("disabled")

func _update_button_lock() -> void:
	# Update the Progress Label to reflect the current status
	if Global.bypass == 1:
		progresslabel.text = "Progress: BYPASS ACTIVE"
		
		_unlock_button(level_2_button, 2)
		_unlock_button(level_3_button, 3)
		_unlock_button(level_4_button, 4)
		_unlock_button(level_5_button, 5)
		return
	else:
		progresslabel.text = ("Progress: Level " + str(Global.progress))

	if Global.progress < 1:
		_lock_button(level_2_button, 2)
	else:
		_unlock_button(level_2_button, 2)
		
	if Global.progress < 2:
		_lock_button(level_3_button, 3)
	else:
		_unlock_button(level_3_button, 3)

	if Global.progress < 3:
		_lock_button(level_4_button, 4)
	else:
		_unlock_button(level_4_button, 4)
		
	if Global.progress < 4:
		_lock_button(level_5_button, 5)
	else:
		_unlock_button(level_5_button, 5)

func _ready() -> void:
	_update_button_lock()
	tokenslabel.text = ("Tokens: " + str(Global.tokens))

func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_level_2_pressed() -> void:
	if Global.progress >= 1 or Global.bypass == 1:
		get_tree().change_scene_to_file("res://scenes/level2.tscn")
	
func _on_level_3_pressed() -> void:
	if Global.progress >= 2 or Global.bypass == 1:
		get_tree().change_scene_to_file("res://scenes/level3.tscn")

func _on_level_4_pressed() -> void:
	if Global.progress >= 3 or Global.bypass == 1:
		get_tree().change_scene_to_file("res://scenes/level4.tscn")

func _on_level_5_pressed() -> void:
	if Global.progress >= 4 or Global.bypass == 1:
		get_tree().change_scene_to_file("res://scenes/level5.tscn")
