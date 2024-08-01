extends Area2D
class_name HitboxComponent
@export var actor: Node2D
@export var animated_sprite: AnimatedSprite2D
@export var collision_shape_hitbox:CollisionShape2D
@export var collision_shape_hurtbox:CollisionShape2D
var damaged_function: Callable

func _ready():
	area_exited.connect(func(area):
		if area.get_parent() is Player:
			area.get_parent().disconnect("damaged",damaged_function)
		)
	
	area_entered.connect(func(area):
		var player = area.get_parent()
		if not player is Player:
			return
		damaged_function = Callable(func(value):
			if not value and player.global_position.y - global_position.y < 0:
				player.velocity.y = -400
			actor.shake_component.tween_shake()
			actor.flash_component.flash()
			actor.scale_component.tween_scale()
			collision_shape_hitbox.disabled = true
			collision_shape_hurtbox.disabled = true
			actor.died = true
			animated_sprite.play("death")
			animated_sprite.z_index = -1
			await animated_sprite.animation_finished
			actor.queue_free()
			)
			
		player.connect("damaged",damaged_function)
	)
	
