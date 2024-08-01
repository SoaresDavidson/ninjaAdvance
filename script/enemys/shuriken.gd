extends Enemy
@onready var spawner_component = $SpawnerComponent
@onready var timer = $Timer



func _ready():
	timer.start()
	hurt_box.area_entered.connect(func(area):
		if area.get_parent is Player:
			timer.stop()
		)
	timer.timeout.connect(func():
		if died:
			return
		animated_sprite_2d.play("throw")
		spawner_component.spawn()
		await animated_sprite_2d.animation_finished
		animated_sprite_2d.play("default")
		timer.start()
		)

	
