extends Node2D


var TEMP = []


func _ready():
	pass


func Create_Maze(ROOM, MZ_X, MZ_Y):
	var P_size = 4
	var Offset_X = 10
	var Offset_Y = 10
	var Scale = 1
	var Wall_org = load("res://Sprite_DG.tscn")
	var Floor_org = load("res://Sprite_WT.tscn")
	var Player_org = load("res://Sprite_RD.tscn")
	var Goal_org = load("res://Sprite_OR.tscn")
	TEMP = ROOM
	var MZ_x = MZ_X
	var MZ_y = MZ_Y
	if MZ_x > MZ_y:
		Scale = (100 / MZ_x)
	else:
		Scale = (100 / MZ_y)
#	Scale = 2.0
	Offset_X = int(100 - MZ_x * Scale) * 2 + 20
	Offset_Y = int(100 - MZ_y * Scale) * 2 + 20
#	print(MZ_x, MZ_y, TEMP)
	for i in range(MZ_y):
		for j in range(MZ_x):
			if TEMP[i][j] == "F":
				var Floor = Floor_org.instance()
				add_child(Floor)
				Floor.scale = Vector2(Scale, Scale)
				Floor.position = Vector2(j * P_size * Scale + Offset_X, i * P_size * Scale + Offset_Y)
			if TEMP[i][j] == "W":
				var Wall = Wall_org.instance()
				add_child(Wall)
				Wall.scale = Vector2(Scale, Scale)
				Wall.position = Vector2(j * P_size * Scale + Offset_X, i * P_size * Scale + Offset_Y)
			if TEMP[i][j] == "P":
				var Player = Player_org.instance()
				add_child(Player)
				Player.scale = Vector2(Scale, Scale)
				Player.position = Vector2(j * P_size * Scale + Offset_X, i * P_size * Scale + Offset_Y)
			if TEMP[i][j] == "G":
				var Goal = Goal_org.instance()
				add_child(Goal)
				Goal.scale = Vector2(Scale, Scale)
				Goal.position = Vector2(j * P_size * Scale + Offset_X, i * P_size * Scale + Offset_Y)
	
	
