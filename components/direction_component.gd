class_name DirectionComponent
extends Node

@export var actor:Node2D
@export var animated_sprite:AnimatedSprite2D
@onready var ninja = $"/root/Fase/Ninja"

func _ready():
	var dist = ninja.global_position.x - actor.global_position.x
	if dist > 0:
		animated_sprite.flip_h = false
		actor.direction = 1
	if dist < 0:
		animated_sprite.flip_h = true
		actor.direction = -1
