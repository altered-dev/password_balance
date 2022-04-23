extends Control

func _ready() -> void:
	$title.text = $title.text.replace("N", String(Globals.last_time))


func _on_play_pressed() -> void:
	get_tree().change_scene("res://scenes/field.tscn")
