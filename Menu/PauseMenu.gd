extends Control

func _on_Restart_pressed():
	get_parent().restart()
	hide()

func _on_Exit_pressed():
	get_tree().quit()

func _on_LevelSelect_pressed():
	get_parent().back()
	hide()
