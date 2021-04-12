extends KinematicBody
#	Move the Wanderer

const speed = 1.0
const Count = 100
const Rest = 3
onready var Wanderer = get_node(".")
onready var Wanderer_Walk = get_node("Skelton_Pirate_002_Walk")
onready var Wanderer_Idle = get_node("Skelton_Pirate_003_Idle")
var Wanderer_quat_s
var Wanderer_quat_g
var Wanderer_quat_t = 0.2
var M_vector = Vector3()
var Temp_vector = Vector3()
var n = 0
var XP_ray
var XM_ray
var XPD_ray
var XMD_ray
var ZP_ray
var ZM_ray
var ZPD_ray
var ZMD_ray
var Wanderer_flag = 0
var Wanderer_Serif = 0
var Speech = 0
var Block_size
var Temp = 0
var Temp_W = 0
var Serif = []
var Max_Speech = 5								# セリフ画像の数量


func _ready():
	Wanderer_Walk.hide()
	$Sprite3D.hide()
	Wanderer_quat_s = Quat(Vector3(0, 1, 0), atan2(0, 0))
	get_node("Skelton_Pirate_002_Walk/AnimationPlayer").get_animation("Boy_202_Walk").loop = true
	get_node("Skelton_Pirate_003_Idle/AnimationPlayer").get_animation("Boy_202_Walk").loop = true
	XP_ray = get_node("RayCast_XP")
	XM_ray = get_node("RayCast_XM")
	ZP_ray = get_node("RayCast_ZP")
	ZM_ray = get_node("RayCast_ZM")
	M_vector = Vector3(speed, 0, 0)
	for i in range(Max_Speech):
		Serif.append([])
		var Temp_S = "res://asset/Balloon_003_" + String(i) + ".png"
		Serif[i] = load(Temp_S)


func _process(delta):
	Temp = Temp + delta
	Block_size = get_node("..").Block_size
	var MZ_x = get_node("../../Control/VBoxContainer/VBoxContainer/MenuButton").MZ_x
	var MZ_y = get_node("../../Control/VBoxContainer/VBoxContainer/MenuButton").MZ_y
	if int(Temp) % Count == 1:
		Temp = 0
		n = rand_range(0, 1) * 10
	if n <= Rest:
		if M_vector != Vector3(0, 0, 0):
			Temp_vector = M_vector
		Wanderer_Walk.hide()
		Wanderer_Idle.show()
		Wanderer.move_and_slide(Vector3(0, 0, 0), Vector3())
		get_node("Skelton_Pirate_003_Idle/AnimationPlayer").play("Boy_202_Walk", -1, 1.0)
	else:
		Wanderer_Walk.show()
		Wanderer_Idle.hide()
#		$Sprite3D.hide()
		M_vector = Temp_vector
		var Results = XP_ray.get_collider()
		if Results == get_node("../KinematicBody_Player"):
			Wanderer_Serif = 1
		Results = XM_ray.get_collider()
		if Results == get_node("../KinematicBody_Player"):
			Wanderer_Serif = 1
		Results = ZP_ray.get_collider()
		if Results == get_node("../KinematicBody_Player"):
			Wanderer_Serif = 1
		Results = ZM_ray.get_collider()
		if Results == get_node("../KinematicBody_Player"):
			Wanderer_Serif = 1
		if XP_ray.is_colliding() and M_vector.x > 0:
#			print(int(n) % 2)
			if int(n) % 2:
				M_vector = Vector3(0, 0, speed * -1)
			else:
				M_vector = Vector3(0, 0, speed * 1)
		elif XM_ray.is_colliding() and M_vector.x < 0:
#			print("XM")
			if int(n) % 2:
				M_vector = Vector3(0, 0, speed * 1)
			else:
				M_vector = Vector3(0, 0, speed * -1)
		elif ZP_ray.is_colliding() and M_vector.z > 0:
#			print(n)
			if int(n) % 2: 
				M_vector = Vector3(speed * 1, 0, 0)
			else:
				M_vector = Vector3(speed * -1, 0, 0)
		elif ZM_ray.is_colliding() and M_vector.z < 0:
#			print("ZM")
			if int(n) % 2: 
				M_vector = Vector3(speed * -1, 0, 0)
			else:
				M_vector = Vector3(speed * 1, 0, 0)
		if (Wanderer.transform.origin.x > MZ_x + 1) and (Wanderer.transform.origin.z > (MZ_y + 4)):
#			print("ST")
			Wanderer_flag = 1
		if (Wanderer.transform.origin.x < 0) and (Wanderer.transform.origin.z < -5):
#			print("GL")
			Wanderer_flag = 1
		if Wanderer_flag == 0:
			Wanderer.move_and_slide(M_vector, Vector3())
			get_node("Skelton_Pirate_002_Walk/AnimationPlayer").play("Boy_202_Walk", -1, 1.0)
#		print(Wanderer.transform.origin.x, "  ", Wanderer.transform.origin.z)
	Wanderer_quat_g = Quat(Vector3(0, 1, 0), atan2(M_vector.x, M_vector.z))
	Wanderer_quat_s = Wanderer_quat_s.slerp(Wanderer_quat_g, Wanderer_quat_t)
	Wanderer_Walk.transform = Transform(Wanderer_quat_s)
	Wanderer_Idle.transform = Transform(Wanderer_quat_s)
	if Wanderer_Serif == 1:
		Temp_W = Temp_W + delta
		match Speech:
			1:
				$Sprite3D.texture = load("res://asset/Balloon_003_1.png")
			2:
				$Sprite3D.texture = load("res://asset/Balloon_003_2.png")
			3:
				$Sprite3D.texture = load("res://asset/Balloon_003_3.png")
			4:
				$Sprite3D.texture = load("res://asset/Balloon_003_4.png")
			_:
				$Sprite3D.texture = load("res://asset/Balloon_003_0.png")
		$Sprite3D.texture = Serif[Speech]
		$Sprite3D.show()
#		print(Temp_W)
		if Temp_W > Max_Speech:
			Temp_W = 0
			Wanderer_Serif = 0
			$Sprite3D.hide()
			Speech = int(rand_range(0, 1) * Max_Speech)

