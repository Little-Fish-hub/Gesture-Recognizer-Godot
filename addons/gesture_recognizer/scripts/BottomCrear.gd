extends Control
var ss

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ss = get_parent().get_node("Create")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ss.visible:
		self.visible = false
	else:
		self.visible = true
	pass


func _on_crea_button_up() -> void:
	get_parent().get_parent().classify()
	pass # Replace with function body.
