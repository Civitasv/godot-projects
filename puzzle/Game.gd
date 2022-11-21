extends Node2D

var game_end = false
var moves = 0

func _process(delta):
	if $bgm.playing == false:
		$bgm.play()
		
func check():
	if game_end == true:
		return
	
	var spots = $Spots.get_child_count()
	
	for i in $Spots.get_children():
		if i.occupied == true:
			spots -= 1
	
	if spots == 0:
		$UI/Success.show()
		game_end = true


func _unhandled_input(event):
	if game_end:
		if event.is_action_pressed("ui_accept"):
			get_tree().reload_current_scene()
