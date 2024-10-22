extends Node2D

const box = preload("res://objects/box.tscn")
const circle = preload("res://objects/circle.tscn")
const heart = preload("res://objects/heart.tscn")

var ubi : Vector2


func _ready() -> void:
	ubi = $ubiAppear.global_position
	
	pass


func _on_gesture_gesture_name(gestureName: StringName, distCloudPoint : float) -> void:
	match gestureName:
		"box" : create_box()
		"circle" : create_circle()
		"heart" : create_heart()
	
	pass
func create_box():
	var instBox = box.instantiate()
	instBox.position = ubi
	add_child(instBox)
	if !$CanvasLayer/Panel/VBoxContainer/Label4/MeshInstance2D.visible:
		$CanvasLayer/Panel/VBoxContainer/Label4/MeshInstance2D.visible = true

func create_circle():
	var instCircle = circle.instantiate()
	instCircle.position = ubi
	add_child(instCircle)
	if !$CanvasLayer/Panel/VBoxContainer/Label3/MeshInstance2D.visible:
		$CanvasLayer/Panel/VBoxContainer/Label3/MeshInstance2D.visible = true

func create_heart():
	var instHeart = heart.instantiate()
	instHeart.position = ubi
	add_child(instHeart)
	if !$CanvasLayer/Panel/VBoxContainer/Label2/MeshInstance2D.visible:
		$CanvasLayer/Panel/VBoxContainer/Label2/MeshInstance2D.visible = true

func _on_gesture_on_draw_exit() -> void:
	$Gesture.classify()
	pass
