extends Node
class_name PlayerController

@export var character: CharacterBase
@export var rotation_speed: float = 10.0

var move_direction: Vector3 = Vector3.ZERO

func _physics_process(delta):
	if !character or character.is_dead: return

	# MOBA-style movement (Relative to world/camera)
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	move_direction = Vector3(input_dir.x, 0, input_dir.y).normalized()

	if move_direction.length() > 0.1:
		character.velocity = move_direction * character.move_speed

		# Smooth rotation towards movement direction
		var target_rotation = atan2(move_direction.x, move_direction.z)
		character.rotation.y = lerp_angle(character.rotation.y, target_rotation, rotation_speed * delta)
	else:
		character.velocity.x = move_toward(character.velocity.x, 0, character.move_speed)
		character.velocity.z = move_toward(character.velocity.z, 0, character.move_speed)

	character.move_and_slide()

func _input(event):
	if !character or character.is_dead: return

	if event.is_action_pressed("skill_1"):
		character.skill_1()
	elif event.is_action_pressed("skill_2"):
		character.skill_2()
	elif event.is_action_pressed("skill_3"):
		character.skill_3()
	elif event.is_action_pressed("skill_4"):
		character.skill_4()
	elif event.is_action_pressed("ultimate"):
		character.ultimate()
