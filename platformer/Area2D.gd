extends Area2D

export var value = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("coins")

func _on_coin1_body_entered(body):
	# was it the player?
	if body.get_name() == "Player":
		body.collect_coin(value)
		queue_free()
