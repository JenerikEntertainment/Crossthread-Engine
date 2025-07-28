extends IndicatorUser


func onPlayerEntered() :
		GameManager.playerControls.canSave = true
	
func onPlayerExit() :
		GameManager.playerControls.canSave = false
