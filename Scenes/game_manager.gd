extends Node

#Nodes
@onready var ui: CanvasLayer = $"../UI"
@onready var customer_manager: Area2D = $"../Customer/CustomerManager"
@onready var score_board: Label = $ScoreBoard

#Variables
var is_paused : bool
var score: int

func _ready() -> void:
	customer_manager.connect("order_complete", Callable(self, "add_score"))
	is_paused = true
	ui.visible = is_paused

func pause():
	get_tree().paused = true

func add_score():
	score += 1
	score_board.text = "Score: " + str(score)
	print(score)

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
