class_name KeepLooking
extends Node

@export var actor:Node2D
@export var animated_sprite:AnimatedSprite2D
@onready var ninja = $"/root/Fase/Ninja"

func _process(delta):
	if not actor.died:
		var dist = ninja.global_position.x - actor.global_position.x
		if dist > 0:
			animated_sprite.flip_h = false
		if dist < 0:
			animated_sprite.flip_h = true
