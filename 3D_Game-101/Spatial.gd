extends Spatial


# Declare member variables here. Examples:
var Ground_x = 10
var Ground_y = 0
var Ground_z = 10
var Block_size = 2
var Player_x = 0
var Player_y = 0
var Player_z = 0


# Called when the node enters the scene tree for the first time.
func _ready():
#	pass # Replace with function body.
	Create_Ground()
	Create_Player()
	Create_Block()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# Create Ground
func Create_Ground():
	var Floor_org = load("res://StaticBody.tscn")

	for i in range(Ground_x):
		for j in range(Ground_z):
			var Floor = Floor_org.instance()
			add_child(Floor)
			Floor.transform.origin.x = Block_size / 2 + (i - Ground_x / 2) * Block_size
			Floor.transform.origin.y = -1
			Floor.transform.origin.z = Block_size / 2 + (j - Ground_z / 2) * Block_size


func Create_Player():
	var Player = get_node("KinematicBody")
	Player.set_scale(Vector3(1.0, 1.0, 1.0))
	Player.transform.origin.x = 0
	Player.transform.origin.y = 0
	Player.transform.origin.z = 0	


# Create Block
func Create_Block():
	var Block_org = load("res://StaticBody2.tscn")
	
	var Block = Block_org.instance()
	add_child(Block)
	Block.transform.origin.x = 3
	Block.transform.origin.y = 1
	Block.transform.origin.z = -2
	
