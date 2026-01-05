extends Node2D


@export var level_dir: String = ""
@export var level_name: String = ""

func load_level(level_dir: String, level_name: String) -> void:
	var level: Node = load(level_dir + level_name + ".tscn").instantiate()
	add_child(level)
