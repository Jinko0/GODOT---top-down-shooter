extends CharacterBody2D

@onready var stats_manager = $StatsManager

func handle_hit():
	stats_manager.health -= 20
	if stats_manager.health <= 0:
		queue_free()

