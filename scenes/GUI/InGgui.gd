extends CanvasLayer
var screen_size
var menu
var menuy
var pos
var illustration = load("res://Sprites/Units_il/Mayo/Mayo.png")
var listo1 = 0
var skillCT1 = 100
var u1Atacking = false
onready var unit1d = dUnits.getUnit1()

onready var elements = {
	"u1": $Units/unit,
	"u1SkillRt": $Control/PanelContainer/HBoxContainer/ControlUnit1/TimersSkill/skillRt,
	"u1ArtsCounter": $Control/PanelContainer/HBoxContainer/ControlUnit1/ArtsCounter1
	}
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	$Control/PanelContainer/HBoxContainer/ControlUnit1/HBoxContainer/VBoxContainer/Personaje/skill.value = skillCT1
	menu_ajustement()
	initialize_artsgauge()
	unit_initialize(unit1d["AnimTree"],unit1d["img"],1)

func unit_initialize(animations,illus,slot):
	var perfil = AtlasTexture.new()
	perfil.set_atlas(illus)
	perfil.set_region(Rect2(120, 0, 250, 250))
	if(slot==1):
		$Control/PanelContainer/HBoxContainer/ControlUnit1/HBoxContainer/VBoxContainer/Personaje/perfil.texture = perfil
		elements["u1"].set_data(animations,illus)
		var T_atk = $Control/PanelContainer/HBoxContainer/ControlUnit1/Unit1Atack_timer
		T_atk.wait_time = unit1d["atk_speed"]
		T_atk.start()


func selectMovement(cskillRT,timerArts,unit,perfil,perfilawk):
	if(listo1==0):
		cskillRT.start()
	elif(listo1==1):
		timerArts.stop()
		get_tree().paused = true
		unit.arts()
		mostrarArts(perfil,1) #1 = arts, 2 = true arts
	elif(listo1==2):
		get_tree().paused = true
		$Units/unit.true_arts()
		mostrarArts(perfilawk,2)
	listo1 += 1
	timerArts.start()

#Desplega el letrero de arts o true arts, segun sea el caso, usando los recursos de la unidad
func mostrarArts(imagen,tipo):
	u1Atacking = true
	$AnimationPlayer/Sprite.texture = imagen
	$AnimationPlayer.stop()
	$AnimationPlayer.play("Enter")
	if(tipo==1):
		playsSound(load("res://sound/Arts.wav"))
	else:
		playsSound(load("res://sound/TrueArts.wav"))

func playsSound(sound):
	$AnimationPlayer/artsSound.stream = sound
	$AnimationPlayer/artsSound.play()

func menu_ajustement():
	screen_size = get_viewport().get_visible_rect().size
	menu = screen_size.x/1160
	menuy = screen_size.y/1700
	pos = Vector2(0,get_viewport().get_visible_rect().size.y-(get_viewport().get_visible_rect().size.y/2.28))
	$Control/PanelContainer.rect_scale = Vector2(menu,menuy)
	$Control/PanelContainer.rect_position = pos

func callSkill(unit, tskillCT, skillrt):
	if(skillCT1>=100 and !u1Atacking):
		unit.skill()
		playsSound(load("res://sound/skill.wav"))
		tskillCT.start()
		skillCT1 = 0
	skillrt.stop()

func initialize_artsgauge():
	var bar = AtlasTexture.new()
	bar.set_atlas(load("res://Sprites/GUI/artsGauge.png"))
	bar.set_region(Rect2(0, 0, 260, 25))	
	$Control/PanelContainer/HBoxContainer/ControlUnit1/HBoxContainer/VBoxContainer/Gauge/Arts.texture_progress = bar

#controles Unit1 (cskillRT,timerArts,unit,perfil,perfilawk)
func _on_Button_button_down():
	selectMovement(elements["u1SkillRt"],elements["u1ArtsCounter"],elements["u1"],unit1d["img"],unit1d["imgAwk"])	
func _on_skillCT_timeout():#Recarga de skill
	if(skillCT1<100):
		skillCT1 += (5 / float(unit1d["skillCool"]))
	$Control/PanelContainer/HBoxContainer/ControlUnit1/HBoxContainer/VBoxContainer/Personaje/skill.value = skillCT1
func _on_skillRt_timeout():#Despues de un retraso se activa la skill
	callSkill(elements["u1"],$Control/PanelContainer/HBoxContainer/ControlUnit1/TimersSkill/skillCT,$Control/PanelContainer/HBoxContainer/ControlUnit1/TimersSkill/skillRt)
func _on_Unit1Atack_timer_timeout():#Ataque continuo
	elements["u1"].attack()
	print("atacando")
func _on_unit_acabo():#unidad 1 termino de hacer sus arts
	u1Atacking = false


func _on_Gauge_test_timeout():
	$Control/PanelContainer/HBoxContainer/ControlUnit1/HBoxContainer/VBoxContainer/Gauge/Arts.value += 1 

func _on_ArtsCounter1_timeout():
	if(listo1>0):
		listo1=0

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().paused = false

