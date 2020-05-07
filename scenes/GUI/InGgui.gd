extends CanvasLayer
var screen_size
var menu
var menuy
var pos 
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport().get_visible_rect().size
	menu = screen_size.x/1160
	menuy = screen_size.y/1700
	pos = Vector2(0,get_viewport().get_visible_rect().size.y-(get_viewport().get_visible_rect().size.y/2.28))
	$PanelContainer.rect_scale = Vector2(menu,menuy)
	$PanelContainer.rect_position = pos

func _process(delta):	
	pass
