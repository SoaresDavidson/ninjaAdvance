extends Enemy
var u:float
var v:float

func _physics_process(delta):
	position.y += sin(u*delta) * 2
	position.x -= sin(v*delta) * 2
	#position.x += -direction * delta * 50
	u+=3
	v+=0.75
	is_dead(delta)
		
func is_dead(delta: float):
	if died or killed:
		move_and_slide()
		velocity.y += gravity * delta 
		return
