extends Node2D

@onready var player_weapon = $Player/Weapon
@onready var bullet_manager = $BulletManager

func _ready():
	GlobalSignals.bullet_fired.connect(bullet_manager.handle_bullet_spawned)
