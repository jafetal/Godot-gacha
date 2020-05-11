extends Node
func _ready():
	menu_ajustement()
	pass

func menu_ajustement():
	var screen_size = get_viewport().get_visible_rect().size
	var menu = screen_size.x/1160
	var menuy = screen_size.y/1700
	var pos = Vector2(screen_size.x-screen_size.x/1.4,screen_size.y-(screen_size.y/1.2))
	$CenterContainer.rect_scale = Vector2(menu,menuy)
	$CenterContainer.rect_position = pos


func _on_quest_button_down():
	SceneSwitcher.change_scene("res://scenes/Nivel.tscn", {"location":"Nivel1","nivel":2})


func _on_units_button_down():
	SceneSwitcher.change_scene("res://scenes/Menus/Party.tscn", {"location":"Nivel1","nivel":2})
