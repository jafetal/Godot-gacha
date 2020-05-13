extends Node

onready var unit1d = {
	"img": load("res://Sprites/Units_il/Mayo/Mayo.png"),
	"imgAwk": load("res://Sprites/Units_il/Mayo/Mayo_awk.png"),
	"AnimTree": load("res://Sprites/Characters/Mayo/Animaciones.tres"),
	"atk": 0,
	"def": 0,
	"hp": 0,
	"atk_speed": 3,
	"skillCool": 3,
}
onready var nothing= {
	"img": load("res://Sprites/Characters/noUnit.png")
}

onready var UnitList = {"0": nothing,
						"1": unit1d} 
func getUnit1():
	return unit1d


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
