extends Enemy
@onready var move_component = $MoveComponent
@onready var keep_direction = $KeepDirection
@onready var timer = $Timer


var seen:bool = false


func _process(delta):
	manageSprites();

func _on_visible_on_screen_enabler_2d_screen_entered():
	keep_direction.queue_free()

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()

func manageSprites() -> void:
	if not is_on_floor() and not seen:
		animated_sprite_2d.play("jump")
		return
	
	if not seen:
		animated_sprite_2d.play("running")
	if (ninja.global_position.y >= global_position.y or abs(ninja.global_position.x - global_position.x) < 320) and not seen:
		seen = true
		speed = 0
		animated_sprite_2d.play("ready")
		await animated_sprite_2d.animation_finished
		animated_sprite_2d.play("running2")
		speed = 600
