extends Enemy

func _physics_process(delta):
	if died or killed:
		return
	animated_sprite_2d.rotation += 0.15
	gravity = 0
