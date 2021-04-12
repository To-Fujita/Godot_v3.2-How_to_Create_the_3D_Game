extends MenuButton
# Set the Size of Maze

export (int) var MZ_x
export (int) var MZ_y
var popup
var rng = RandomNumberGenerator.new()

func _ready():
	MZ_x = 9
	MZ_y = 11
	popup = get_popup()
	popup.connect("id_pressed", self, "_on_item_pressed")


func _on_item_pressed(ID):
	var Selected_ID = popup.get_item_text(ID)
	var temp = get_node(".")
	match Selected_ID:
		"9 x 11":
			MZ_x = 9
			MZ_y = 11
		"11 x 15":
			MZ_x = 11
			MZ_y = 15
		"15 x 15":
			MZ_x = 15
			MZ_y = 15
		"15 x 21":
			MZ_x = 15
			MZ_y = 21
		"21 x 25":
			MZ_x = 21
			MZ_y = 25
		"25 x 25":
			MZ_x = 25
			MZ_y = 25
		"25 x 31":
			MZ_x = 25
			MZ_y = 31
		"31 x 35":
			MZ_x = 31
			MZ_y = 35
		"35 x 35":
			MZ_x = 35
			MZ_y = 35
		_:
			rng.randomize() 
			MZ_x = 9 + int(rng.randi_range(0, 15)) * 2
			MZ_y = 9 + int(rng.randi_range(0, 20)) * 2
	temp.MZ_x = MZ_x
	temp.MZ_y = MZ_y
	get_node("../Label0").text = "Selected: " + String(temp.MZ_x) + " x " + String(temp.MZ_y)

