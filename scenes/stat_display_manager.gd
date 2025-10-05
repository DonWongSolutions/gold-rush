extends VBoxContainer

@onready var coin_display = $coinsDisplay
@onready var attempts_display = $attemptsDisplay

# Assuming 'Global' is an autoload script
func _process(delta):
	update_text()

func update_text():
	coin_display.text = "COINS: " + str(Global.score)
	attempts_display.text = "ATTEMPTS: " + str(Global.attempts)
