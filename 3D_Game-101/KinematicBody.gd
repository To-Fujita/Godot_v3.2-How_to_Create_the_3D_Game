extends KinematicBody


const speed = 1
var Temp
var joystickVector
var player_quat_s
var player_quat_g
var player_quat_t = 0.2
onready var player = get_node(".")
onready var player_body = get_node("Boy_002_Walk")
onready var player_idle = get_node("Boy_003_Idle")


func _ready():
	Temp = get_parent().get_node("JoyStick").connect('move', self, '_on_JoystickMove')
	player_quat_s = Quat(Vector3(0, 1, 0), atan2(0, 0))
	player_body.hide()
	player_idle.show()
	get_node("Boy_002_Walk/AnimationPlayer").play("Boy_202_Walk")


func _process(delta):
	Temp = delta
	player_move()


func _on_JoystickMove(vector):
	if abs(vector.x) > abs(vector.y):
		if vector.x > 0:
			joystickVector = "right"
#			player.move_and_slide(Vector3(speed, 0, 0), Vector3())		# 4方向移動
		elif vector.x < 0:
			joystickVector = "left"
#			player.move_and_slide(Vector3(speed * -1, 0, 0), Vector3())
	elif abs(vector.x) < abs(vector.y):
		if vector.y > 0:
			joystickVector = "forward"
#			player.move_and_slide(Vector3(0, 0, speed), Vector3())
		elif vector.y < 0:
			joystickVector = "backward"
#			player.move_and_slide(Vector3(0, 0, speed * -1), Vector3())
	else:
		joystickVector = "stay"
	
	if vector.length() > 0:
		var force = Vector3(vector.x, 0, vector.y).normalized() * speed
		player.move_and_slide(force, Vector3())							# ８方向移動
		player_idle.hide()
		player_body.show()
		get_node("Boy_002_Walk/AnimationPlayer").play("Boy_202_Walk")
		player_quat_g = Quat(Vector3(0, 1, 0), atan2(vector.x, vector.y))
		player_quat_s = player_quat_s.slerp(player_quat_g, player_quat_t)
		player_body.transform = Transform(player_quat_s)
		player_idle.transform = Transform(player_quat_s)
	else:
		player_body.hide()
		player_idle.show()
		get_node("Boy_003_Idle/AnimationPlayer").play("Boy_203a_Idle")


func player_move():
	var direction = Vector3()
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.z += 1
	if Input.is_action_pressed("ui_up"):
		direction.z -= 1
	
	if direction.length() > 0:
		var force = direction.normalized() * speed
		player_quat_g = Quat(Vector3(0, 1, 0), atan2(direction.x, direction.z))
		player_quat_s = player_quat_s.slerp(player_quat_g, player_quat_t)
		player_body.transform = Transform(player_quat_s)
		player_idle.transform = Transform(player_quat_s)
		Temp = player.move_and_slide(force, Vector3(0, 0, 0))
		player_idle.hide()
		player_body.show()
		get_node("Boy_002_Walk/AnimationPlayer").play("Boy_202_Walk")
		
	else:
		player_body.hide()
		player_idle.show()
		get_node("Boy_003_Idle/AnimationPlayer").play("Boy_203a_Idle")

