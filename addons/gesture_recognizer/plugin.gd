@tool
extends EditorPlugin

var autoloadName : String = "CloudRecognizer"

func _enter_tree() -> void:
	add_custom_type("Gesture", "Area2D", preload("res://addons/gesture_recognizer/scripts/ControlGesture.gd"), preload("res://addons/gesture_recognizer/others/icon.png"))
	add_autoload_singleton(autoloadName, "res://addons/gesture_recognizer/scripts/CloudRecognizer.gd")

func _exit_tree() -> void:
	remove_custom_type("Gesture")
	remove_autoload_singleton(autoloadName)
