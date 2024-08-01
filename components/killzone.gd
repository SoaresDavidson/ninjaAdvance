extends Node2D

@onready var timer = $Timer
@onready var ninja = $"/root/Fase/Ninja"
var died = true

func _ready():
	ninja.killed.connect(func():
		if died:
			died = false
			get_tree().reload_current_scene()
		)

func _on_body_entered(body):
	if body is Player:
		timer.start()
		ninja.killed_sound.play()
		await timer.timeout
		body.emit_signal("killed")
