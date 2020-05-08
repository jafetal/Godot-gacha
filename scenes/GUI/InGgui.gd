extends CanvasLayer
var screen_size
var menu
var menuy
var pos
var illustration = load("res://Sprites/Units_il/Mayo/Mayo.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	menu_ajustement()
	unit_initialize(load("res://Sprites/Characters/Mayo/Animaciones.tres"),illustration)
	
	
# warning-ignore:unused_argument
func _process(delta):	
	pass

func unit_initialize(animations,illus):
	var perfil = AtlasTexture.new()
	perfil.set_atlas(illustration)
	perfil.set_region(Rect2(120, 0, 300, 300))
	$Control/PanelContainer/HBoxContainer/ControlUnit1/HBoxContainer/VBoxContainer/Personaje/perfil.texture = perfil
	$Units/unit.set_data(animations,illus)

#Arts
func _on_Button_button_down():
	get_tree().paused = true
	$Units/unit.arts()
	$AnimationPlayer/Sprite.texture = load("res://Sprites/Units_il/Mayo/Mayo.png")
	$AnimationPlayer.stop()
	$AnimationPlayer.play("Enter")


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
