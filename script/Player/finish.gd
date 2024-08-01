extends Node2D

@onready var area_2d = $Area2D
@onready var victory_sound = $VictorySound
@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	area_2d.area_entered.connect(func(area):
		if not area.get_parent() is Player:
			return
		area.get_parent().died = true
		area.get_parent().speed /= 4
		area.get_parent().animated_sprite.play("running")
		LevelMusic.get_child(GlobalVars.index).stop()
		victory_sound.play()
		await victory_sound.finished
		timer.start()
		await timer.timeout
		
		get_tree().change_scene_to_file(GlobalVars.fases[GlobalVars.index])
		GlobalVars.index += 1
		)
func _process(delta):
	pass
