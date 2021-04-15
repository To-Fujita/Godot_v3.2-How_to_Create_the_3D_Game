# Godot_v3.2-How_to_Create_the_3D_Game
GODOT engine is a free and open source 2D/3D Game Engine. This document is a tutorial for how to create the basic 3D game based on Godot ver. 3.2. I hope it helps as a reference for beginners.  
  
## 1. Description
This document describes how to create the 3D games on step by step. I will explain how to create the 3D objects and the 3D character, then how to move (walk) the 3D character. You can download all of programs and assets in this document from "Code" above.   
- 3D_Game-101: Sample for moving the 3D character by using virtual joystick   
- 3D_Game-102: Sample for 3D maze game  
  
## 2. Demo
Followings are demos for this tutorials. It takes time for the demo to start.  
- [Demo for 3D Character Move](https://to-fujita.github.io/Godot_v3.2-How_to_Create_the_3D_Game/3D_Game-101/3D_Game-101.html)   
- [Demo for 3D Maze Game](https://to-fujita.github.io/Godot_v3.2-How_to_Create_the_3D_Game/3D_Game-102/3D_Game-102.html)   

![3D_Game 101](https://github.com/To-Fujita/Images/blob/master/3D_Game-001.gif "Demo for 3D Game 101")  

## 3. Tutorials
I will describe how to create the 3D objects and 3D character in this tutorial. Then, try to attach animations to the 3D character for walking.
### Step-1: Create New Project
When you launch GODOT Engine, you will see the Project Manager as below. If you launch it at first time, no project appears in the Project Manager. Then, please click the "New Project".  
![Godot 101](https://github.com/To-Fujita/Images/blob/master/Godot-101.jpg "Godot 101")  
  
Click the "Browse" at the next image, then select the folder to create new game.  
![Godot 102](https://github.com/To-Fujita/Images/blob/master/Godot-102.jpg "Godot 102") 
  
Input "Project Name", then click the "Create Folder".
![Godot 103](https://github.com/To-Fujita/Images/blob/master/Godot-103.jpg "Godot 103")  
  
Click the "Create & Edit". 
![Godot 104](https://github.com/To-Fujita/Images/blob/master/Godot-104.jpg "Godot 104") 
  
### Step-2: Copy the Assets
After open the "New Project" folder by using the Explorer, create the new folder as "assets". Then, copy the following files.  
(Note: Please replace the "New Project" with the folder name that you entered.)  
- JoyStick.gd: After download from "[Github Godot-Virtual-Joystick](https://github.com/rodrigofbm/Godot-Virtual-Joystick)" and unzip it, then copy to "New Project" folder.  
- Boy_002_Walk.glb: 3D character with walking animation that is created by Blender. (Copy to "assets" folder)  
- Boy_003_Idle.glb: 3D character with idle animation that is also created by Blender. (Copy to "assets" folder)  
- backdrop-21534_1920.png: The texture for block (Copy to "assets" folder)  
- big_circle_N.png: The texture for "BigCircle" at Virtual Joystick (Copy to "assets" folder)  
- FloorsRegular0043_L.png: The texture for floor (Copy to "assets" folder)  
- orange_ball_01.png: The texture for "SmallCircle" at Virtual Joystick (Copy to "assets" folder)  

Please try to use your own textures and/or 3D characters instead of above files.
  
### Step-3: Create the Materials for 3D Game  
It is needed some objects, a light and a camera to create 3D game. Additionally, "Virtual Joystick" is needed to control the 3D character.

#### Step-3-1: Set a Camera and a Light  
At the next image, please click the "3D Scene" for create the 3D spatial.
![Godot 105](https://github.com/To-Fujita/Images/blob/master/Godot-105.jpg "Godot 105")  
  
If you right click on the "Spatial" at the "Scene" of the left side, you can see the next image. Then, please click the "ADD Child Node".   
![Godot 106](https://github.com/To-Fujita/Images/blob/master/Godot-106.jpg "Godot 106")  
  
Please select the "Camera", then click the "Create" at the image below.  
![Godot 107](https://github.com/To-Fujita/Images/blob/master/Godot-107.jpg "Godot 107")  
  
Please create the "DirectionalLight" to same way at the "Camera" above.
![Godot 108](https://github.com/To-Fujita/Images/blob/master/Godot-108.jpg "Godot 108")  
  
#### Step-3-2: Create the Floor Block
Please create the "StaticBody" to same way at the "Camera" above.  
(Note: A static body is a simple body that is not intended to move.)    
![Godot 109](https://github.com/To-Fujita/Images/blob/master/Godot-109.jpg "Godot 109")  
  
Select the "StaticBody" at the left side and right click it, then click the "ADD Child Node". Please select the "MeshInstance", then click the "Create".  
(Note: MeshInstance is a node that takes a Mesh resource and adds it to the current scenario by creating an instance of it.)  
![Godot 110](https://github.com/To-Fujita/Images/blob/master/Godot-110.jpg "Godot 110")  
  
Also, select the "StaticBody" at the left side and right click it, then click the "ADD Child Node". Please select the "CollisionShape", then click the "Create".  
(Note: CollisionShape is an editor facility for creating and editing collision shapes in 3D space.)  
![Godot 111](https://github.com/To-Fujita/Images/blob/master/Godot-111.jpg "Godot 111")  
  
Select the "MeshInstance" at the left side and click the "empty" of "Mesh" at right side, then click the "New CubeMesh" for creating the box object.  
![Godot 112](https://github.com/To-Fujita/Images/blob/master/Godot-112.jpg "Godot 112")  
  
At the defult setting, it is created a white cubed box that size is 2m x 2m x 2m. Please click the white box of "Mesh" at right side.  
![Godot 113](https://github.com/To-Fujita/Images/blob/master/Godot-113.jpg "Godot 113")  
  
Click the "empty" of "Material" at right side, then select the "New SpatialMaterial".  
![Godot 114](https://github.com/To-Fujita/Images/blob/master/Godot-114.jpg "Godot 114")  
  
Click the white sphere of "Material" at right side.  
![Godot 115](https://github.com/To-Fujita/Images/blob/master/Godot-115.jpg "Godot 115")  
  
After select the "Albedo" at right side, click the "empty" in "Texture", then select the "Load".  
![Godot 116](https://github.com/To-Fujita/Images/blob/master/Godot-116.jpg "Godot 116")  
  
Select the "assets" folder at "Open a File", then open the "FloorRegular0043_L.png" file.  
![Godot 117](https://github.com/To-Fujita/Images/blob/master/Godot-117.jpg "Godot 117")  
  
Set the scale of "Uv1" at right side as below.  
(Note: The texture of cube is refer to "[Godot_v3.2-Cube_Characters](https://github.com/To-Fujita/Godot_v3.2-Cube_Characters)".)
![Godot 118](https://github.com/To-Fujita/Images/blob/master/Godot-118.jpg "Godot 118")  
  
After select the "CollisionShape" at left side, click the "empty" of "Shape" at right side. Then, please select the "New BoxShape". The size of collision cubed box is also 2m x 2m x 2m at dufault setting.  
![Godot 119](https://github.com/To-Fujita/Images/blob/master/Godot-119.jpg "Godot 119")  
  
Select the "StaticBody" at left side, then set the value for the "Translation" in "Transform" of "Spatial" at right side. The reason is to move to the place that does not get in the way at the game.  
![Godot 120](https://github.com/To-Fujita/Images/blob/master/Godot-120.jpg "Godot 120")  

#### Step-3-3: Create the Brick Block
Please create the "StaticBody2" to same way at the "StaticBody" above. However, change to set the "backdrop-21534_1920.png" as a texture and set the different value of "Translation" in "Transform" of "Spatial" to the "Create the Floor Block" above.  
![Godot 121](https://github.com/To-Fujita/Images/blob/master/Godot-121.jpg "Godot 121")  
  
#### Step-3-4: Create the Player
After select the "Spatial" at left side, please click the "ADD Child Node". Then, select the "KinematicBody".  
(Note: Kinematic body is a special type of body that is meant to be user-controlled.)  
![Godot 122](https://github.com/To-Fujita/Images/blob/master/Godot-122.jpg "Godot 122")  
  
Add the "MeshInstance" and the "CollisionShape" that are same way to above. Then, drag files of the "Boy_002_Walk.glb" and the "Boy_003_Idle.glb" to the "KinematicBody".
![Godot 123](https://github.com/To-Fujita/Images/blob/master/Godot-123.jpg "Godot 123")  
  
Select the "MeshInstance" of the "KinematicBody" at left side, then click the "empty" in "Mesh" and select the "New CylinderMesh".  
![Godot 124](https://github.com/To-Fujita/Images/blob/master/Godot-124.jpg "Godot 124")  
  
Set the value to the "Top Radius", the "Bottom Radius" and the "Height" to fit the 3D character size.  
![Godot 125](https://github.com/To-Fujita/Images/blob/master/Godot-125.jpg "Godot 125")  
  
Set the value to the "Translation" of the "Transform" at right side to fit the 3D character size also.  
![Godot 126](https://github.com/To-Fujita/Images/blob/master/Godot-126.jpg "Godot 126")  
  
Select the "CollisionShape" of the "KinematicBody" at left side, then click the "empty" in the "Shape" and select the "New CylinderShape".
![Godot 127](https://github.com/To-Fujita/Images/blob/master/Godot-127.jpg "Godot 127")  
  
Set the value to the "Radius", the "Height" and the "Translation" of the "Transform" as like to the "MeshInstance".
![Godot 128](https://github.com/To-Fujita/Images/blob/master/Godot-128.jpg "Godot 128")  
  
Click the eye mark at the "MeshInstance" of "KinematicBody" to disappear the white cylinder shape. Select the "KinematicBody" at the left side, then set the value to the "Translation" of the "Transform".
![Godot 129](https://github.com/To-Fujita/Images/blob/master/Godot-129.jpg "Godot 129")  
  
#### Step-3-5: Create the Virtual Joystick
Right click on the "Spatial" at the left side, then click the "ADD Child Node". Select the "Node2D" and click the "Create".  
![Godot 130](https://github.com/To-Fujita/Images/blob/master/Godot-130.jpg "Godot 130")  
  
Select the "Node2D" at left side, then select the "Sprite" and click the "Create".  
![Godot 131](https://github.com/To-Fujita/Images/blob/master/Godot-131.jpg "Godot 131")  
  
Create the "Sprite" again as "Sprite2".  
After select the "Sprite", click the "empty" of the "Texture" and select the "Load" at right side.  
![Godot 132](https://github.com/To-Fujita/Images/blob/master/Godot-132.jpg "Godot 132")  
  
Select the file of "big_circle_N.png" and click the "Open".
![Godot 133](https://github.com/To-Fujita/Images/blob/master/Godot-133.jpg "Godot 133")  
  
After select the "Sprite2", click the "empty" of the "Texture" and select the "Load" again. Then, select the file of "orange_ball_01.png".
![Godot 134](https://github.com/To-Fujita/Images/blob/master/Godot-134.jpg "Godot 134")  
  
Change the name at left side as follows.
- Node2D  -> JoyStick  
- Sprite  -> BigCircle  
- Sprite2 -> SmallCircle  

Select the "JoyStick" at left side, then set the value of "Position" in "Transform" at right side.
![Godot 135](https://github.com/To-Fujita/Images/blob/master/Godot-135.jpg "Godot 135") 
  
### Step-4: Save the branches as scene for the Floor Block and the Brick Block
Right Click on the "StaticBody" at left side and select the "Save Branch as Scene". Because, it is for easy to copy the object.  
![Godot 136](https://github.com/To-Fujita/Images/blob/master/Godot-136.jpg "Godot 136")  
  
Please click the "Save" at default file name.
![Godot 137](https://github.com/To-Fujita/Images/blob/master/Godot-137.jpg "Godot 137")  
  
Save the branch as scene again for the "StaticBody2".
![Godot 138](https://github.com/To-Fujita/Images/blob/master/Godot-138.jpg "Godot 138") 
  
### Step-5: Attach the script to the Virtual JoyStick
Drag the "JoyStick.gd" at under of right side on the "JoyStick" for attaching the script.
![Godot 139](https://github.com/To-Fujita/Images/blob/master/Godot-139.jpg "Godot 139") 
  
### Step-6: Attach the script to the Spatial
Right Click on the "Spatial" at right side and select the "Attach Script".
![Godot 140](https://github.com/To-Fujita/Images/blob/master/Godot-140.jpg "Godot 140") 
  
Click the "Create" at default setting.
![Godot 141](https://github.com/To-Fujita/Images/blob/master/Godot-141.jpg "Godot 141") 
  
Next image is a script input screen.
![Godot 201](https://github.com/To-Fujita/Images/blob/master/Godot-201.jpg "Godot 201") 
  
Please input next script for the "Spatial". It is to create 10 x 10 of Floor Blocks for the ground, one of Brick Block and one of Player.
~~~
extends Spatial


# Declare member variables here. Examples:
var Ground_x = 10		# The number of Floor Blocks: In this case, set 10(x-direction) x 10(z-direction) blocks.
var Ground_y = 0
var Ground_z = 10
var Block_size = 2
var Player_x = 0		# Set the position for a player
var Player_y = 0
var Player_z = 0


# Called when the node enters the scene tree for the first time.
func _ready():
#	pass			# Replace with function body.
	Create_Ground()
	Create_Player()
	Create_Block()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# Create Ground Floors
func Create_Ground():
	var Floor_org = load("res://StaticBody.tscn")

	for i in range(Ground_x):
		for j in range(Ground_z):
			var Floor = Floor_org.instance()
			add_child(Floor)
			Floor.transform.origin.x = Block_size / 2 + (i - Ground_x / 2) * Block_size
			Floor.transform.origin.y = -1
			Floor.transform.origin.z = Block_size / 2 + (j - Ground_z / 2) * Block_size


# Create Player
func Create_Player():
	var Player = get_node("KinematicBody")
	Player.set_scale(Vector3(1.0, 1.0, 1.0))
	Player.transform.origin.x = 0
	Player.transform.origin.y = 0
	Player.transform.origin.z = 0	


# Create a Brick Block
func Create_Block():
	var Block_org = load("res://StaticBody2.tscn")
	
	var Block = Block_org.instance()
	add_child(Block)
	Block.transform.origin.x = 3
	Block.transform.origin.y = 1
	Block.transform.origin.z = -2
	
~~~
  
### Step-7: Attach the script to the KinematicBody
Right Click on the "KinematicBody" at right side and select the "Attach Script". Then, click the "Create" at default setting.
![Godot 202](https://github.com/To-Fujita/Images/blob/master/Godot-202.jpg "Godot 202") 
  
Please input next script for the "KinematicBody". It is to control the palyer by the virtual joystick and/or the arrow keys in the keybord.
~~~
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
#			player.move_and_slide(Vector3(speed, 0, 0), Vector3())		# Move the 4 directions
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
		player.move_and_slide(force, Vector3())					# Move more than 8 directions
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
	if Input.is_action_pressed("ui_right"):						# Controled by arrow keys
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

~~~

I will try to describe about 3D animations. There are commands 'get_node("Boy_002_Walk/AnimationPlayer").play("Boy_202_Walk")' for walking animation and 'get_node("Boy_003_Idle/AnimationPlayer").play("Boy_203a_Idle")' for idle animation.   
Please click the mark at the "Boy_002_Walk", then click the "New Inherited".
![Godot 203](https://github.com/To-Fujita/Images/blob/master/Godot-203.jpg "Godot 203")
  
You can see the detail of the "Boy_002_Walk". If you click the "AnimationPlayer", you can see the animation of it. The "Boy_202_Walk" is a main body of the animation.  
![Godot 204](https://github.com/To-Fujita/Images/blob/master/Godot-204.jpg "Godot 204")
  
Also, you can see the detail of the "Boy_003_Idle". The "Boy_203a_Idle" is a main body of the animation.
![Godot 205](https://github.com/To-Fujita/Images/blob/master/Godot-205.jpg "Godot 205")
  
### Step-8: Set the Camera Position and the Light Position
After select the "Camera" at right side, set the values to the "Translation" and the "Rotation Degrees" in the "Transform" at the right side. Then, please check to "Preview" on main window for change to camera's view.
![Godot 142](https://github.com/To-Fujita/Images/blob/master/Godot-142.jpg "Godot 142") 
  
Please select the "DirectionalLight" at left side and check the "Enabled" at the "Shadow" of the "Light". Then, set the values to the "Translation" and the "Rotation Degrees" in the "Transform" at the right side.
![Godot 143](https://github.com/To-Fujita/Images/blob/master/Godot-143.jpg "Godot 143") 
  
If you click the play mark at upper side of right, you can see a scene that you created in the small window.
![Godot 144](https://github.com/To-Fujita/Images/blob/master/Godot-144.jpg "Godot 144") 
  
Next image is a scene at fixed camera mode. You can control to move the 3D character.
![Godot 145](https://github.com/To-Fujita/Images/blob/master/Godot-145.jpg "Godot 145") 

### Step-9: Set as a Tracking Camera
Please try to drag the "Camera" to the "KinematicBody" for setting as a tracking camera.
![Godot 146](https://github.com/To-Fujita/Images/blob/master/Godot-146.jpg "Godot 146") 
  
Select the "Camera" at left side and set the values at the "Translation" in the "Transform" at right side. Then, try to click the play mark at upper side of right, you can see a scene at tracking camera mode.
![Godot 147](https://github.com/To-Fujita/Images/blob/master/Godot-147.jpg "Godot 147") 
  
### Step-10: Maze Type of Game
In the maze game, the setting for the ground and the walls are almost same way to the above. Also, the control for 3D player is same to the above. The additional items are as follows.  
- Menu: Start screen for the game  
- Settings: Select the player, ON/OFF for the sound effect and set the maze's size  
- Goal: 3D area that detects CollisionObject nodes overlapping, entering, or exiting.  

To create the maze is almost same to the "Step-6: How to create a maze game" on [Babylon.js_3D_Graphics](https://github.com/To-Fujita/Babylon.js_3D_Graphics).  
  
![Godot 150](https://github.com/To-Fujita/Images/blob/master/Godot-150.jpg "Godot 150")  

![Godot 151](https://github.com/To-Fujita/Images/blob/master/Godot-151.jpg "Godot 151")  

![Godot 152](https://github.com/To-Fujita/Images/blob/master/Godot-152.jpg "Godot 152")  

![Godot 153](https://github.com/To-Fujita/Images/blob/master/Godot-153.jpg "Godot 153")  

![Godot 154](https://github.com/To-Fujita/Images/blob/master/Godot-154.jpg "Godot 154")  

![Godot 155](https://github.com/To-Fujita/Images/blob/master/Godot-155.jpg "Godot 155")  

  
## 4. Reference
[GODOT Engine](https://godotengine.org/): The game engine that is completely free and open-source under the MIT license.  
[GODOT v3.2 Basic Shaders](https://github.com/To-Fujita/Godot_v3.2-Basic_Shaders): The demo for Godot shaders  
[GODOT v3.2 Cube Characters](https://github.com/To-Fujita/Godot_v3.2-Cube_Characters): Some simple Cube_Characters with animations based on Godot Engine ver. 3.2.  
[GODOT v3.2 Sokoban Cube](https://github.com/To-Fujita/Godot_v3.2-Sokoban_Cube): A sokoban type of game as a demonstration of Cube Characters with some animations based on Godot Game Engine ver. 3.2.  
[Virtual-Joystick](https://github.com/rodrigofbm/Godot-Virtual-Joystick): Virtual Joystick for GODOT ver. 3.x  
[Babylon.js_3D_Graphics](https://github.com/To-Fujita/Babylon.js_3D_Graphics): How to create the 3D graphics, the maze game, some pazzle games, 360 degrees video and VR mode on 360 degrees video by using Babylon.js.  

## 5. License
MIT  

## 6. Author
[T. Fujita](https://github.com/To-Fujita)  
