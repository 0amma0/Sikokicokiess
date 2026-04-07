extends TextureButton
@onready var mangkok = get_node("../MangkokCoklat")
@onready var next_button = get_node("../NextButton")
@onready var pisau = get_node("../pisau")

var klik = 0
var bisa_potong = true

func potong():

	if !bisa_potong:
		return

	bisa_potong = false

	$SuaraPotong.play()

	klik += 1

	if klik == 1:
		texture_normal = load("res://cokelat_2.png")

	elif klik == 2:
		texture_normal = load("res://cokelat_4.png")

	elif klik == 3:
		texture_normal = load("res://cokelat_6.png")

	elif klik >= 4:
		texture_normal = load("res://cokelat_bubuk.png")
		await get_tree().create_timer(5).timeout
		self.visible = false
		pisau.visible = false
		get_node("./FinishSound").play()
		mangkok.visible = true
		$MangkokAnim.play("Muncul_mangkok")
		await get_tree(). create_timer(0.6).timeout
		get_node("Bgorang").visible = true
		next_button.visible = true
		

	$TimerPotong.start()

func _on_timer_potong_timeout():
	bisa_potong = true
