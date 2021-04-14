# Godot_v3.2-How_to_Create_the_3D_Game
GODOT engine is a free and open source 2D/3D Game Engine. This document is a tutorial for how to create the basic 3D game based on Godot ver. 3.2. I hope it helps as a reference for beginners.  
  
## 1. Description
This document describes how to create the 3D games on step by step. I will explain how to create the 3D blocks and the 3D character, then how to move (walk) the 3D character. You can download all of programs and assets in this document from "Code" above.   
- 3D_Game-101: Sample for moving the 3D character by using virtual joystick   
- 3D_Game-102: Sample for 3D maze game  
  
## 2. Demo
Followings are demos for this tutorials.  
- [Demo for 3D Character Move](https://to-fujita.github.io/Godot_v3.2-How_to_Create_the_3D_Game/tree/main/3D_Game-101/3D_Game-101.html)   
- [Demo for 3D Maze Game](https://to-fujita.github.io/Godot_v3.2-How_to_Create_the_3D_Game/tree/main/3D_Game-102/3D_Game-102.html)   

![3D_Game 101](https://github.com/To-Fujita/Images/blob/master/3D_Game-001.gif "Demo for 3D Game 101")  

## 3. Tutorials

### Step-1: Create New Project
When you launch GODOT Engine, you will see the Project Manager as below. If you launch it at first time, no project appears in this Project Manager. Please click the "New Project".  
![Godot 101](https://github.com/To-Fujita/Images/blob/master/Godot-101.jpg "Godot 101")  
  
Click the "Browse" at the next figure, then select the folder to create new game.  
![Godot 102](https://github.com/To-Fujita/Images/blob/master/Godot-102.jpg "Godot 102") 
  
Input "Project Name", then click the "Create Folder".
![Godot 103](https://github.com/To-Fujita/Images/blob/master/Godot-103.jpg "Godot 103")  
  
Click the "Create & Edit". 
![Godot 104](https://github.com/To-Fujita/Images/blob/master/Godot-104.jpg "Godot 104") 
  
### Step-2: Copy the Assets
After open the "New Project" folder by using the Explorer, create the new folder as "assets". Then, copy the following files.  
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

#### Step-3-1: Set the Camera and the Light  
At the next figure, please click the "3D Scene" for create the 3D spatial.
![Godot 105](https://github.com/To-Fujita/Images/blob/master/Godot-105.jpg "Godot 105")  
  
If you right click on the "Spatial" at the "Scene" of the left side, you can see the next figure. Then, please click the "ADD Child Node".   
![Godot 106](https://github.com/To-Fujita/Images/blob/master/Godot-106.jpg "Godot 106")  
  
Please select the "Camera", then click the "Create" at the figure below.  
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
  
Select the "MeshInstance" at the left side and click the "enpty" of "Mesh" at right side, then click the "New CubeMesh" for creating the box object.  
![Godot 112](https://github.com/To-Fujita/Images/blob/master/Godot-112.jpg "Godot 112")  
  
At the defult setting, it is created a white cubed box that size is 2m x 2m x 2m. Please click the white box of "Mesh" at right side.  
![Godot 113](https://github.com/To-Fujita/Images/blob/master/Godot-113.jpg "Godot 113")  
  
Click the "enpty" of "Material" at right side, then select the "New SpatialMaterial".  
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
  
After select the "CollisionShape" at left side, click the "empty" of "New BoxShape" at right side. The size of collision cubed box is also 2m x 2m x 2m at dufault setting.  
![Godot 119](https://github.com/To-Fujita/Images/blob/master/Godot-119.jpg "Godot 119")  
  
Select the "StaticBody" at left side, then, set the "Translation" in "Transform" of "Spatial" at right side.  
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
  
Select the "Node2D" at left side, then select the "Sprite" and click the "Create" at right side.  
![Godot 131](https://github.com/To-Fujita/Images/blob/master/Godot-131.jpg "Godot 131")  
  
Create the "Sprite" again as "Sprite2".  
After select the "Sprite", click the "empty" of the "Texture" and select the "Load".  
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
  
Please input next script for the "Spatial".



### Step-7: Attach the script to the KinematicBody
Right Click on the "KinematicBody" at right side and select the "Attach Script". Then, click the "Create" at default setting.
![Godot 202](https://github.com/To-Fujita/Images/blob/master/Godot-202.jpg "Godot 202") 
  
Please input next script for the "KinematicBody".


### Step-8: Set the Camera Position and the Light Position

![Godot 142](https://github.com/To-Fujita/Images/blob/master/Godot-142.jpg "Godot 142") 

![Godot 143](https://github.com/To-Fujita/Images/blob/master/Godot-143.jpg "Godot 143") 

![Godot 144](https://github.com/To-Fujita/Images/blob/master/Godot-144.jpg "Godot 144") 

![Godot 145](https://github.com/To-Fujita/Images/blob/master/Godot-145.jpg "Godot 145") 

### Step-9: Set as a Tracking Camera

![Godot 146](https://github.com/To-Fujita/Images/blob/master/Godot-146.jpg "Godot 146") 

![Godot 147](https://github.com/To-Fujita/Images/blob/master/Godot-147.jpg "Godot 147") 

## 4. Reference
[GODOT Engine](https://godotengine.org/): The game engine that is completely free and open-source under the MIT license.  
[GODOT v3.2 Basic Shaders](https://github.com/To-Fujita/Godot_v3.2-Basic_Shaders): The demo for Godot shaders  
[GODOT v3.2 Cube Characters](https://github.com/To-Fujita/Godot_v3.2-Cube_Characters): Some simple Cube_Characters with animations based on Godot Engine ver. 3.2.  
[GODOT v3.2 Sokoban Cube](https://github.com/To-Fujita/Godot_v3.2-Sokoban_Cube): A sokoban type of game as a demonstration of Cube Characters with some animations based on Godot Game Engine ver. 3.2.  
[Virtual-Joystick](https://github.com/rodrigofbm/Godot-Virtual-Joystick): Virtual Joystick for GODOT ver. 3.x  

## 5. License
MIT  

## 6. Author
[T. Fujita](https://github.com/To-Fujita)  
