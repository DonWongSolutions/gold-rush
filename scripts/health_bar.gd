extends ProgressBar

# Get references to the Label nodes
@onready var coins_label: Label = $Label
@onready var attempts_label: Label = $Label2
@onready var missiontext: Label = $Label4
@onready var multiplier: Label = $multiplier

func _process(delta: float) -> void:
	# 1. Update the ProgressBar value
	self.value = Global.health 

	# 2. Update the Coins Label
	coins_label.text = "Coins: " + str(Global.score)
	
	# 3. Update the Attempts Label
	attempts_label.text = "Attempts: " + str(Global.attempts)
	multiplier.text = "Multiplier: x" + str(Global.scoremultiplier) + "(Uses Left: " + str(Global.multiplieruses) + ")"
	missiontext.text = "Mission: " + str(Global.mission)
	
	
	# Check if health is zero and queue for deletion
	if self.value == 0:
		queue_free()
