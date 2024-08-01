extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	queue_redraw()

func _draw():
	draw_arc(Vector2(0,0) , 30, 0, 360, 64, Color(get_parent().cor,get_parent().cor,get_parent().cor), 1.0)
