extends CanvasLayer

signal update

func _on_GUI_visibility_changed():
	var catg = Global.catg
	var one = Global.one
	var two = Global.two
	var three = Global.three
	$CategoryEdit.text = catg
	$Edit1.value = int(one)
	$Edit2.value = int(two)
	$Edit3.value = int(three)


func _on_Edit1_value_changed(value1):
	$EditLabel1.text = str(value1)


func _on_Edit2_value_changed(value2):
	$EditLabel2.text = str(value2)


func _on_Edit3_value_changed(value3):
	$EditLabel3.text = str(value3)


func _on_TimerEdit_value_changed(value):
	$Timer.text = str(value)


func _on_Apply_pressed():
	Global.catg = $CategoryEdit.text
	Global.one = str($Edit1.value)
	Global.two = str($Edit2.value)
	Global.three = str($Edit3.value)
	Global.time = str($TimerEdit.value)
	emit_signal("update")
