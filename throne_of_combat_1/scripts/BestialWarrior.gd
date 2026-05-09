extends CharacterBase
class_name BestialWarrior

func _init():
	max_health = 130.0
	max_mana = 60.0
	move_speed = 5.5

func _execute_skill(index: int):
	match index:
		1: # Primal Strike
			if use_mana(5):
				is_attacking = true
				play_animation("PrimalStrike")
				# Forward swipe
				await get_tree().create_timer(0.4).timeout
				is_attacking = false
				gain_brutality(8)
		2: # Bloodlust
			if use_mana(20):
				is_casting = true
				play_animation("Roar")
				# Life-steal buff logic
				await get_tree().create_timer(1.0).timeout
				is_casting = false
		3: # Feral Pounce
			if use_mana(15):
				play_animation("Pounce")
				var jump_dir = -global_transform.basis.z
				var tween = create_tween()
				tween.tween_property(self, "global_position", global_position + jump_dir * 10.0 + Vector3.UP * 2.0, 0.5)
				await tween.finished
				gain_brutality(10)
		4: # Intimidating Roar
			if use_mana(25):
				is_casting = true
				play_animation("IntimidatingRoar")
				# AOE Stun logic
				await get_tree().create_timer(1.2).timeout
				is_casting = false
		5: # ULTIMATE: Beast Unleashed
			if use_mana(40):
				is_casting = true
				play_animation("Transform")
				# Scale up, change animations, increase speed/damage
				var tween = create_tween()
				tween.tween_property(self, "scale", Vector3(1.5, 1.5, 1.5), 1.0)
				await get_tree().create_timer(1.5).timeout
				is_casting = false
				gain_brutality(50)
