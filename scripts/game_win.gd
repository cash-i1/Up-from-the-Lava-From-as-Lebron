extends Control

@onready var score = $score
@onready var retry = $buttons2/retry
@onready var http = $http
@onready var status = $status


var url = "http://dreamlo.com/lb/cDBT1v2pkEC_cuoZy7-BzQEO5o81ms5kanfKzY2LKYdQ"
var method = HTTPClient.METHOD_GET



func _process(delta):
	score.text = "Score: " + str(global.score)


func _on_retry_pressed():
	get_tree().paused = true
	get_tree().change_scene_to_file("res://scenes/levels/level"+str(global.current_level)+".tscn")
	get_tree().paused = false

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	get_tree().paused = false

func _on_quit_pressed():
	get_tree().quit()
	
func _on_http_request_completed(result, response_code, headers, body):
	print(result, response_code, headers, body.get_string_from_utf8())
	if response_code == 20:
		status.text = "saved " + str(global.score) + " as " + str(global.local_name) + "."
	else:
		status.text = "couldn't save score: " + str(response_code)
	


func _on_finish_line_body_entered(body):
	var score = (Time.get_ticks_msec() - global.global_start_time)
	var request = url + "/add/" + str(global.local_name) + "/" + str(score)
	print(request)
	http.request(request, PackedStringArray(), method)
