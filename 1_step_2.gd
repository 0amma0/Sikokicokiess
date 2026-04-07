extends Node2D


func _on_lbl_bahan_1_pressed():
	print("BTN 1")
	#GlobalData.add_ingredient("bahan1")
	
func _on_button_pressed():
	print("cook di klik")
	print("isi bahan:",GlobalData.selected_ingredients)
	get_tree().change_scene_to_file("res://bgalattal.tscn")


func _on_lbl_talenan_pressed():
	print("BTN")
	#GlobalData.add_ingredient("talenan")
