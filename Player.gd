extends KinematicBody2D


const SPEED = 60 
const GRAVITY = 9.8
const JUMP_POWER = -230
const FLOOR = Vector2(0, -1)
const TYPE = "Player"
const SPRINT = 120 	 

var velocity = Vector2()

#dash
var dashdirection = Vector2(1,0)
var candash = false
var dashing = false 

#jump
var on_ground = false
var animation = "idle"
func _physics_process(delta): 
	dash()
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		animation = "run"
		$AnimatedSprite.flip_h = false 
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		animation = "run"
		$AnimatedSprite.flip_h = true
	else:
		velocity.x = 0
		if on_ground == true:
			animation = "idle"
		
	if Input.is_action_pressed("ui_up"):
		if on_ground == true:
			velocity.y = JUMP_POWER
			on_ground = false 
			
	if Input.is_action_pressed("ui_down"):
		animation = "slide"
		$CollisionShape2D.disabled = true
		$SlideCollider.disabled = false
	else:
		$CollisionShape2D.disabled = false
		$SlideCollider.disabled = true
	
	
func dash():
	if is_on_floor():
		candash = true 
	if Input.is_action_pressed("ui_right"):
		dashdirection = Vector2(1,0)
	if Input.is_action_pressed("ui_left"):
		dashdirection = Vector2(-1,0)
		
	if Input.is_action_just_pressed("ui_dash") and candash:
		velocity = dashdirection.normalized() * 3200
		
		#candash = false
		#dashing = true 
		#yield(get_tree().create_timer(0.2),"timeout")
		#dashing = false


	
	velocity.y += GRAVITY 	
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground= false 
		if velocity.y < 0:
			animation = "jump"
		else:
			animation = "fall"
		
		
		
	$AnimatedSprite.play(animation)
	velocity = move_and_slide(velocity, FLOOR)
	

	
	 
