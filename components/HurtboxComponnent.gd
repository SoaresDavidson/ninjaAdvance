extends Area2D
class_name HurtboxComponent
@export var actor: Node2D
@export var animated_sprite:AnimatedSprite2D

func _ready():
	body_entered.connect(func(body):
		if body is Player:
			actor.killed = true
			animated_sprite.play("slash")
			actor.direction = 0
			animated_sprite.z_index = 3
			body.die()
			)
		
