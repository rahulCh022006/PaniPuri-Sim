extends Area2D

@onready var ingredient_name := get_node(".").name

signal clicked(ingredient_name)

func _ready() -> void:
	pass
	
func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouse and event.is_pressed():
		emit_signal("clicked", ingredient_name)
