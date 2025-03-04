extends Area2D

@export var ingredient_handler: NodePath
@onready var label: Label = $"../Speech/Label"

#Different Puris
var different_puris : Dictionary = {
	"Mitha Puri": ["Puri","Chole","Mitha"],
	"Mix\nPuri": ["Puri","Chole","Mitha","Pani"],
	"Theeka Puri": ["Puri","Chole","Pani"]
}
#OrderCreation
var active_order: Array
	
func randomize_order():
	var random_name = different_puris.keys()[randi()%different_puris.size()]
	active_order = different_puris[random_name]
	print(active_order)
	label.text = random_name

func _ready() -> void:
	randomize_order()

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouse and event.is_pressed():
		var ingredient_handler_node := get_node(ingredient_handler)
		if ingredient_handler_node:
			check_order(ingredient_handler_node.active_puri, ingredient_handler_node)

func check_order(active_puri, ingredient_handler_node):
	if active_puri == active_order:
		print("Correct Order")
		ingredient_handler_node.clear_ingredients()
		randomize_order()
	else:
		print("Wrong dummbo")
		ingredient_handler_node.clear_ingredients()
