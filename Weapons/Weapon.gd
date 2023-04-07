extends Node2D
class_name Weapon

signal weapon_fired_bullet(bullet, position, direction)

var bullet = preload("res://Weapons/bullet.tscn")

@onready var gun_barrel = $GunBarrel
@onready var gun_direction = $GunDirection
@onready var shot_cooldown = $ShotCooldown
@onready var animation_player = $AnimationPlayer

func shoot():
	if shot_cooldown.is_stopped():
		var bullet_instance = bullet.instantiate()
		var direction = (gun_direction.global_position - gun_barrel.global_position)
		GlobalSignals.emit_signal("bullet_fired", bullet_instance, gun_barrel.global_position, direction)
		shot_cooldown.start()
		animation_player.play("MuzzleFlash")
