class_name AnimationController
extends Node

var direction : Vector2 = Vector2.ZERO

var moving : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	doDirectionAnimation()

func doDirectionAnimation() :
	#print(moving)
	if !moving :
			
		if direction.y > 0 :
			$".".play("idle_up")
		elif direction.y < 0 :
			$".".play("idle_down")
		elif direction.x > 0 :
			$".".play("idle_left")
		elif direction.x < 0 :
			$".".play("idle_right")
	else :
			
		if direction.y > 0 :
			$".".play("walk_up")
		elif direction.y < 0 :
			$".".play("walk_down")
		elif direction.x > 0 :
			$".".play("walk_left")
		elif direction.x < 0 :
			$".".play("walk_right")
	#$"../AnimationTree".tree_root.set_parameter('blend_position', direction)
