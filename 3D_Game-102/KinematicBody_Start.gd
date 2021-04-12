extends KinematicBody






func _ready():
	pass


func _on_CollisionShape_tree_entered():
	var Block_size = get_node("..").Block_size
	var MZ_x = get_node("../../Control/VBoxContainer/HBoxContainer").MZ_x
	var MZ_y = get_node("../../Control/VBoxContainer/HBoxContainer").MZ_y
	if (body.name == ):
		Wanderer.transform.origin.x = Block_size / 2 + (1 - MZ_x / 2) * Block_size
		Wanderer.transform.origin.y = 0
		Wanderer.transform.origin.z = Block_size / 2 + (1 - MZ_y / 2) * Block_size
		M_vector = Vector3(0, 0, 0)
		Wanderer_flag = 1
