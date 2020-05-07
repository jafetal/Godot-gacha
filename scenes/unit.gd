extends KinematicBody2D
# Declare member variables here. Examples:
# Called when the nodes enters the scene tree for the first time.
func _ready():
	pass

func set_data(ranimacion,perfil):
	$AnimatedSprite.set_sprite_frames(ranimacion)
	$AnimatedSprite.play("idle")
	$Sprite.texture = perfil
	$Sprite.hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
