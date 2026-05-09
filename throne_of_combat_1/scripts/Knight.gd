extends CharacterBase
class_name Knight

func _init():
	max_health = 150.0
	max_mana = 80.0
	move_speed = 4.0

# Skill 1: Shield Bash
func skill_1():
	if use_mana(10):
		print("Knight: Shield Bash!")
		gain_brutality(5)
		# Add knockback and stun logic

# Skill 2: Iron Will
func skill_2():
	if use_mana(20):
		print("Knight: Iron Will (Defense Buff)")
		# Temporary damage reduction

# Skill 3: Cleave
func skill_3():
	if use_mana(15):
		print("Knight: Cleave!")
		gain_brutality(8)
		# AOE damage in front

# Skill 4: Valiant Charge
func skill_4():
	if use_mana(25):
		print("Knight: Valiant Charge!")
		# Dash forward and damage first hit

# Ultimate: Judgment from Above
func ultimate():
	if use_mana(50):
		print("Knight: ULTIMATE - Judgment from Above!")
		gain_brutality(25)
		# Massive AOE with screen shake and zoom
