extends Sprite2D

var cont : float = 1;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if cont <= 0:
		cont = 0.6
		if rotation_degrees == 0:
			rotation_degrees = 26
		elif rotation_degrees == 26:
			rotation_degrees = 0
	else:
		cont -= delta
	pass
