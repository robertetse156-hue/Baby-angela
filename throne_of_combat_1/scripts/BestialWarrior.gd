extends CharacterBase
class_name BestialWarrior

func _init():
	max_health = 130.0
	max_mana = 60.0
	move_speed = 5.5

# Skill 1: Primal Strike
func skill_1():
	if use_mana(5):
		print("Bestial Warrior: Primal Strike!")
		gain_brutality(8)
		# Heavy claw attack

# Skill 2: Bloodlust
func skill_2():
	if use_mana(20):
		print("Bestial Warrior: Bloodlust (Lifesteal Buff)")
		# Heal on next few attacks

# Skill 3: Feral Pounce
func skill_3():
	if use_mana(15):
		print("Bestial Warrior: Feral Pounce!")
		gain_brutality(10)
		# Jump to target and damage

# Skill 4: Intimidating Roar
func skill_4():
	if use_mana(25):
		print("Bestial Warrior: Intimidating Roar!")
		# AOE stun/slow

# Ultimate: Beast Unleashed
func ultimate():
	if use_mana(40):
		print("Bestial Warrior: ULTIMATE - Beast Unleashed!")
		gain_brutality(50)
		# Transformation with increased speed, damage, and new animations
