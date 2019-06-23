extends KinematicBody2D

var movement = Vector2(0, 0)
var can_move = true
export var speed = 200
var ball_y = 0
export var max_distance = 75

func _physics_process(delta):
	if can_move == true:
		if ball_y > position.y + max_distance:
			movement = Vector2(0, speed)
		elif ball_y < position.y - max_distance:
			movement = Vector2(0, -speed)
		
		move_and_collide(movement * delta)
		#position.y = ball_y
	
	
func _on_ball_position_changed(y):
	ball_y = y
	
	