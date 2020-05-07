extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Unit1.set_data(preload("res://Sprites/Characters/Mayo/Animaciones.tres"),load("res://Sprites/Characters/Mayo/mayo.png"))
	$CanvasLayer/PanelContainer/HBoxContainer/Control.get_node("HBoxContainer/VBoxContainer/Personaje/perfil").texture = $Unit1/Sprite.texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
