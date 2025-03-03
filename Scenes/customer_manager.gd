extends Area2D

@export var ingredient_handler: NodePath

var order: Array = ["Puri", "Chole", "Pani"]

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouse and event.is_pressed():
		var ingredient_handler_node := get_node(ingredient_handler)
		if ingredient_handler_node:
			check_order(ingredient_handler_node.active_puri, ingredient_handler_node)

func check_order(active_puri, ingredient_handler_node):
	if active_puri == order:
		print("Correct Order")
		ingredient_handler_node.clear_ingredients()
	else:
		print("Wrong dummbo")
		ingredient_handler_node.clear_ingredients()
