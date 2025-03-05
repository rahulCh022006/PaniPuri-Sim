extends Node

#Node
@onready var active_ingredients: Label = $Panel/ActiveIngredients

#Variables
@onready var active_puri: Array 

func _ready() -> void:
	for ingredient in get_tree().get_nodes_in_group("Ingredients"):
		ingredient.connect("clicked", Callable(self, "update_ingredients"))
	active_ingredients.text = "Null"

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pani"):
		var pani: String = "pani"
		update_ingredients(pani)

func array_to_string(arr: Array):
		var s = ""
		for i in arr:
			s += String(i)
		return s

func update_ingredients(ingredient : String) -> void:
	active_puri.append(ingredient)
	print(active_puri)
	var display_ingredient : String = array_to_string(active_puri)
	if active_ingredients.text == "Null":
		active_ingredients.text = ingredient
	else:
		active_ingredients.text += "\n" + ingredient

func clear_ingredients():
	active_puri.clear()
	active_ingredients.text = "Null"
