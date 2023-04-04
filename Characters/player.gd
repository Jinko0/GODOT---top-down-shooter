extends CharacterBody2D

@onready var weapon = $Weapon 

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
		weapon.shoot()

