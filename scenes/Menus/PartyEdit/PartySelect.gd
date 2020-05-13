extends Node

func _ready():
	pass


func _on_TextureButton_button_down():
		SceneSwitcher.change_scene("res://scenes/Menus/PartyEdit/UnitList/Party.tscn", {"location":"Nivel1","nivel":2})
