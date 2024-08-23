extends Control

var grab = null

#Guardado
var gestureResource : Gest
var gestureName : String
var nameEmpty : String


func _ready() -> void:
	gestureName = $Panel/VBoxContainer/TextEdit.text
	nameEmpty = gestureName

func _process(delta: float) -> void:
	if grab != null:
		grab.grab_focus()
	gestureName = $Panel/VBoxContainer/TextEdit.text
	pass


func _on_text_edit_gui_input(event: InputEvent) -> void:

	if event is InputEventMouseButton and event.pressed:
		grab = $Panel/VBoxContainer/TextEdit
	pass # Replace with function body.


func save_gesture():
	gestureResource = Gest.new() 
	gestureResource.pointsInt = get_parent().get_parent().pointsIntegers
	gestureResource.points = get_parent().get_parent().pointsNorm
	gestureResource.LUT = get_parent().get_parent().LUT
	if gestureName != nameEmpty and !get_parent().get_parent().pointsIntegers.is_empty():
		gestureResource.gestureName = gestureName
		save_resource()
		$Panel/Popup/Label.text = "Gesture " + gestureName + " saved"
		$Panel/Popup.visible = true
		$Panel/VBoxContainer.visible = false
		await get_tree().create_timer(1).timeout
		$Panel/Popup.visible = false
		$Panel/VBoxContainer.visible = true
		self.visible = false
		get_parent().get_parent().reset_gesture_data()
	elif get_parent().get_parent().pointsIntegers.is_empty():
		$Panel/Popup/Label.text = "Draw a gesture"
		$Panel/Popup.visible = true
		$Panel/VBoxContainer.visible = false
		await get_tree().create_timer(1).timeout
		$Panel/Popup.visible = false
		$Panel/VBoxContainer.visible = true
		self.visible = false
	elif gestureName == nameEmpty:
		$Panel/Popup/Label.text = "Write a name"
		$Panel/Popup.visible = true
		$Panel/VBoxContainer.visible = false
		await get_tree().create_timer(1).timeout
		$Panel/VBoxContainer.visible = true
		$Panel/Popup.visible = false
	pass
	

func save_resource():
	var savePath = "res://gestures/"
	var count : int = 1
	var gestureFilename = gestureName + "_" + str(count)
	var dir
	
	if DirAccess.dir_exists_absolute(savePath):
		dir = DirAccess.open(savePath)
	else:
		DirAccess.make_dir_absolute(savePath)
		dir = DirAccess.open(savePath)
	
	if dir.file_exists(savePath + gestureFilename + ".tres"):
		while dir.file_exists(savePath + gestureFilename + ".tres"):
			count += 1
			gestureFilename = gestureName + "_" + str(count)
	
	ResourceSaver.save(gestureResource, savePath + gestureFilename + ".tres")
	print("Gestro creado con el nombre de: " + gestureFilename)
	
	ResourceLoader.load(savePath + gestureFilename + ".tres")
	get_parent().get_parent().reset_gesture_data()

func _on_button_button_up() -> void:
	save_gesture()
	pass # Replace with function body.


func _on_button_2_button_up() -> void:
	get_parent().get_parent().reset_gesture_data()
	self.visible = false
	pass # Replace with function body.
