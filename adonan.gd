extends TextureRect

@export var sound_tuang: NodePath
@export var mix_node: NodePath

@onready var s_tuang = get_node(sound_tuang)
@onready var mix = get_node(mix_node)
@onready var sound_mix = $SoundMix
@export var next_button_path: NodePath
@onready var next_button = get_node(next_button_path)
var tex_tepung = preload("res://mangkoktepung.png")
var tex_coklat = preload("res://mangkoktepcok.png")
var tex_mentega = preload("res://mangkoktepcokga.png")
var tex_telur = preload("res://mangkoktepcokgalur.png")
var tex_susu = preload("res://mangkoktepcokgalursu.png")
var step =0

func _ready():
	pivot_offset = size / 2

func tambah_bahan(nama):

	print("SEBELUM:", step)

	if nama == "tepung" and step == 0:
		texture = tex_tepung
		step = 1
		print("JADI STEP:", step)

	elif nama == "cokelat" and step == 1:
		texture = tex_coklat
		step = 2
		print("JADI STEP:", step)

	elif nama == "mentega" and step == 2:
		texture = tex_mentega
		step = 3
		print("JADI STEP:", step)

	elif nama == "telur" and step == 3:
		texture = tex_telur
		step = 4
		print("JADI STEP:", step)

	elif nama == "susu" and step == 4:
		texture = tex_susu
		step = 5
		print("JADI STEP:", step)
		mix.visible = true
		
func mulai_mix():
	print("MIX MULAI")
	sound_mix.play()
	var durasi = 2.0
	var waktu = 0.0

	var sudah_setengah = false
	var sudah_setengah2 = false
	var sudah_mix = false
	
	while waktu < durasi:
		rotation += 0.1  # kecepatan putar
		
		# ubah texture DI TENGAH PROSES
		if waktu > durasi * 0.3 and not sudah_setengah:
			texture = load("res://adonan_setengah.png")
			sudah_setengah = true

		if waktu > durasi * 0.6 and not sudah_setengah2:
			texture = load("res://adonan_setengah2.png")
			sudah_setengah2 = true

		await get_tree().process_frame
		waktu += get_process_delta_time()

	rotation = 0

	# hasil akhir (sekali aja)
	texture = load("res://adonan_jadi.png")
	sound_mix.stop()
	print("MIX SELESAI")
	get_node("./FinishSound").play()
	next_button.visible = true
