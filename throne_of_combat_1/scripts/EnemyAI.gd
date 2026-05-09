extends CharacterBase
class_name EnemyAI

enum Type { MELEE, RANGED, BOSS }
@export var enemy_type: Type = Type.MELEE
@export var detection_range: float = 10.0
@export var attack_range: float = 2.0

var player: CharacterBase
var attack_cooldown: float = 0.0

func _ready():
	super._ready()
	player = get_tree().get_first_node_in_group("player")

func _physics_process(delta):
	if is_dead or !player or player.is_dead: return

	var dist = global_position.distance_to(player.global_position)

	if dist <= detection_range:
		if dist > attack_range:
			move_towards_player(delta)
		else:
			attack_player(delta)

func move_towards_player(delta):
	var dir = (player.global_position - global_position).normalized()
	velocity = dir * move_speed

	var target_rotation = atan2(dir.x, dir.z)
	rotation.y = lerp_angle(rotation.y, target_rotation, 5.0 * delta)

	move_and_slide()

func attack_player(delta):
	if attack_cooldown <= 0:
		print("Enemy attacking player!")
		CombatSystem.apply_damage(self, player, 10.0 if enemy_type != Type.BOSS else 25.0)
		attack_cooldown = 1.5 if enemy_type != Type.BOSS else 2.5
	else:
		attack_cooldown -= delta
