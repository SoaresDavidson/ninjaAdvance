extends Node2D

@onready var timer = $Timer
@onready var label_2 = $Label2
var u = -0.4
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()
	timer.timeout.connect(func():
		LevelMusic.get_child(GlobalVars.index).stop()
		get_tree().change_scene_to_file(GlobalVars.fases[GlobalVars.index])
		GlobalVars.index += 1
		)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(u)
	label_2.add_theme_color_override("font_color",Color(255, 255, 255, u))
	u+=0.1 * delta
