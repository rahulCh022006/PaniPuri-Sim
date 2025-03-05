extends Area2D

#NodeVariables
@export var ingredient_handler: NodePath
@onready var label: Label = $"../Speech/Label"
@onready var correct_symbol: TextureRect = $"../Speech/CorrectSymbol"
@onready var order_timer: Timer = $"../Speech/OrderTimer"
@onready var wrong_symbol: TextureRect = $"../Speech/WrongSymbol"


#Signals
signal order_complete
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
		order_is_correct()
		ingredient_handler_node.clear_ingredients()
		emit_signal("order_complete")
		randomize_order()
	else:
		print("Wrong dummbo")
		order_is_incorrect()
		ingredient_handler_node.clear_ingredients()

func order_is_correct():
	correct_symbol.visible = true
	label.visible = false
	order_timer.start()

func order_is_incorrect():
	wrong_symbol.visible = true
	label.visible = false
	order_timer.start()

func reset_symbols():
	correct_symbol.visible = false
	wrong_symbol.visible = false
	label.visible = true

func _on_order_timer_timeout() -> void:
	reset_symbols()
