extends CharacterBase
class_name Assassin

func _init():
	max_health = 80.0
	max_mana = 120.0
	move_speed = 6.5

func _execute_skill(index: int):
	match index:
		1: # Shadow Dash
			if use_mana(15):
				play_animation("ShadowDash")
				var dash_dir = -global_transform.basis.z
				var tween = create_tween()
				tween.tween_property(self, "global_position", global_position + dash_dir * 7.0, 0.2)
		2: # Poison Dagger
			if use_mana(20):
				is_attacking = true
				play_animation("ThrowDagger")
				# Projectile spawning logic would go here
				await get_tree().create_timer(0.4).timeout
				is_attacking = false
				gain_brutality(5)
		3: # Blade Whirl
			if use_mana(25):
				is_attacking = true
				play_animation("BladeWhirl")
				# AOE collision check
				await get_tree().create_timer(0.6).timeout
				is_attacking = false
				gain_brutality(10)
		4: # Stealth
			if use_mana(30):
				is_casting = true
				play_animation("Stealth")
				# Logic for invisibility and speed buff
				await get_tree().create_timer(1.0).timeout
				is_casting = false
		5: # ULTIMATE: Thousand Cuts
			if use_mana(60):
				is_attacking = true
				play_animation("ThousandCuts")
				# Multi-dash target logic
				await get_tree().create_timer(1.5).timeout
				is_attacking = false
				gain_brutality(30)
