extends KinematicBody2D

# Editor variables
export var run_speed := 100
export var jump_speed := 300
export var gravity := 1000

var motion := Vector2()
var velocity := Vector2()
var score := 0

func _physics_process(delta):
	
	# Left-right movement
	if Input.is_action_pressed("ui_right"):
		velocity.x = run_speed
		$AnimatedSprite.play("run_right")
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -run_speed
		$AnimatedSprite.play("run_left")
	else:
		velocity.x = 0
		$AnimatedSprite.play("idle")

	var jump_pressed = Input.is_action_just_pressed('ui_up')

	velocity.y += gravity * delta
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)

	# Vertical movement
	if jump_pressed and is_on_floor():
		velocity.y = -jump_speed
	
# called when we run into a coin
func collect_coin (value):
	score += value

