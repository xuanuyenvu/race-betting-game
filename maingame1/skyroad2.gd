extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var timer = null

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(48)
	timer.connect("timeout", self, "on_timeout")
	add_child(timer)
	timer.start()

func on_timeout():
	get_tree().change_scene("res://menu/Victory_Scene_1_2.tscn")
