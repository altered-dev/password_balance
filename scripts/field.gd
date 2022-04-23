extends Node2D

onready var circle = $meter/circle

var force = 1.01
var time_started := OS.get_ticks_msec()


func _ready() -> void:
	circle.position.x += (randf() - 0.5) * 0.1


func _physics_process(delta: float) -> void:
	force += delta * 0.001
	circle.position.x *= force
	circle.self_modulate = Color().from_hsv((1.0 - abs(circle.position.x) / 64.0) / 3.0, 0.5, 1)
	if circle.position.x < -64 or circle.position.x > 64:
		Globals.last_time = (OS.get_ticks_msec() - time_started) / 1000.0
		get_tree().change_scene("res://scenes/game_over.tscn")


func _on_minus_pressed() -> void:
	circle.position.x -= 4 * force


func _on_plus_pressed() -> void:
	circle.position.x += 4 * force


func _on_timer_timeout() -> void:
	$canvas/password.text = Globals.pick_random_string(pow((circle.position.x + 64) / 128, 2), 12)
