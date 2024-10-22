extends Node2D

func _ready() -> void:
	
	pass # Replace with function body.

func _on_gesture_gesture_name(gestureName: StringName, distCloudPoint : float) -> void:
	
	$CanvasLayer2/Panel/VBoxContainer/Label.text = "Porcentaje de similitud: " + str(snapped(distCloudPoint, 0.01)) + "%"
	print(distCloudPoint)

	pass # Replace with function body.

func _on_gesture_on_draw_exit() -> void:
	#$Gesture.classify()
	pass # Replace with function body.
