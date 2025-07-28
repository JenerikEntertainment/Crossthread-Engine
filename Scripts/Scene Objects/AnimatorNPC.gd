extends AbsNPC


func onAccept() :
	%AnimationPlayer.play("defaultEvent")

func callDialogue(dialogueString) :
	if dialogueString == "" || dialogueString == null :
		dialogueString = dialoguePath
	
	Dialogic.start(dialogueString)
