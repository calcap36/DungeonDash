extends KinematicBody2D

#reloads level
func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().reload_current_scene()

func _ready():
	pass 


