extends Node
# Initialize

export (int) var MZ_x
export (int) var MZ_y
export (int) var Start_flag
export (int) var End_flag
export (int) var Goal_flag
export (String) var SoundFlag
export (String) var PlayerFlag
var Temp


func _ready():
	MZ_x = 0
	MZ_y = 0
	Start_flag = 0
	End_flag = 0
	Goal_flag = 0
	SoundFlag = "OFF"
	PlayerFlag = "BOY"

