extends Node
class_name Dialog
	
@export var dialog_id: String = ""
@export var action: String = ""
@export var label_a = ""
@export var label_b = ""
@export var options: Array[DialogOption] = []

func _load_from_file(file):
	var _file = FileAccess.open(file, FileAccess.READ)
	var content = _file.get_as_text()
	return content


func from_file(file):
	return self.from_json(_load_from_file(file))

func from_json(json):
	var parsedJson = JSON.parse_string(json)
	self.dialog_id = parsedJson["dialog_id"]
	self.action = parsedJson["action"]
	self.label_a = parsedJson["labelA"]
	self.label_b = parsedJson["labelB"]
	
	for option in parsedJson["options"]:
		#parse options
		var parsedOption = DialogOption.new()
		parsedOption.label = option["label"]
		parsedOption.followUpDialog = Dialog.new().from_json(JSON.stringify(option.followUpDialog))
		self.options.append(parsedOption)
	
	return self
