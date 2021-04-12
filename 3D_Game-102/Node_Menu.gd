extends Node
# Main Menu

export (int) var MZ_x
export (int) var MZ_y
export (int) var Start_time
export (int) var Start_flag
export (int) var End_flag
export (int) var Goal_flag
export (String) var SoundFlag
export (String) var PlayerFlag
export (Array, Array, String) var ROOM = []
var Temp


func _ready():
	$Spatial.hide()
	$Spatial/Label.hide()
	$Spatial/JoyStick.hide()
	$Button_02.hide()
	$Spatial/Label_Time.hide()
	Temp = get_node("Control/VBoxContainer/Button_01").connect("pressed", self, "NewGame")
	Temp = get_node("Control/VBoxContainer/Button_02").connect("pressed", self, "Quit")



func NewGame():
	Temp = get_node("Control/VBoxContainer/VBoxContainer/MenuButton")
	MZ_x = Temp.MZ_x
	MZ_y = Temp.MZ_y
	End_flag = 0
	Start_flag = 0
	Goal_flag = 0
	
	var n = randi() % 10
#	print(n)

	if n > 5:
		ROOM = get_node("Spatial/Node_Maze").maze_C(MZ_y, MZ_x)
#		print("Maze_C")
	else:
		ROOM = get_node("Spatial/Node_Maze").maze_D(MZ_y, MZ_x)
#		print("Maze_D")
	
#	$WindowDialog2/Node2D_WIN.Create_Maze(ROOM, MZ_x, MZ_y)
#	$WindowDialog2.show()
	$Spatial/KinematicBody_Player.Initialize_Player()
	$Spatial/Label.hide()
	$Control.hide()
	$Spatial.GameStart()
	$Spatial.show()
	$Spatial/JoyStick.show()
	$Button_02.show()
	$Spatial/Label_Time.show()
	

func Quit():
	get_tree().quit()
	
	
