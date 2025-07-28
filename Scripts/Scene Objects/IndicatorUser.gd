class_name IndicatorUser
extends Node

@onready var indicator = $Indicator

# Called when the node enters the scene tree for the first time.
func _ready():
	indicator.hide()

var playersPresent = []


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playersPresent.is_empty() :
		indicator.hide()
	else :
		indicator.show()




func _on_area_3d_body_entered(body):
	if GameManager.playerControls.mainPlayer.entityMovement.moveDirection.length() >= 0.003 :
		if(body.is_in_group("PlayerCharacters")) :
			playersPresent.push_back(body)
			onPlayerEntered()


func _on_area_3d_body_exited(body):
	if GameManager.playerControls.mainPlayer.entityMovement.moveDirection.length() >= 0.003 :
		if(body.is_in_group("PlayerCharacters")) :
			playersPresent.erase(body)
			onPlayerExit()
		
		
func onPlayerEntered() :
	pass
	
func onPlayerExit() :
	pass

func onAccept() :
	pass
