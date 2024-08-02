class_name Enemy
extends CharacterBody2D

@onready var ninja = $"/root/Fase/Ninja"
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var hit_box = $HitBox
@onready var hurt_box = $HurtBox
@onready var collision_shape_hitbox = $HitBox/CollisionShape2D
@onready var collision_shape_hurtbox = $HurtBox/CollisionShape2D2
@onready var shake_component = $ShakeComponent
@onready var flash_component = $FlashComponent
@onready var scale_component = $ScaleComponent
@onready var attack_sound = $AttackSound

@export var speed:float
var died:bool = false
var killed:bool = false
var direction:float = 1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	move_and_slide()
	velocity.y += gravity * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
