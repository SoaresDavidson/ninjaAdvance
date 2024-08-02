class_name RiseComponent
extends VisibleOnScreenEnabler2D

@export var enemy:CharacterBody2D
@onready var timer = $Timer
@export var wait_time: float

func _ready():
	enemy.get_child(5).queue_free() #should be a visible on screen enabler
	timer.timeout.connect(func():
		if enemy.is_in_group("green ninja"):
			enemy.keep_direction.queue_free())
		 
func _on_screen_entered():
	enemy.visible = true
	enemy.gravity *= -1
	enemy.speed /= 4
	
	timer.start(wait_time)
	await timer.timeout
	enemy.speed *= 4
	enemy.gravity *= -1
	queue_free()

