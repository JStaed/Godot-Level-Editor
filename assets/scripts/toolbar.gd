extends HBoxContainer

func _ready() -> void:
	$File.get_popup().id_pressed.connect(_file_button_pressed)
	$Edit.get_popup().id_pressed.connect(_edit_button_pressed)



func _file_button_pressed(id: int) -> void:
	match id:
		0: #save
			get_tree().root.get_node("Node2D").save_scene()
		1: #save as
			get_tree().root.get_node("Node2D").save_scene_as()
		2: #load
			get_tree().root.get_node("Node2D").load_scene()
		3: #quit
			get_tree().quit()

func _edit_button_pressed(id: int) -> void:
	print(id)


func _on_file_about_to_popup() -> void:
	if get_tree().root.get_node("Node2D").saved:
		$File.get_popup().set_item_text(3, "Quit")
	else:
		$File.get_popup().set_item_text(3, "Quit (Unsaved)")
