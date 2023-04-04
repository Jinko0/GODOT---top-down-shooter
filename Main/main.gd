extends Node2D

@onready var player_weapon = $Player/Weapon
@onready var bullet_manager = $BulletManager

func _ready():
	player_weapon.weapon_fired_bullet.connect(bullet_manager.handle_bullet_spawned)
