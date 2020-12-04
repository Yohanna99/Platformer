extends KinematicBody2D

# Editor variables
export var run_speed := 100
export var jump_speed := 400
export var gravity := 1200

var motion := Vector2()
var velocity := Vector2()
var score := 0
var jumping := false
var in_air := false

func get_input():
	
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_up')

	if jump and is_on_floor():
		jumping = true
		velocity.y = -jump_speed*1.1
		print("Jumping %d" % velocity.y)
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed

func change_sprite():
	if velocity.x > 0:
		$AnimatedSprite.play("run_right")
	elif velocity.x < 0:
		$AnimatedSprite.play("run_left")
	else: 
		$AnimatedSprite.play("idle")

func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	
	if jumping and is_on_floor():
		jumping = false
		print("jumping false")
	velocity = move_and_slide(velocity, Vector2.UP)
	
	change_sprite()
	
# called when we run into a coin
func collect_coin (value):
	score += value

func die ():
	get_tree().reload_current_scene()

func _on_Area2D_body_entered(body):
	pass # Replace with function body.
