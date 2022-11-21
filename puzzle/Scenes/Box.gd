extends KinematicBody2D

var grids_size = 16

var inputs = {
	'ui_up': Vector2.UP,
	'ui_down': Vector2.DOWN,
	'ui_right': Vector2.RIGHT,
	'ui_left': Vector2.LEFT,
}

onready var ray = $RayCast2D

func move(dir):
	var vector_pos = inputs[dir] * grids_size
	ray.cast_to = vector_pos
	ray.force_raycast_update()
	$Tween.interpolate_property(
		self, 
		'position', 
		position, 
		position + vector_pos, 
		0.1,
		Tween.TRANS_SINE,
		Tween.EASE_IN_OUT
	)
	
	if !ray.is_colliding():
		$Tween.start()
		return true
	return false
