extends WindowDialog
# Confirm Window

var popup
var Temp

func _ready():
	pass 


func _on_Button_02_pressed():
	self.show()
	


func _on_YES_Button_pressed():
	Temp = get_tree().change_scene("res://Node_Menu.tscn")
	


func _on_NO_Button_pressed():
	self.hide()


