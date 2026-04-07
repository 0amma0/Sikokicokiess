extends Node2D

@onready var lbl1 = $"CanvasLayer/UI/Lbl_bahan1"
@onready var lbl2 = $"CanvasLayer/UI/Lbl_bahan2"
@onready var lbl3 = $"CanvasLayer/UI/Lbl_bahan3"
@onready var lbl4 = $"CanvasLayer/UI/Lbl_bahan4"
@onready var lbl5 = $"CanvasLayer/UI/Lbl_bahan5"
@onready var lbl6 = $"CanvasLayer/UI/Lbl_bahan6"
@onready var lbl7 = $"CanvasLayer/UI/Lbl_bahan7"
@onready var lbl8 = $"CanvasLayer/UI/Lbl_bahan8"
@onready var lbl9 = $"CanvasLayer/UI/Lbl_bahan9"
@onready var lbl10 = $"CanvasLayer/UI/Lbl_bahan10"
@onready var step1 = $"CanvasLayer/UI/Lbl_talenan"

func _ready():
	print("DATA DARI SCENE 1:", GlobalData.selected_ingredients)
	
	var icons := []

	icons = [lbl1, lbl2, lbl3, lbl4, lbl5, lbl6, lbl7, lbl8, lbl9, lbl10, step1]

	# kosongkan semua icon dulu
	for i in icons:
		i.texture = null
		i.visible = false

	var bahan = GlobalData.selected_ingredients

	for i in bahan.size():
		if i >= icons.size():
			break

		var path = "res://%s.png" % bahan[i]
		print("LOAD PATH:", path)
		icons[i].texture = load(path)
		icons[i].visible = true
