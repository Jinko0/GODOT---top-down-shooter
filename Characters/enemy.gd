extends CharacterBody2D

@onready var stats_manager = $StatsManager
@onready var ai = $AI
@onready var weapon = $Weapon

func _ready():
	ai.initialize(self, weapon)

func handle_hit():
	stats_manager.health -= 20
	if stats_manager.health <= 0:
		queue_free()

