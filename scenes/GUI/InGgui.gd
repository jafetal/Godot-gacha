extends CanvasLayer
var screen_size
var menu
var menuy
var pos 

# Called when the node enters the scene tree for the first time.
func _ready():
	$unit.set_data(preload("res://Sprites/Characters/Mayo/Animaciones.tres"),load("res://Sprites/Characters/Mayo/mayo.png"))
	$Control/PanelContainer/HBoxContainer/Control/HBoxContainer/VBoxContainer/Personaje/perfil.texture = load("res://Sprites/Characters/Mayo/mayo.png")
	screen_size = get_viewport().get_visible_rect().size
	menu = screen_size.x/1160
	menuy = screen_size.y/1700
	pos = Vector2(0,get_viewport().get_visible_rect().size.y-(get_viewport().get_visible_rect().size.y/2.28))
	$Control/PanelContainer.rect_scale = Vector2(menu,menuy)
	$Control/PanelContainer.rect_position = pos
	
func _process(delta):	
	pass


func _on_Button_button_down():
	$unit.attack()
