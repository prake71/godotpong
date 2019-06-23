extends KinematicBody2D

# Variablen
var movement = Vector2(0,0)
export var speed = 200
var can_move = true

# Bewegung
func _physics_process(delta):
	#print(delta)
	if can_move == true:
		move_and_collide(movement * delta)
		
func _input(event):
	if event.is_action_pressed("up"):
		movement = Vector2(0, -speed)
	elif event.is_action_pressed("down"):
		movement = Vector2(0, speed)
	elif event.is_action_released("up") or event.is_action_released("down"):
		movement = Vector2(0,0)
	