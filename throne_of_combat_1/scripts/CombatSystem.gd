extends Node
class_name CombatSystem

static func calculate_damage(attacker: CharacterBase, target: CharacterBase, base_damage: float) -> float:
	# Add complexity like armor, critical hits, etc. here
	return base_damage

static func apply_damage(attacker: CharacterBase, target: CharacterBase, damage: float):
	var final_damage = calculate_damage(attacker, target, damage)
	target.take_damage(final_damage)

	# If attacker is player, gain brutality
	if attacker is Knight or attacker is Assassin or attacker is Mage or attacker is BestialWarrior:
		attacker.gain_brutality(final_damage * 0.1)
