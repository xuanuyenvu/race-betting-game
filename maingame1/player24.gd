extends KinematicBody2D

var chose = false
var bet = 0
var velocity = Vector2()
var direction =1
var speed = 7
var slow_dow = 10
var speed_up = 30
func _ready():
	randomize()
func roll_a_dice(minimum, maximum):
	var roll = randi() % (maximum-minimum+1) + minimum
	return roll

func _physics_process(delta):
	set_modulate(Color( 0.78, 0.08, 0.52, 1 ) )
	
	velocity.x = speed*direction*roll_a_dice(1,5)
	move_and_slide(velocity)






func _on_check4_body_entered(body):
	if body.get_name() == "slow_spell_1" || body.get_name() == "slow_spell_2" || body.get_name() == "slow_spell_3" || body.get_name() == "slow_spell_4" || body.get_name() == "slow_spell_5"  :
		$Timer_slow_4.start()
		set_modulate(Color(1,0.3,1,1))
		speed = speed - slow_dow
	elif body.get_name() == "fast_spell_1" || body.get_name() == "fast_spell_2" || body.get_name() == "fast_spell_3" || body.get_name() == "fast_spell_4" || body.get_name() == "fast_spell_5"  :
		$Timer_fast_4.start()
		speed = speed + speed_up
	
	
	
func _on_Timer_slow_4_timeout():
	speed = speed + slow_dow
	set_modulate(Color(1,1,1,1)) 


	
func _on_Timer_fast_4_timeout():
	speed = speed - speed_up
	set_modulate(Color(1,1,1,1)) 




func _on_check4_body_exited(body):
	if body.get_name() == "goal":
		speed = 0
		velocity.x = 0
		lerp(velocity.x,0,0.5)
		$AnimatedSprite.play("cheer")
