extends KinematicBody2D

signal position_changed(y)

# Variablen
export var speed = 400
var movement = Vector2(-speed, 0)
var can_move = true

func _ready():
	position = get_viewport().size / 2
	

func _physics_process(delta):
	if can_move == true:
		var collision_info = move_and_collide(movement * delta)
		emit_signal("position_changed", position.y)
		if collision_info:
			if collision_info.collider.name == "Spieler" or collision_info.collider.name == "Gegner":
				$"Sound_Paddle".play()
				speed = -speed
				var diff = collision_info.collider.position.y - position.y
				var new_movement = Vector2(speed, -diff * 5)
				movement = new_movement
			else:
				$"Sound_Wand".play()
				# Berechnen Abprallvektor
				movement = movement.bounce(collision_info.normal)
				