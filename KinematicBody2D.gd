extends KinematicBody2D

const GRAVITY = 20
const UP = Vector2(0, -1)
const JUMP = -400

var motion = Vector2()
var scene = preload("res://Projectile.tscn")
var node = scene.instance()

#func _ready():
#	set_process(true)

func _physics_process(delta):
	motion.y += GRAVITY 
	
	if Input.is_action_pressed("ui_right"):
		motion.x = 300
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -300
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Run")
	else: 
		$AnimatedSprite.play("Idle")
		motion.x = 0
		
	if Input.is_action_pressed("ui_down"):
		$AnimatedSprite.play("Aim")
	
	if Input.is_action_pressed("ui_accept"):
		$AnimatedSprite.play("Shoot_1")
		add_child(node)
		
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP


	
	motion = move_and_slide(motion, UP)
	pass 