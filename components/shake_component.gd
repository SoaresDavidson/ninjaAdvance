class_name ShakeComponent
extends Node

@export var node: Node2D
@export var shake_amount: = 2.0
@export var shake_duration: = 0.4

var shake = 0
var original_position: Vector2

func _ready():
	original_position = node.position

func tween_shake():
	shake = shake_amount
	var tween = create_tween()
	tween.tween_property(self, "shake", 0.0, shake_duration).from_current()

func _physics_process(delta: float) -> void:
	if shake > 0:
		node.position = original_position + Vector2(randf_range(-shake, shake), randf_range(-shake, shake))
	else:
		node.position = original_position
