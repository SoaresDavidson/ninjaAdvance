extends Enemy

func _physics_process(delta):
	move_and_slide()
	velocity.y += gravity * delta
	if died or killed:
		return
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("default")
		else:
			animated_sprite_2d.play("running")
	else:
		animated_sprite_2d.play("jump")
