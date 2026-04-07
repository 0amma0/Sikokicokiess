extends Button

@onready var btnsound: AudioStreamPlayer = $btnsound
# Called when the node enters the scene tree for the first time.
func _ready():
	btnsound.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	print("BUTTON DIPENCET")
	btnsound.play()
