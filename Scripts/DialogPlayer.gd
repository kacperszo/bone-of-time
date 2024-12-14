extends VSplitContainer

var dialog: Dialog

func _ready() -> void:
	visible = false
	DialogBus.new_dialog.connect(on_new_dialog)
func on_new_dialog(dialog):
	render(dialog)
func render(dialog) -> void:
	self.dialog = dialog
	self.visible = true
	$"HSplitContainer/Dialog A/Label A".text=dialog.label_a
	$"HSplitContainer/Dialog B/Label B".text=dialog.label_b
	$"Dialog Selector/VBoxContainer/Option1".text = dialog.options[0].label if len(dialog.options) > 0 else ""
	$"Dialog Selector/VBoxContainer/Option2".text = dialog.options[1].label if len(dialog.options) > 1 else ""
	$"Dialog Selector/VBoxContainer/Option3".text = dialog.options[2].label if len(dialog.options) > 2 else ""
	


func _on_option_1_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		visible=false
		DialogBus.start_dialog(dialog.options[0].followUpDialog)

func _on_option_2_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		visible=false
		DialogBus.start_dialog(dialog.options[1].followUpDialog)


func _on_option_3_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		visible=false
		DialogBus.start_dialog(dialog.options[2].followUpDialog)
