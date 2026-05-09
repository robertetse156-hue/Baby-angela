extends CharacterBase
class_name Mage

func _init():
	max_health = 70.0
	max_mana = 200.0
	move_speed = 4.5

# Skill 1: Arcane Bolt
func skill_1():
	if use_mana(10):
		print("Mage: Arcane Bolt!")
		gain_brutality(3)
		# Homing magic projectile

# Skill 2: Frost Nova
func skill_2():
	if use_mana(30):
		print("Mage: Frost Nova!")
		# AOE slow and freeze

# Skill 3: Blink
func skill_3():
	if use_mana(20):
		print("Mage: Blink (Teleport)")
		# Short range teleport

# Skill 4: Arcane Orbs
func skill_4():
	if use_mana(40):
		print("Mage: Arcane Orbs (Orbiting Defense)")
		# Orbs that block projectiles and damage nearby enemies

# Ultimate: Meteor Shower
func ultimate():
	if use_mana(100):
		print("Mage: ULTIMATE - Meteor Shower!")
		gain_brutality(40)
		# Massive AOE fire damage from sky
