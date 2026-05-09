extends Control
class_name ChapterSelect

@export var level_button_scene: PackedScene
@export var grid_container: GridContainer

func _ready():
	var progress = SaveManager.load_progress()
	for i in range(1, 101):
		var btn = level_button_scene.instantiate()
		btn.text = str(i)
		btn.disabled = i > progress["unlocked_level"]
		grid_container.add_child(btn)
		btn.connect("pressed", _on_level_selected.bind(i))

func _on_level_selected(level_num: int):
	print("Level Selected: ", level_num)
	# Load level scene logic
