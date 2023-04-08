extends Node2D

signal state_changed(new_state)

enum State {
	PATROL,
	ENGAGE
}

@onready var player_detection_zone = $PlayerDetectionZone
@onready var player_loss_zone = $PlayerLossZone

var current_state : int = State.PATROL : set = set_state
var actor = null
var player : Player = null
var weapon : Weapon = null

func _process(delta):
	match current_state:
		State.PATROL:
			pass
		State.ENGAGE:
			if player != null && weapon != null:
				actor.rotation = actor.global_position.direction_to(player.global_position).angle()
				weapon.shoot()
			else:
				print("ENGAGE state but no player or weapon")
		_:
			print("ERROR : found a state that should not exist")

func initialize(actor, weapon: Weapon):
	self.actor = actor
	self.weapon = weapon

func set_state(new_state):
	if new_state == current_state:
		return

	current_state = new_state
	emit_signal("state_changed", current_state)


func _on_player_detection_zone_body_entered(body):
	if body.is_in_group("player"):
		set_state(State.ENGAGE)
		player = body


func _on_player_loss_zone_body_exited(body):
		if body.is_in_group("player"):
			set_state(State.PATROL)
			player = null

