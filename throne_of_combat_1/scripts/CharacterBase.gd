extends CharacterBody3D
class_name CharacterBase

# Stats
@export var max_health: float = 100.0
@export var max_mana: float = 100.0
@export var move_speed: float = 5.0
@export var health: float
@export var mana: float
@export var brutality_meter: float = 0.0

# State
var is_dead: bool = false
var is_casting: bool = false
var is_attacking: bool = false

# Nodes
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var hitbox: Area3D = $Hitbox

signal health_changed(new_health)
signal mana_changed(new_mana)
signal brutality_changed(new_brutality)
signal died

func _ready():
	health = max_health
	mana = max_mana
	if hitbox:
		hitbox.area_entered.connect(_on_hitbox_area_entered)

func take_damage(amount: float):
	if is_dead: return
	health -= amount
	health = clamp(health, 0, max_health)
	emit_signal("health_changed", health)

	if animation_player:
		animation_player.play("HitReaction")

	if health <= 0:
		die()

func use_mana(amount: float) -> bool:
	if mana >= amount:
		mana -= amount
		emit_signal("mana_changed", mana)
		return true
	return false

func gain_brutality(amount: float):
	brutality_meter = clamp(brutality_meter + amount, 0, 100)
	emit_signal("brutality_changed", brutality_meter)

func die():
	is_dead = true
	emit_signal("died")
	if animation_player:
		animation_player.play("Death")
	set_physics_process(false)
	$CollisionShape3D.disabled = true

func _on_hitbox_area_entered(area):
	if area.get_parent() is CharacterBase and area.get_parent() != self:
		# Combat logic handles actual damage application
		pass

# Skills
func skill_1():
	if !is_casting and !is_attacking:
		_execute_skill(1)

func skill_2():
	if !is_casting and !is_attacking:
		_execute_skill(2)

func skill_3():
	if !is_casting and !is_attacking:
		_execute_skill(3)

func skill_4():
	if !is_casting and !is_attacking:
		_execute_skill(4)

func ultimate():
	if !is_casting and !is_attacking:
		_execute_skill(5)

func _execute_skill(index: int):
	# To be overridden
	pass

func play_animation(anim_name: str):
	if animation_player and animation_player.has_animation(anim_name):
		animation_player.play(anim_name)
