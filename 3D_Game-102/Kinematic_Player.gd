extends KinematicBody
# Player Move

const speed = 2
var Temp
var JoystickVector
var Player_quat_s
var Player_quat_g
var Player_quat_t = 0.2
export (int) var MZ_x
export (int) var MZ_y
export (int) var Block_size
export (int) var Start_flag
#	0: Idle
#	1: Start
#	2: Count
export (int) var Start_time
export (String) var PlayerFlag
onready var Player = get_node(".")
onready var Player_Boy_Walk = get_node("Boy_002_Walk")
onready var Player_Boy_Idle = get_node("Boy_003_Idle")
onready var Player_Girl_Walk = get_node("Girl_002_Walk")
onready var Player_Girl_Idle = get_node("Girl_003_Idle")
onready var Player_Puppy_Walk = get_node("Puppy_102_Walk")
onready var Player_Puppy_Idle = get_node("Puppy_103_Idle")
var Player_Walk
var Player_Idle


func _ready():
	Start_flag = 0
	Player_Boy_Walk.hide()
	Player_Boy_Idle.hide()
	Player_Girl_Walk.hide()
	Player_Girl_Idle.hide()
	Player_Puppy_Walk.hide()
	Player_Puppy_Idle.hide()
	Temp = get_node("../JoyStick").connect('move', self, '_on_JoystickMove')
#	PlayerFlag = get_node("../../Control/VBoxContainer/HBoxContainer3/MenuButton3").PlayerFlag
	Player_quat_s = Quat(Vector3(0, 1, 0), atan2(0, 0))
	Player_Walk = Player_Boy_Walk
	Player_Idle = Player_Boy_Idle
#	get_node("Boy_002_Walk/AnimationPlayer").get_animation("Boy_202_Walk").loop = true
#	get_node("Girl_002_Walk/AnimationPlayer").get_animation("Girl_002_Walk")loop = true
	get_node("Boy_003_Idle/AnimationPlayer").get_animation("Boy_203a_Idle").loop = true
	get_node("Girl_003_Idle/AnimationPlayer").get_animation("Girl_202_Idle").loop = true
	get_node("Puppy_103_Idle/AnimationPlayer").get_animation("Puppy_Walk001").loop = true
	

func Initialize_Player():
	Player_Idle.hide()
	PlayerFlag = get_node("../../Control/VBoxContainer/HBoxContainer3/MenuButton3").PlayerFlag
	if PlayerFlag == "GIRL":
		Player_Walk = Player_Girl_Walk
		Player_Idle = Player_Girl_Idle
		get_node("Girl_003_Idle/AnimationPlayer").play("Girl_202_Idle")
	elif PlayerFlag == "PUPPY":
		Player_Walk = Player_Puppy_Walk
		Player_Idle = Player_Puppy_Idle
		get_node("Puppy_103_Idle/AnimationPlayer").play("Puppy_Walk001")
	else:
		Player_Walk = Player_Boy_Walk
		Player_Idle = Player_Boy_Idle
		get_node("Boy_003_Idle/AnimationPlayer").play("Boy_203a_Idle")
	Player_Walk.hide()
	Player_Idle.show()
	Start_flag = 1
#	print("P= ", PlayerFlag)


func _on_JoystickMove(vector):
	Temp = get_node("../../Control/VBoxContainer/VBoxContainer/MenuButton")
	if Start_flag == 1:
		Start_time = OS.get_ticks_msec()
		Start_flag = 2
	MZ_x = Temp.MZ_x
	MZ_y = Temp.MZ_y
	Temp = get_node("..")
	Block_size = Temp.Block_size
	if abs(vector.x) > abs(vector.y):
		if vector.x > 0:
			JoystickVector = "right"
			Player.move_and_slide(Vector3(speed, 0, 0), Vector3())		# 4方向移動
		elif vector.x < 0:
			JoystickVector = "left"
			Player.move_and_slide(Vector3(speed * -1, 0, 0), Vector3())
	elif abs(vector.x) < abs(vector.y):
		if vector.y > 0:
			JoystickVector = "forward"
			Player.move_and_slide(Vector3(0, 0, speed), Vector3())
		elif vector.y < 0:
			JoystickVector = "backward"
			Player.move_and_slide(Vector3(0, 0, speed * -1), Vector3())
	else:
		JoystickVector = "stay"
	
	if vector.length() > 0:
#		var force = Vector3(vector.x, 0, vector.y).normalized() * speed
#		player.move_and_slide(force, Vector3())							# ８方向移動
		Player_Walk.show()
		Player_Idle.hide()
		if PlayerFlag == "GIRL":
			get_node("Girl_002_Walk/AnimationPlayer").play("Girl_002_Walk", -1, 1.5)
		elif PlayerFlag == "PUPPY":
			get_node("Puppy_102_Walk/AnimationPlayer").play("Puppy_Walk001", -1, 1.5)
		else:
			get_node("Boy_002_Walk/AnimationPlayer").play("Boy_202_Walk", -1, 2)
		
		Player_quat_g = Quat(Vector3(0, 1, 0), atan2(vector.x, vector.y))
		Player_quat_s = Player_quat_s.slerp(Player_quat_g, Player_quat_t)
		Player_Walk.transform = Transform(Player_quat_s)
		Player_Idle.transform = Transform(Player_quat_s)

	else:
		Player_Walk.hide()
		Player_Idle.show()
		if PlayerFlag == "GIRL":
			get_node("Girl_003_Idle/AnimationPlayer").play("Girl_202_Idle")
		elif PlayerFlag == "PUPPY":
			get_node("Puppy_103_Idle/AnimationPlayer").play("Puppy_Walk001")
		else:
			get_node("Boy_003_Idle/AnimationPlayer").play("Boy_203a_Idle")
		
	var Temp_Player = get_node(".")
	Temp_Player.transform.origin.x = clamp(Temp_Player.transform.origin.x, (Block_size / 2 + (2 - MZ_x / 2) * Block_size), (Block_size / 2 + (MZ_x + 1 - MZ_x / 2) * Block_size))
	Temp_Player.transform.origin.z = clamp(Temp_Player.transform.origin.z, (Block_size / 2 + (2 - MZ_y / 2) * Block_size), (Block_size / 2 + (MZ_y + 1 - MZ_y / 2) * Block_size))
