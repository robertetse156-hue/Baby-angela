extends Node
class_name WaveManager

signal wave_completed(wave_number)
signal level_completed

@export var enemy_scenes: Array[PackedScene]
@export var spawn_points: Array[Node3D]

var current_wave: int = 1
var enemies_to_spawn: int = 0
var enemies_alive: int = 0

func start_level(level_num: int):
	current_wave = 1
	start_wave()

func start_wave():
	enemies_to_spawn = 5 + (current_wave * 3)
	print("Starting Wave ", current_wave)
	spawn_enemies()

func spawn_enemies():
	for i in range(enemies_to_spawn):
		var enemy = enemy_scenes.pick_random().instantiate()
		var spawn_pt = spawn_points.pick_random()
		get_parent().add_child(enemy)
		enemy.global_position = spawn_pt.global_position
		enemy.connect("died", _on_enemy_died)
		enemies_alive += 1
		await get_tree().create_timer(1.0).timeout

func _on_enemy_died():
	enemies_alive -= 1
	if enemies_alive <= 0:
		if current_wave < 3:
			emit_signal("wave_completed", current_wave)
			current_wave += 1
			start_wave()
		else:
			emit_signal("level_completed")
