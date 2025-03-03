extends Node

var is_paused : bool


func _ready() -> void:
	is_paused = false

func pause():
	get_tree().paused = true
	
	
func restart_():
	if Input.is_action_pressed("Restart"):
		get_tree().reload_current_scene()
	if Input.is_action_pressed("Pause"):
		is_paused = true
