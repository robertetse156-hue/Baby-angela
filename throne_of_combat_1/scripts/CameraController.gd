extends Camera3D
class_name CameraController

@export var target: Node3D
@export var offset: Vector3 = Vector3(0, 10, 10)
@export var follow_speed: float = 5.0

var is_zooming: bool = false
var original_fov: float

func _ready():
	original_fov = fov

func _process(delta):
	if !target or is_zooming: return

	var target_pos = target.global_position + offset
	global_position = global_position.lerp(target_pos, follow_speed * delta)
	look_at(target.global_position)

func zoom_to_target(pos: Vector3, duration: float = 0.5):
	is_zooming = true
	var tween = create_tween().set_parallel(true)
	tween.tween_property(self, "global_position", pos + (offset * 0.3), duration)
	tween.tween_property(self, "fov", 30.0, duration)

	await tween.finished
	await get_tree().create_timer(1.0).timeout

	reset_camera(duration)

func reset_camera(duration: float):
	var tween = create_tween().set_parallel(true)
	tween.tween_property(self, "fov", original_fov, duration)

	await tween.finished
	is_zooming = false
