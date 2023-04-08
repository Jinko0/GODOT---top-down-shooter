extends Area2D
class_name Bullet

@export var speed : float = 200

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


func _on_body_entered(body):
	if body.has_method("handle_hit"):
		body.handle_hit()
		queue_free()
