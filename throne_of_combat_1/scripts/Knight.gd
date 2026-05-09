extends CharacterBase
class_name Knight

func _init():
	max_health = 150.0
	max_mana = 80.0
	move_speed = 4.0

func _execute_skill(index: int):
	match index:
		1: # Shield Bash
			if use_mana(10):
				is_attacking = true
				play_animation("ShieldBash")
				# Spawn hit effect/collision check
				await get_tree().create_timer(0.5).timeout
				is_attacking = false
				gain_brutality(5)
		2: # Iron Will
			if use_mana(20):
				is_casting = true
				play_animation("IronWill")
				# Apply defense buff logic
				await get_tree().create_timer(1.0).timeout
				is_casting = false
		3: # Cleave
			if use_mana(15):
				is_attacking = true
				play_animation("Cleave")
				# Massive swing logic
				await get_tree().create_timer(0.8).timeout
				is_attacking = false
				gain_brutality(8)
		4: # Valiant Charge
			if use_mana(25):
				play_animation("Charge")
				var charge_dir = -global_transform.basis.z
				var tween = create_tween()
				tween.tween_property(self, "global_position", global_position + charge_dir * 5.0, 0.4)
				await tween.finished
		5: # ULTIMATE: Judgment
			if use_mana(50):
				is_casting = true
				play_animation("Judgment")
				# Screen shake, massive impact VFX
				await get_tree().create_timer(2.0).timeout
				is_casting = false
				gain_brutality(25)
