extends Node2D

@onready var player = $Player
@onready var bullet_manager = $BulletManager

func _ready():
	player.player_fired_bullet.connect(bullet_manager.handle_bullet_spawned)
