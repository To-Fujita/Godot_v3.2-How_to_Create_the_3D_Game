extends Spatial
# Main Game Program

export (int) var MZ_x
export (int) var MZ_y
export (int) var Block_size = 2
export (int) var Start_flag
#	0: Idle
#	1: Start
#	2: Count
export (int) var End_flag
export (int) var Goal_flag
export (String) var SoundFlag
export (Array, Array, String) var ROOM = []
var Temp
var Temp_x
var Temp_z
var n = RandomNumberGenerator.new()


func _ready():
	pass


func GameStart():
	var Dart_org = load("res://KinematicBody_Dart.tscn")
	var Floor_org = load("res://KinematicBody_Floor.tscn")
	var Wall_org = load("res://KinematicBody_Wall.tscn")
	var Start = get_node("KinematicBody_Start")
	var Goal = get_node("Area_Goal")
	var Player = get_node("KinematicBody_Player")
	var Wanderer = get_node("KinematicBody_Wanderer")
	var Temp_ROOM = []
#	n.randomize()
	n = int(rand_range(0, 1) * 10)
#	print(n)
	
	Start_flag = 0
	Goal_flag = 0
	End_flag = 0
	ROOM = get_node("..").ROOM
	MZ_x = get_node("../Control/VBoxContainer/VBoxContainer/MenuButton").MZ_x
	MZ_y = get_node("../Control/VBoxContainer/VBoxContainer/MenuButton").MZ_y
	
	for y in range(MZ_y + 4):
		Temp_ROOM.append([])
		Temp_ROOM[y] = []
		for x in range(MZ_x + 4):
			Temp_ROOM[y].append([])
			if y < 2:
				Temp_ROOM[y][x] = "D"
			elif y >= MZ_y + 2:
				Temp_ROOM[y][x] = "D"
			elif x < 2:
				Temp_ROOM[y][x] = "D"
			elif x >= MZ_x + 2:
				Temp_ROOM[y][x] = "D"
			else:
				Temp_ROOM[y][x] = ROOM[y - 2][x - 2]
		
	for i in range(MZ_y + 4):
		for j in range(MZ_x + 4):
			if Temp_ROOM[i][j] == "D":
				var Dart = Dart_org.instance()
				add_child(Dart)
				Dart.transform.origin.x = Block_size / 2 + (j - MZ_x / 2) * Block_size
				Dart.transform.origin.y = 0
				Dart.transform.origin.z = Block_size / 2 + (i - MZ_y / 2) * Block_size
			if Temp_ROOM[i][j] == "F":
				var Floor = Floor_org.instance()
				add_child(Floor)
				Floor.transform.origin.x = Block_size / 2 + (j - MZ_x / 2) * Block_size
				Floor.transform.origin.y = 0
				Floor.transform.origin.z = Block_size / 2 + (i - MZ_y / 2) * Block_size
			if Temp_ROOM[i][j] == "G":
				Goal.transform.origin.x = Block_size / 2 + (j - MZ_x / 2) * Block_size
				Goal.transform.origin.y = 0
				Goal.transform.origin.z = Block_size / 2 + (i - MZ_y / 2) * Block_size
			if Temp_ROOM[i][j] == "W":
				var Wall = Wall_org.instance()
				add_child(Wall)
				Wall.transform.origin.x = Block_size / 2 + (j - MZ_x / 2) * Block_size
				Wall.transform.origin.y = 0
				Wall.transform.origin.z = Block_size / 2 + (i - MZ_y / 2) * Block_size
			if Temp_ROOM[i][j] == "P":
				Start.transform.origin.x = Block_size / 2 + (j - MZ_x / 2) * Block_size
				Start.transform.origin.y = 0
				Start.transform.origin.z = Block_size / 2 + (i - MZ_y / 2) * Block_size
				Player.set_scale(Vector3(1.0, 1.0, 1.0))
				Player.transform.origin.x = Block_size / 2 + (j - MZ_x / 2) * Block_size
				Player.transform.origin.y = 0
				Player.transform.origin.z = Block_size / 2 + (i - MZ_y / 2) * Block_size
		
	Temp_x = 3
	Temp_z = int(MZ_y * n / 20 + MZ_y / 2)
#	print(Temp_x, "%10d" % Temp_z, "%10s" % Temp_ROOM[Temp_z][Temp_x])
	if Temp_ROOM[Temp_z][Temp_x] == "F":
		Wanderer.set_scale(Vector3(1.0, 1.0, 1.0))
		Wanderer.transform.origin.x = Block_size / 2 + (Temp_x - MZ_x / 2) * Block_size
		Wanderer.transform.origin.y = 0
		Wanderer.transform.origin.z = Block_size / 2 + (Temp_z - MZ_y / 2) * Block_size
	else:
		Wanderer.set_scale(Vector3(1.5, 1.5, 1.5))
		Wanderer.transform.origin.x = Block_size / 2 + (Temp_x - MZ_x / 2) * Block_size
		Wanderer.transform.origin.y = 0
		Wanderer.transform.origin.z = Block_size / 2 + (Temp_z - MZ_y / 2 + 1) * Block_size
	get_node("KinematicBody_Player").Initialize_Player()


func _process(delta):
	Temp = delta
	Start_flag = get_node("KinematicBody_Player").Start_flag
	if Start_flag == 2:
		var temp_time = OS.get_ticks_msec()
		var elapsed_time  = (temp_time - get_node("KinematicBody_Player").Start_time) / 1000
		get_node("Label_Time").text = "Time(Sec) = " + String(elapsed_time)


func _on_Area_Goal_body_entered(body):
	SoundFlag = get_node("../Control/VBoxContainer/HBoxContainer/Button_00").SoundFlag
#	print(Goal_flag, SoundFlag)
	if (body.name == "KinematicBody_Player") and (End_flag == 0):
		get_node("KinematicBody_Player").Start_flag = 0
		End_flag = 1
		$Label.show()
		get_node("Label/AnimationPlayer").play("Goal")
		if SoundFlag == "ON" and Goal_flag == 0:
			var Goal_sound = AudioStreamPlayer.new()
			self.add_child(Goal_sound)
			Goal_sound.stream = load("res://info-girl1-goal1.ogg")
			Goal_sound.stream.loop = bool(0)
			Goal_sound.play()
			Goal_flag = 1

