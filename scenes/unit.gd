extends KinematicBody2D

onready var sprite = $AnimatedSprite
signal acabo
var ANIM_STATE = [
	"arts",
	"attack",
	"idle",
	"truearts"
]
var current_anim
var state = 0 # 2.-arts, 3.-T.Arts
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
	state = 2
	$TimerArts.start()
	
func true_arts():
	idle()
	state = 3
	$TimerArts.start()
	
func skill():
	idle()
	play_anim("skill")

func idle():
	play_anim("idle")
	
func play_anim(animacion):
	current_anim = animacion
	sprite.play(current_anim)


func _on_AnimatedSprite_animation_finished():
	idle()
	emit_signal("acabo")

func _on_TimerArts_timeout():
	if(state==2):
		play_anim("arts")
	elif(state==3):
		play_anim("trueArts")
	
	$TimerArts.stop()
