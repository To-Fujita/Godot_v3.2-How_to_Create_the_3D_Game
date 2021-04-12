extends Button
# Select Sound Effect ON/OFF

export (String) var SoundFlag


func _ready():
	pass


func _on_Button_00_pressed():
	if SoundFlag == "ON":
		SoundFlag = "OFF"
	else:
		SoundFlag = "ON"
	get_node("../Label").text = SoundFlag

