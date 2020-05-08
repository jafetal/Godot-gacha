extends Node
func _ready():
	var current_location = SceneSwitcher.get_param("location")
	var nivel = SceneSwitcher.get_param("nivel")
	print(current_location)
	print(nivel)
