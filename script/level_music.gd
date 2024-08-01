extends Node2D


func _ready():
	GlobalVars.index_changed.connect(func():
		get_child(GlobalVars.index).play())
	get_child(GlobalVars.index).play()

