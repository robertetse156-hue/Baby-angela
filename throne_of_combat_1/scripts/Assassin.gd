extends CharacterBase
class_name Assassin

func _init():
	max_health = 80.0
	max_mana = 120.0
	move_speed = 6.5

# Skill 1: Shadow Dash
func skill_1():
	if use_mana(15):
		print("Assassin: Shadow Dash!")
		# Quick blink forward

# Skill 2: Poison Dagger
func skill_2():
	if use_mana(20):
		print("Assassin: Poison Dagger!")
		gain_brutality(5)
		# Ranged projectile with DOT

# Skill 3: Blade Whirl
func skill_3():
	if use_mana(25):
		print("Assassin: Blade Whirl!")
		gain_brutality(10)
		# Spin attack around character

# Skill 4: Stealth
func skill_4():
	if use_mana(30):
		print("Assassin: Stealth (Invisibility)")
		# Become invisible for duration

# Ultimate: Thousand Cuts
func ultimate():
	if use_mana(60):
		print("Assassin: ULTIMATE - Thousand Cuts!")
		gain_brutality(30)
		# Multi-hit target lock-on attack
