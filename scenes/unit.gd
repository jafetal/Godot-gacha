extends KinematicBody2D

onready var sprite = $AnimatedSprite

var ANIM_STATE = [
	"arts",
	"attack",
	"idle",
	"truearts"
]
var current_anim

func _ready():
	pass

func set_data(ranimacion,perfil):
	sprite.set_sprite_frames(ranimacion)
	idle()
	$Sprite.texture = perfil
	$Sprite.hide()

func attack():
	if(current_anim=="idle"):
		play_anim("attack")
	
func arts():
	idle()
	$TimerArts.start()
	
func true_arts():
	play_anim("truearts")
	
func idle():
	play_anim("idle")
	
func play_anim(animacion):
	current_anim = animacion
	sprite.play(current_anim)


func _on_AnimatedSprite_animation_finished():
	idle()

func _on_TimerArts_timeout():
	play_anim("arts")
	$TimerArts.stop()
