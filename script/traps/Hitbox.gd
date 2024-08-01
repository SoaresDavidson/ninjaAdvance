class_name Hitbox
extends Area2D

var damaged_function:Callable

func _ready():
	area_entered.connect(func(area):
		var actor = area.get_parent()
		var dist = actor.global_position.y - global_position.y
		if actor is Player:
			damaged_function = (func(value):
				if dist < 0:
					actor.velocity.y = -400
				if actor.global_position.y - global_position.y > 0:
					actor.velocity.y = 200
				)
			actor.connect("damaged", damaged_function)
		)
		
	area_exited.connect(func(area):
		if area.get_parent() is Player:
			area.get_parent().disconnect("damaged", damaged_function)
		)
