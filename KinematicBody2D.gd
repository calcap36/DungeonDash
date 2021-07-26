extends KinematicBody2D

const GRAVITY = 9.8
const SPEED = 40
const FLOOR = Vector2(0, -1)

var velocity = Vector2()
var direction = 1

func _ready():
	pass

func  _physics_process(delta):
	velocity.x = SPEED * direction
	
	$AnimatedSprite.play("Rock")
	$AnimatedSprite.flip_h = true 	
	
	velocity.y += GRAVITY 
	
	
	velocity = move_and_slide(velocity, FLOOR)
	
	if is_on_wall():
		direction = direction *  -1 
	
	
	
