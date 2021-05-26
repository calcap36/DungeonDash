extends KinematicBody2D


const SPEED = 60 
const GRAVITY = 9.8
const JUMP_POWER = -230
const FLOOR = Vector2(0, -1)
 

var velocity = Vector2()

var on_ground = false

func _physics_process(delta): 
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$AnimatedSprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$AnimatedSprite.play("run")
	else:
		velocity.x = 0
		if on_ground == true:
			$AnimatedSprite.play("idle")
	
	if Input.is_action_pressed("ui_up"):
		if on_ground == true:
			velocity.y = JUMP_POWER
			on_ground = false 
	 
	velocity.y += GRAVITY 	
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground= false 
		if velocity.y < 0:
			$AnimatedSprite.play("jump")
		
		
	
	velocity = move_and_slide(velocity, FLOOR)
