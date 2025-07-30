class_name AbsNPC
extends IndicatorUser

@export var dialoguePath : String

func _ready():
	super()
	process_mode = Node.PROCESS_MODE_ALWAYS

func onPlayerEntered() :
	GameManager.playerControls.currentInteraction = self
	
func onPlayerExit() :
	if GameManager.playerControls.currentInteraction == self :
		GameManager.playerControls.currentInteraction = null
		
		if Dialogic.current_timeline != null and Dialogic.current_timeline.resource_path == dialoguePath :
				Dialogic.end_timeline()
		#Dialogic.current_timeline = null

func onAccept() :
	if(Dialogic.current_timeline == null) :
		Dialogic.start(dialoguePath)
		
		#await get_tree().create_timer(1).timeout
		#Dialogic.process_mode = Node.PROCESS_MODE_ALWAYS
		#get_tree().paused = true
	#else :
		#get_tree().paused = false
