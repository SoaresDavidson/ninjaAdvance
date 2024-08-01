class_name MoveComponent

extends Node
@export var actor: Node2D

func _physics_process(delta):
	if actor.died:
		return
	actor.position.x += actor.speed * delta * actor.direction
