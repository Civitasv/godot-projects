extends Node2D

var game_end = false
var moves = 0

func _process(delta):
	if $bgm.playing == false:
		$bgm.play()
		
func check():
	if game_end == true:
		return
	
	$UI/MovesLabel.text = 'Moves: ' + str(moves)
	
	var spots = $Spots.get_child_count()
	
	for i in $Spots.get_children():
		if i.occupied == true:
			spots -= 1
	
	if spots == 0:
		$UI/AcceptDialog.popup()
		game_end = true


func _on_AcceptDialog_confirmed():
	get_tree().reload_current_scene()
