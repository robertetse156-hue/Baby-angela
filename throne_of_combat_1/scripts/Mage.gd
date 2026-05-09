extends CharacterBase
class_name Mage

func _init():
	max_health = 70.0
	max_mana = 200.0
	move_speed = 4.5

func _execute_skill(index: int):
	match index:
		1: # Arcane Bolt
			if use_mana(10):
				is_casting = true
				play_animation("CastBolt")
				# Projectile logic
				await get_tree().create_timer(0.4).timeout
				is_casting = false
				gain_brutality(3)
		2: # Frost Nova
			if use_mana(30):
				is_casting = true
				play_animation("FrostNova")
				# Radial freeze logic
				await get_tree().create_timer(0.8).timeout
				is_casting = false
		3: # Blink
			if use_mana(20):
				play_animation("Blink")
				var target_pos = global_position - global_transform.basis.z * 8.0
				global_position = target_pos # Instant teleport
		4: # Arcane Orbs
			if use_mana(40):
				is_casting = true
				play_animation("SummonOrbs")
				# Logic to instantiate orbiting projectiles
				await get_tree().create_timer(1.0).timeout
				is_casting = false
		5: # ULTIMATE: Meteor Shower
			if use_mana(100):
				is_casting = true
				play_animation("MeteorShower")
				# Global AOE logic
				await get_tree().create_timer(2.5).timeout
				is_casting = false
				gain_brutality(40)
