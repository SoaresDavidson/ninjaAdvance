extends Node2D


@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var ninja = $"/root/Fase/Ninja"
@onready var shake_component = $ShakeComponent
@onready var scale_component = $ScaleComponent
@onready var flash_component = $FlashComponent
@onready var timer = $Timer

var killed:bool = false
var died:bool = false
var u:float = 255
var direction = 1
var velocity: Vector2
var ghost_direction = direction

func _ready():
	timer.start()
	animated_sprite_2d.modulate = Color(1, 1, 1 , 0)
	
func _physics_process(delta):
	manageGhost(delta)
	
func manageGhost(delta : float) -> void:
	if killed or died: 
		if died:
			position.y += 150 * delta 
			animated_sprite_2d.flip_v = true
		return
		
	u += 0.5 if ninja.direction else -5
	if u > 80: u = 80
	if u < 0: u = 0
	
	animated_sprite_2d.modulate = Color(1, 1, 1 , u*delta)
	
	if u < 80:
		ghost_direction = direction
		position.y = move_toward(position.y, ninja.global_position.y, delta*100)
		position.x = move_toward(position.x, ninja.global_position.x - (270 * direction), delta*150)
	else:
		position.x += 200 * delta * ghost_direction 
		if global_position.x > ninja.global_position.x + 300 or global_position.x < ninja.global_position.x - 300:
			u = 0
	animated_sprite_2d.play("default")
