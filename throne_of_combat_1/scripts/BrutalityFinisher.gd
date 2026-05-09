extends Node
class_name BrutalityFinisher

signal finisher_started(attacker, victim)
signal finisher_finished

@export var camera_controller: CameraController

func try_execute_finisher(attacker: CharacterBase, victim: CharacterBase):
	if attacker.brutality_meter >= 100.0 and victim.health <= (victim.max_health * 0.15):
		start_finisher(attacker, victim)

func start_finisher(attacker: CharacterBase, victim: CharacterBase):
	print("BRUTALITY FINISHER!")
	emit_signal("finisher_started", attacker, victim)

	# Freeze time or slowdown
	Engine.time_scale = 0.2

	if camera_controller:
		camera_controller.zoom_to_target(victim.global_position)

	# Play specific finisher animation based on character
	# attacker.play_finisher_animation(victim)

	await get_tree().create_timer(2.0 * Engine.time_scale).timeout

	victim.die()
	attacker.brutality_meter = 0
	attacker.emit_signal("brutality_changed", 0)

	Engine.time_scale = 1.0
	emit_signal("finisher_finished")
