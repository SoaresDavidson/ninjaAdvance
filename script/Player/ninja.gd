class_name Player
extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var killzone = $"../Killzone"
@onready var timer = $Timer
@onready var action_space = $ActionSpace
@onready var hitbox = $Hitbox
@onready var scale_component = $ScaleComponent
@onready var flash_component = $FlashComponent
@onready var shake_component = $ShakeComponent
@onready var attack_sound = $AttackSound
@onready var jump_sound = $JumpSound
@onready var killed_sound = $KilledSound


signal killed
signal direction_changed(value)
signal damaged(value)

var cor = 0
var direction_guard = 1
var direction: int = 1:
	set(value):
		direction = value
		emit_signal("direction_changed",value)


var speed = 100.0
const JUMP_VELOCITY = -400.0
var menu:bool = true
var walking:bool = true
var slashing:bool = true
var died = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var fall_gravity: float = 1250


func get_gravity():
	if velocity.y < 0:
		return gravity
	return fall_gravity

func _ready():
	direction = 0
	action_space.area_exited.connect(func(area):
		if not action_space.has_overlapping_areas():
			walking = true
			cor = 0
		)
	action_space.area_entered.connect(func(area):
		cor = 255
		walking = false
		)


func _physics_process(delta):
	move_and_slide()
	velocity.x = speed * direction
	velocity.y += get_gravity() * delta
	
	if died: return
	#if Input.is_action_just_pressed("ui_down"):
		#direction *= -1
		#direction_guard *= -1
		#if direction < 0:
			#animated_sprite.flip_h = true
		#if direction > 0:
			#animated_sprite.flip_h = false
			
	if slashing:
		if is_on_floor():
			if direction == 0:
				animated_sprite.play("default")
			else:
				animated_sprite.play("running")
		else:
			animated_sprite.play("jump")
	
	#if Input.is_action_pressed("ação"):
		#pressed += 0.01
		#if pressed >= 0.15:
			#direction = 0
			
	if Input.is_action_just_pressed("ação"):
		if not walking:
			slash()
			return
		if walking and (is_on_floor() or (is_on_wall_only() and velocity.y < 0)):
			jump_sound.play()
			if is_on_wall_only():
				direction_guard *= -1
				if animated_sprite.flip_h:
					animated_sprite.flip_h = false
				else:
					animated_sprite.flip_h = true 
			velocity.y = JUMP_VELOCITY
			direction = direction_guard
			animated_sprite.play("jump")
		#pressed = 0
	if Input.is_action_just_released("ação") and velocity.y < 0:
		velocity.y = JUMP_VELOCITY / 4
		
func slash():
	attack_sound.play()
	emit_signal("damaged",is_on_floor())
	slashing = false
	animated_sprite.play("slash")
	walking = true
	await animated_sprite.animation_finished
	slashing = true

func die():
	if died:
		return
	killed_sound.play()
	died = true
	scale_component.tween_scale()
	flash_component.flash()
	shake_component.tween_shake()
	direction = 0
	animated_sprite.play("death")
	await animated_sprite.animation_finished
	emit_signal("killed")

