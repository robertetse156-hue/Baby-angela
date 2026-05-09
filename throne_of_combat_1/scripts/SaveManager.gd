extends Node
class_name SaveManager

const SAVE_PATH = "user://save_data.json"

static func save_progress(unlocked_level: int):
	var data = {
		"unlocked_level": unlocked_level
	}
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var json_string = JSON.stringify(data)
	file.store_string(json_string)
	file.close()

static func load_progress() -> Dictionary:
	if not FileAccess.file_exists(SAVE_PATH):
		return {"unlocked_level": 1}

	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var content = file.get_as_text()
	var data = JSON.parse_string(content)
	file.close()
	return data
