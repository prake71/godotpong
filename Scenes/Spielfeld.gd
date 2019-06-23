extends Node

# Variablen für Punktestände
var punktestand_spieler = 0
var punktestand_gegner = 0

# Referenzen
onready var node_spieler = $"Spiel_Objekte/Spieler"
onready var node_gegner = $"Spiel_Objekte/Gegner"
onready var node_ball = $"Spiel_Objekte/Ball"
onready var node_timer = $"Control_Objekte/Reset_Timer"
onready var node_punkte_spieler = $"HUD/Punktestand_Spieler"
onready var node_punkte_gegner = $"HUD/Punktestand_Gegner"

# Ursprungspositionen
var start_position_spieler
var start_position_gegner
var start_position_ball

func _ready():
	start_position_spieler = node_spieler.position
	start_position_ball = node_ball.position
	start_position_gegner = node_gegner.position
	
	
# wird immer ausgeführt, wenn ein Körper die Area betritt
func _on_Tor_Spieler_body_entered(body):
	if body.name == "Ball":
		$"Control_Objekte/Sound_Tor".play()
		node_ball.movement = Vector2(-abs(node_ball.speed), 0)
		punktestand_gegner += 1
		node_punkte_gegner.text = str(punktestand_gegner)
		print("Gegner hat ein Tor geschossen!")
		_set_reset()

func _on_Tor_Gegner_body_entered(body):
	if body.name == "Ball":
		$"Control_Objekte/Sound_Tor".play()
		node_ball.movement = Vector2(abs(node_ball.speed), 0)
		punktestand_spieler += 1
		node_punkte_spieler.text = str(punktestand_spieler)
		print("Spieler hat ein Tor geschossen!")
		_set_reset()
		
		
func _set_reset():
	node_timer.start()
	
	node_spieler.position = start_position_spieler
	node_gegner.position = start_position_gegner
	node_ball.position = start_position_ball
	
	node_spieler.can_move = false
	node_gegner.can_move = false
	node_ball.can_move = false
	

func _on_Reset_Timer_timeout():
	$"Control_Objekte/Sound_Start".play()
	node_spieler.can_move = true
	node_gegner.can_move = true
	node_ball.can_move = true
