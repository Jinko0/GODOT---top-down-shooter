extends CharacterBody2D

signal player_fired_bullet(bullet, position, direction)

var bullet = preload("res://Bullets/bullet.tscn")

@onready var gun_barrel = $GunBarrel
@onready var gun_direction = $GunDirection
@onready var shot_cooldown = $ShotCooldown
@onready var animation_player = $AnimationPlayer

@export var move_speed : float = 100

func _physics_process(delta):
	
	### MOVEMENT ###
	var input_direction := Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	input_direction = input_direction.normalized()
	velocity = input_direction*move_speed

	move_and_slide()
	
	### DIRECTION ###
	look_at(get_global_mouse_position())
	
	### SHOOT ###
	if Input.is_action_just_pressed("shoot"):
		shoot()


func shoot():
	if shot_cooldown.is_stopped():
		var bullet_instance = bullet.instantiate()
		var direction_to_mouse = (gun_direction.global_position - gun_barrel.global_position)
		emit_signal("player_fired_bullet", bullet_instance, gun_barrel.global_position, direction_to_mouse)
		shot_cooldown.start()
		animation_player.play("MuzzleFlash")

