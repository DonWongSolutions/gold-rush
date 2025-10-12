extends StaticBody2D
@onready var dark_mode_bg: TileMap = $"DarkMode BG"
@onready var light_mode_bg: TileMap = $"LightMode BG"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	light_mode_bg.z_index = 2



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
