extends Area2D

@export var speed : float = 800

@onready var queue_free_timer = $QueueFreeTimer

var direction := Vector2.ZERO

func _ready():
	queue_free_timer.start()

func _physics_process(delta):
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		global_position += velocity * delta

func set_direction(direction: Vector2):
	self.direction = direction
	rotation += direction.angle()


func _on_queue_free_timer_timeout():
	queue_free()
