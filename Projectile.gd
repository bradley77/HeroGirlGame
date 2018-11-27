#Projectile.gd
extends Area2D 

const PROJECTILE_SPEED = 600

func _ready():
	set_process(true)

func _process(delta):
	var speed_x = 1
	var speed_y = 0
	var motion = Vector2(speed_x, speed_y) * PROJECTILE_SPEED
	self.position + motion * delta


