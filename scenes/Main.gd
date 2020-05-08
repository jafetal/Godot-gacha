extends Node
func _ready():
	SceneSwitcher.change_scene("res://scenes/Nivel.tscn", {"location":"Nivel1","nivel":2})
