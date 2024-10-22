extends Node2D

const car = preload("res://objects/car.tscn")

var ubi : Vector2
var tt: bool = false


func _ready() -> void:
	ubi = $ubiAppear.global_position
	pass

func _process(delta: float) -> void:
	if tt:
		$Node2D.scale = $Node2D.scale.lerp(Vector2(1, 1), 0.1)
	pass

func _on_gesture_gesture_name(gestureName: StringName, distCloudPoint : float) -> void:
	match gestureName:
		"car" : create_car()
		"sun" : create_sun()
		"tree" : create_tree()
	pass

func create_car():
	var instCar = car.instantiate()
	instCar.position = ubi
	add_child(instCar)
	pass

func create_sun():
	$Sun.visible = true
	pass

func create_tree():
	tt = true
	pass
