extends Node2D

var one = Global.one
var two = Global.two
var three = Global.three
var time = Global.time


func _ready():
	$GUI.hide()
	for i in range(1,7):
		var l = get_node("Category" + str(i) + "/Label" + str(i))
		l.margin_left = 5
		l.margin_top = 5
		l.margin_right = 107
		l.margin_bottom = 107
		for j in range(1,4):
			var k = get_node("Piece" + str(i) + str(j) + "/Label" + str(i) + str(j))
			k.margin_left = 5
			k.margin_top = 5
			k.margin_right = 107
			k.margin_bottom = 107

	_update()


func _update():
	var catg = Global.catg
	catg = catg.split("\n", true, 6)
	one = Global.one
	two = Global.two
	three = Global.three
	time = int(Global.time) / 5
	$TimerShow/Timer.wait_time = time
	var lenMax = 0
	for i in range(1,7):
		get_node("Category" + str(i) + "/Label" + str(i)).text = catg[i-1]
		get_node("Piece" + str(i) + "1/Label" + str(i) + "1").text = one
		get_node("Piece" + str(i) + "2/Label" + str(i) + "2").text = two
		get_node("Piece" + str(i) + "3/Label" + str(i) + "3").text = three
		if len(catg[i-1]) > lenMax:
			lenMax = len(catg[i-1])

		if i == 6:
			if lenMax <= 4:
				get_node("Category1/Label1").get("custom_fonts/font").set_size(38)
			if lenMax == 5:
				get_node("Category1/Label1").get("custom_fonts/font").set_size(33)
			elif lenMax <= 6:
				get_node("Category1/Label1").get("custom_fonts/font").set_size(28)
			elif lenMax <= 8:
				get_node("Category1/Label1").get("custom_fonts/font").set_size(23)
			elif lenMax >= 9:
				get_node("Category1/Label1").get("custom_fonts/font").set_size(18)
				for j in range(1,7):
					get_node("Category" + str(j) + "/Label" + str(j)).autowrap = true

	$Delay.start()


func _process(delta):
	if Input.is_action_just_pressed("fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
	elif Input.is_action_just_pressed("config"):
		$GUI.show()
	elif Input.is_action_just_pressed("teamA") or Input.is_action_just_pressed("teamB") or Input.is_action_just_pressed("lost") or Input.is_action_just_pressed("neutral"):
		$Delay.start()
	elif Input.is_action_just_pressed("timer"):
		time = int(Global.time)
		$TimerShow/TimerLabel.text = str(time)
		$TimerShow.value = 100
		$TimerShow/Timer.start()


func _on_GUI_update():
	_update()
	$GUI.hide()


func _update_score():
	var A = 0
	var B = 0
	for i in range(1,7):
		var j = get_node("Piece" + str(i) + "1/Area2D/NinePatchRect")
		var k = get_node("Piece" + str(i) + "2/Area2D/NinePatchRect")
		var l = get_node("Piece" + str(i) + "3/Area2D/NinePatchRect")
		if j.self_modulate.to_html(false) == "f56969":
			A += int(one)
		elif j.self_modulate.to_html(false) == "6969f5":
			B += int(one)

		if k.self_modulate.to_html(false) == "f56969":
			A += int(two)
		elif k.self_modulate.to_html(false) == "6969f5":
			B += int(two)

		if l.self_modulate.to_html(false) == "f56969":
			A += int(three)
		elif l.self_modulate.to_html(false) == "6969f5":
			B += int(three)

		if i == 6:
			$TeamA/ScoreA.text = str(A)
			$TeamB/ScoreB.text = str(B)


func _on_Delay_timeout():
	_update_score()


func _on_Timer_timeout():
	$TimerShow.value -= 20
	time -= (int(Global.time)/5)
	$TimerShow/TimerLabel.text = str(time)
	if $TimerShow.value == 0:
		$TimerShow/Timer.stop()
