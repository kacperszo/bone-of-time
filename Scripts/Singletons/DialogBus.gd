extends Node


var current_dialog: Dialog
signal new_dialog(Dialog)

func start_dialog(dialog: ):
	if(dialog and dialog.action != "close"):
		current_dialog = dialog
		new_dialog.emit(current_dialog)
