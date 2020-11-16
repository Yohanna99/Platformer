extends KinematicBody2D

export (int) var run_speed = 100
export (int) var jump_speed = -125
export (int) var gravity = 1200
const GRAVITY = 200.0
var motion = Vector2()
var velocity = Vector2()
var jumping = false
var score = 0

func _physics_process(delta):
	
	velocity.y += delta * GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = run_speed
		$AnimatedSprite.play("run_right")
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -run_speed
		$AnimatedSprite.play("run_left")
		
	else:
		velocity.x = 0
		$AnimatedSprite.play("idle")

 var jump = Input.is_action_just_pressed('ui_up')

	if jump and is_on_floor():
		jumping = true
		velocity.y = jump_speed
		
	move_and_slide(velocity, Vector2(0, -1))
	
# called when we run into a coin
func collect_coin (value):
	score += value

