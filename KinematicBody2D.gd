extends KinematicBody2D

const GRAVITY = 9.8
const SPEED = 45
const FLOOR = Vector2(0, -1)

var velocity = Vector2()
var direction = 1

func _ready():
	pass

func  _physics_process(delta):
	velocity.x = SPEED * direction

	if direction == 1:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
 
	$AnimatedSprite.play("Rock")
	
	#velocity.y += GRAVITY 
	
	velocity = move_and_slide(velocity, FLOOR)

	if is_on_wall():
		direction = direction *  -1 

	
	
	


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().reload_current_scene() # Replace with function body.
