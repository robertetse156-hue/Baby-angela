extends StaticBody3D
class_name DestructibleEnvironment

@export var health: float = 50.0
@export var broken_mesh: PackedScene
@export var destruction_vfx: PackedScene

func take_damage(amount: float):
	health -= amount
	if health <= 0:
		break_object()

func break_object():
	# Spawn broken pieces
	if broken_mesh:
		var broken = broken_mesh.instantiate()
		get_parent().add_child(broken)
		broken.global_position = global_position
		broken.global_rotation = global_rotation

	# Spawn particles
	if destruction_vfx:
		var vfx = destruction_vfx.instantiate()
		get_parent().add_child(vfx)
		vfx.global_position = global_position

	queue_free()
