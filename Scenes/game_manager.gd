extends Node

var is_paused : bool
@onready var ui: CanvasLayer = $"../UI"


func _ready() -> void:
	is_paused = true
	ui.visible = is_paused

func pause():
	get_tree().paused = true
	


func restart_():
	if Input.is_action_pressed("Restart"):
		get_tree().reload_current_scene()
	if Input.is_action_pressed("Pause"):
		is_paused = true


func _on_start_pressed() -> void:
	ui.visible = false


func _on_pause_button_pressed() -> void:
	ui.visible = true


func _on_exit_pressed() -> void:
	get_tree().quit()
