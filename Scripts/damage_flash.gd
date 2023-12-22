extends ColorRect


# Called when the node enters the scene tree for the first time.
func flash():
	# Tween DamageFlash-ColorRect alpha-property for flash effect
	var tween_damage = create_tween()
	tween_damage.tween_property(self, "color:a", 255, 0.1)
	tween_damage.tween_property(self, "color:a", 0, 0.1)
