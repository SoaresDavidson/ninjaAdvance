class_name Background
extends ParallaxBackground


@onready var ninja = $"../Ninja"


@onready var parallax_layer = $ParallaxLayer
@onready var parallax_layer_2 = $ParallaxLayer2
@onready var parallax_layer_3 = $ParallaxLayer3
@onready var parallax_layer_4 = $ParallaxLayer4
@onready var parallax_layer_5 = $ParallaxLayer5
@onready var parallax_layer_6 = $ParallaxLayer6

var direction = 0
func _ready():
	ninja.direction_changed.connect(func(value):
		direction = value)

func _process(delta):
	parallax_layer.motion_offset.x -= 5 * delta
	parallax_layer_2.motion_offset.x -= 5 * delta * direction
	parallax_layer_3.motion_offset.x -= 25 * delta * direction
	parallax_layer_4.motion_offset.x -= 25 * delta * direction
	parallax_layer_5.motion_offset.x -= 30 * delta * direction
	parallax_layer_6.motion_offset.x -= 50 * delta * direction
