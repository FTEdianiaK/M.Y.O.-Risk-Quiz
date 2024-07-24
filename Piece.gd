extends Node2D

var m


func _process(delta):
	if m == true:
		if Input.is_action_just_pressed("teamA"):
			$Area2D/NinePatchRect.self_modulate = "F56969"
		elif Input.is_action_just_pressed("teamB"):
			$Area2D/NinePatchRect.self_modulate = "6969F5"
		elif Input.is_action_just_pressed("lost"):
			$Area2D/NinePatchRect.self_modulate = "9E9E9E"
		elif Input.is_action_just_pressed("neutral"):
			$Area2D/NinePatchRect.self_modulate = "FFFFFF"


func _on_Area2D_mouse_entered():
	m = true


func _on_Area2D_mouse_exited():
	m = false
