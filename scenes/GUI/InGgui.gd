extends CanvasLayer
var screen_size
var menu
var menuy
var pos
var illustration = load("res://Sprites/Units_il/Mayo/Mayo.png")
var touchcount
var listo1 = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	menu_ajustement()
	initialize_artsgauge()
	unit_initialize(load("res://Sprites/Characters/Mayo/Animaciones.tres"),illustration)
	
	
# warning-ignore:unused_argument
func _process(delta):	
	pass

func unit_initialize(animations,illus):
	var perfil = AtlasTexture.new()
	perfil.set_atlas(illustration)
	perfil.set_region(Rect2(120, 0, 250, 250))
	$Control/PanelContainer/HBoxContainer/ControlUnit1/HBoxContainer/VBoxContainer/Personaje/perfil.texture = perfil
	$Units/unit.set_data(animations,illus)

#Arts
func _on_Button_button_down():
	touchcount = 0;
	if(listo1==1):
		$Control/PanelContainer/HBoxContainer/ControlUnit1/ArtsCounter1.stop()
		get_tree().paused = true
		$Units/unit.arts()
		mostrarArts(load("res://Sprites/Units_il/Mayo/Mayo.png"),1) #1 = arts, 2 = true arts
	if(listo1==2):
		get_tree().paused = true
		$Units/unit.true_arts()
		mostrarArts(load("res://Sprites/Units_il/Mayo/Mayo_awk.png"),2)
	listo1 += 1
	$Control/PanelContainer/HBoxContainer/ControlUnit1/ArtsCounter1.start()
	
func mostrarArts(imagen,tipo):
	$AnimationPlayer/Sprite.texture = imagen
	$AnimationPlayer.stop()
	$AnimationPlayer.play("Enter")
	if(tipo==1):
		$AnimationPlayer/artsSound.stream = load("res://sound/Arts.wav")
	else:
		$AnimationPlayer/artsSound.stream = load("res://sound/TrueArts.wav")
	$AnimationPlayer/artsSound.play()

func _on_Unit1Atack_timer_timeout():
	$Units/unit.attack()


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().paused = false
	

func menu_ajustement():
	screen_size = get_viewport().get_visible_rect().size
	menu = screen_size.x/1160
	menuy = screen_size.y/1700
	pos = Vector2(0,get_viewport().get_visible_rect().size.y-(get_viewport().get_visible_rect().size.y/2.28))
	$Control/PanelContainer.rect_scale = Vector2(menu,menuy)
	$Control/PanelContainer.rect_position = pos



func _on_Gauge_test_timeout():
	$Control/PanelContainer/HBoxContainer/ControlUnit1/HBoxContainer/VBoxContainer/Personaje/skill.value +=5
	$Control/PanelContainer/HBoxContainer/ControlUnit1/HBoxContainer/VBoxContainer/Gauge/Arts.value += 5

func initialize_artsgauge():
	var perfil = AtlasTexture.new()
	perfil.set_atlas(load("res://Sprites/GUI/artsGauge.png"))
	perfil.set_region(Rect2(0, 0, 260, 25))
	
	$Control/PanelContainer/HBoxContainer/ControlUnit1/HBoxContainer/VBoxContainer/Gauge/Arts.texture_progress = perfil



func _on_ArtsCounter1_timeout():
	if(listo1>0):
		listo1=0
