extends CenterContainer
signal click
func _ready():
	
	pass
	
func setUnit(illus,nothing):
	#$btn.rect_scale = Vector2(0.5,0.5)
	if(!nothing):
		var perfil = AtlasTexture.new()
		perfil.set_atlas(illus)
		perfil.set_region(Rect2(120, 0, 250, 250))
		$panel/UnitImg.texture = perfil
	else:
		$panel/UnitImg.texture = illus
	
	
