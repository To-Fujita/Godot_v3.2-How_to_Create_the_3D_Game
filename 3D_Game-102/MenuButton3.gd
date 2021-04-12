extends MenuButton

export (String) var PlayerFlag
var popup
var temp


func _ready():
	popup = get_popup()
	popup.connect("id_pressed", self, "_on_MenuButton3_pressed")


func _on_MenuButton3_pressed(ID):
	var Selected_ID = popup.get_item_text(ID)
	temp = get_node(".")
	match Selected_ID:
		"BOY":
			PlayerFlag = "BOY"
		"GIRL":
			PlayerFlag = "GIRL"
		"PUPPY":
			PlayerFlag = "PUPPY"
		_:
			PlayerFlag = "BOY"
	
	get_node("../Label").text = PlayerFlag
	
