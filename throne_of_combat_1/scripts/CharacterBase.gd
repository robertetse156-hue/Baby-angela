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

signal health_changed(new_health)
signal mana_changed(new_mana)
signal brutality_changed(new_brutality)
signal died

func _ready():
	health = max_health
	mana = max_mana

func take_damage(amount: float):
	if is_dead: return
	health -= amount
	health = clamp(health, 0, max_health)
	emit_signal("health_changed", health)
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
	# Play death animation

# Virtual functions to be overridden by subclasses
func skill_1(): pass
func skill_2(): pass
func skill_3(): pass
func skill_4(): pass
func ultimate(): pass
