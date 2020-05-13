extends Node
const box = preload("res://scenes/Menus/PartyEdit/UnitList/unitMark.tscn")
func _ready():
	loadUnits()

func loadUnits():
	var Horizontal = HBoxContainer.new()
	var i = 1
	var Un = PlayerProgress.desbloquedas
	var unitTemp = box.instance()
	unitTemp.setUnit(dUnits.UnitList["0"]["img"],true)
	Horizontal.add_child(unitTemp)
	for u in Un:
		unitTemp = box.instance()
		unitTemp.setUnit(dUnits.UnitList[u]["img"],false)
		Horizontal.add_child(unitTemp)
		i = i+1
		if(i%5==0 or i==len(Un)):
			$UnitsList/vertical/CenterContainer/VBoxContainer.add_child(Horizontal)
			print("horizontal insertado")
			Horizontal = HBoxContainer.new()
	print("longitud",len(Un)+1)
	print("i",i)
