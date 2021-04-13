# Godot_v3.2-How_to_Create_the_3D_Game
GODOT engine is a free and open source 2D/3D Game Engine. This document is a tutorial for how to create the basic 3D game based on Godot ver. 3.2. I hope it helps as a reference for beginners.  
  
## 1. Description
This document describes how to create the 3D games on step by step. I will explain how to create the 3D blocks and the 3D character, then how to move (walk) the 3D character. You can download all of programs and assets in this document from "Code" above.   
- 3D_Game-101: Sample for moving the 3D character by using virtual joystick   
- 3D_Game-102: Sample for 3D maze game  
  
## 2. Demo
Followings are demos for this tutorials.  
- [Demo for 3D Character Move](https://github.com/To-Fujita/Godot_v3.2-How_to_Create_the_3D_Game/tree/main/3D_Game-101/3D_Game-101.html):   
- [Demo for 3D Maze Game](https://github.com/To-Fujita/Godot_v3.2-How_to_Create_the_3D_Game/tree/main/3D_Game-102/3D_Game-102.html):   
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
- JoyStick.gd: After download from [Github Godot-Virtual-Joystick](https://github.com/rodrigofbm/Godot-Virtual-Joystick) and unzip it, then copy to "New Project" folder.  
- Boy_002_Walk.glb: 3D character with walking animation that is created by Blender. (Copy to "assets" folder)  
- Boy_003_Idle.glb: 3D character with idle animation that is also created by Blender. (Copy to "assets" folder)  
- backdrop-21534_1920.png: The texture for block (Copy to "assets" folder)  
- big_circle_N.png: The texture for "BigCircle" at Virtual Joystick (Copy to "assets" folder)  
- FloorsRegular0043_L.png: The texture for floor (Copy to "assets" folder)  
- orange_ball_01.png: The texture for "SmallCircle" at Virtual Joystick (Copy to "assets" folder)  
  
### Step-3: 

![Godot 105](https://github.com/To-Fujita/Images/blob/master/Godot-105.jpg "Godot 105")  

![Godot 106](https://github.com/To-Fujita/Images/blob/master/Godot-106.jpg "Godot 106")  

![Godot 107](https://github.com/To-Fujita/Images/blob/master/Godot-107.jpg "Godot 107")  

![Godot 108](https://github.com/To-Fujita/Images/blob/master/Godot-108.jpg "Godot 108")  

![Godot 109](https://github.com/To-Fujita/Images/blob/master/Godot-109.jpg "Godot 109")  

![Godot 110](https://github.com/To-Fujita/Images/blob/master/Godot-110.jpg "Godot 110")  

![Godot 111](https://github.com/To-Fujita/Images/blob/master/Godot-111.jpg "Godot 111")  

![Godot 112](https://github.com/To-Fujita/Images/blob/master/Godot-112.jpg "Godot 112")  

![Godot 113](https://github.com/To-Fujita/Images/blob/master/Godot-113.jpg "Godot 113")  

![Godot 114](https://github.com/To-Fujita/Images/blob/master/Godot-104.jpg "Godot 114")  

![Godot 115](https://github.com/To-Fujita/Images/blob/master/Godot-115.jpg "Godot 115")  

![Godot 116](https://github.com/To-Fujita/Images/blob/master/Godot-116.jpg "Godot 116")  

![Godot 117](https://github.com/To-Fujita/Images/blob/master/Godot-117.jpg "Godot 117")  

![Godot 118](https://github.com/To-Fujita/Images/blob/master/Godot-118.jpg "Godot 118")  

![Godot 119](https://github.com/To-Fujita/Images/blob/master/Godot-119.jpg "Godot 119")  

![Godot 120](https://github.com/To-Fujita/Images/blob/master/Godot-120.jpg "Godot 120")  

![Godot 121](https://github.com/To-Fujita/Images/blob/master/Godot-121.jpg "Godot 121")  

![Godot 122](https://github.com/To-Fujita/Images/blob/master/Godot-122.jpg "Godot 122")  

![Godot 123](https://github.com/To-Fujita/Images/blob/master/Godot-123.jpg "Godot 123")  

![Godot 124](https://github.com/To-Fujita/Images/blob/master/Godot-124.jpg "Godot 124")  

![Godot 125](https://github.com/To-Fujita/Images/blob/master/Godot-125.jpg "Godot 125")  

![Godot 126](https://github.com/To-Fujita/Images/blob/master/Godot-126.jpg "Godot 126")  

![Godot 127](https://github.com/To-Fujita/Images/blob/master/Godot-127.jpg "Godot 127")  

![Godot 128](https://github.com/To-Fujita/Images/blob/master/Godot-128.jpg "Godot 128")  

![Godot 129](https://github.com/To-Fujita/Images/blob/master/Godot-129.jpg "Godot 129")  

![Godot 130](https://github.com/To-Fujita/Images/blob/master/Godot-130.jpg "Godot 130")  

![Godot 131](https://github.com/To-Fujita/Images/blob/master/Godot-131.jpg "Godot 131")  

![Godot 132](https://github.com/To-Fujita/Images/blob/master/Godot-132.jpg "Godot 132")  

![Godot 133](https://github.com/To-Fujita/Images/blob/master/Godot-133.jpg "Godot 133")  

![Godot 134](https://github.com/To-Fujita/Images/blob/master/Godot-134.jpg "Godot 134")  

![Godot 135](https://github.com/To-Fujita/Images/blob/master/Godot-135.jpg "Godot 135") 

### Step-4: 


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
