extends Node2D
@onready var menu_select = $MenuSelect
@onready var ninja_menu = $NinjaMenu
@onready var timer = $Timer
@onready var camera_2d = $Camera2D
@onready var start = $start
@onready var label = $Label
@onready var timer_2 = $Timer2
var pressed:bool = false

func _process(delta):
	if Input.is_action_just_pressed("ação") and not pressed:
		pressed = true
		camera_2d.position.y = 200
		timer.start()
		menu_select.play()
		await timer.timeout
		ninja_menu.direction = 1
		timer_2.start()
		await timer_2.timeout
		LevelMusic.get_child(GlobalVars.index).stop()
		get_tree().change_scene_to_file(GlobalVars.fases[GlobalVars.index])
		GlobalVars.index += 1
	camera_2d.position.y += delta * 30
	if camera_2d.position.y > 250:
		start.visible = true
