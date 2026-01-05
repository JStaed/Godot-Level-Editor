extends Node2D

@export var current_project: String = ""
@export var scene_dir: String = ""

var saved: bool = false

var box: Resource = preload("res://assets/prefabs/box.tscn")

func _ready():
	box.resource_name = "Box"

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("editor_place_obj"):
		place_obj(box, event.position)
		saved = false
	elif event.is_action_pressed("editor_save_as"):
		save_scene_as()
	elif event.is_action_pressed("editor_save"):
		if current_project != "":
			save_scene(current_project)
		else:
			save_scene_as()
	elif event.is_action_pressed("editor_load"):
		load_scene(current_project)

func place_obj(obj_resource: Resource, pos: Vector2) -> void:
	var obj: Node = obj_resource.instantiate()
	obj.position = pos
	$Map.add_child(obj)
	obj.set_owner($Map)
	obj.name = obj_resource.resource_name

func save_scene(scene_name: String = current_project):
	var scene = PackedScene.new()
	scene.pack($Map)
	ResourceSaver.save(scene, scene_dir + scene_name + ".tscn")
	saved = true

func save_scene_as():
	print("Save as")

func load_scene(scene_name: String = current_project) -> void:
	var scene: Node = load(scene_dir + scene_name + ".tscn").instantiate()
	$Map.free()
	add_child(scene)
	scene.name = "Map"
