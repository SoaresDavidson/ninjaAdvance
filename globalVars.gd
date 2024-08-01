extends Node
var fases = [
	"res://scenes/fases/fase_0.tscn",
	"res://scenes/fases/fase_1.tscn",
	"res://scenes/fases/fase_2.tscn",
	"res://scenes/fases/fase_3.tscn",
	"res://scenes/fases/fase_4.tscn",
	"res://scenes/fases/fase_5.tscn",
	"res://scenes/fases/fase_6.tscn",
	"res://scenes/finish.tscn"
]

signal index_changed

var index = 0:
	set(value):
		index = value % fases.size()
		print(index)
		emit_signal("index_changed")
