extends Node2D

@export var max_health : int = 100

@export var health : int = 100 :
	set(value):
		health = clamp(value, 0, max_health)
	get:
		return health
