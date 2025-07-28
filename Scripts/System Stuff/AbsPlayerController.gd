class_name AbsPlayerController
extends Node

@export var mainPlayer : PlayerEntity

@export var defaultWalkSpeed = 1.0
@export var runSpeed = 1.5


@onready var saveUI : Node = %SaveDataUI


#temporarily modified variables
var canSave = false
var currentNPC = null

# Called when the node enters the scene tree for the first time.
func _ready():
	setSaveUI(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	#note this will probably be overwritten
	if multiplayer.is_server() :
		processInput(delta)

func processInput(delta) :
		doMovement(delta)
		doAcceptButton(delta)
		doAttackButton(delta) #TODO: Make settings, so that you can not run this if not using ABS
	
func doAttackButton(delta) :
	if Input.is_action_just_pressed("DefaultAttack") :
		mainPlayer.battleEntity.defaultAttack()
	
func doMovement(delta) :
	var vertical = Input.get_axis("MoveDown", "MoveUp")
	var horizontal = Input.get_axis("MoveRight", "MoveLeft")
	mainPlayer.entityMovement.setMovementDirection(horizontal * delta, vertical * delta)
	
	mainPlayer.entityMovement.moveSpeed = runSpeed if Input.is_action_pressed("Run") else defaultWalkSpeed
	
func doAcceptButton(delta) :
	if Input.is_action_just_pressed("ActionAccept") :
		if currentNPC != null :
			currentNPC.onAccept()
		elif(canSave) :
			setSaveUI(true)
			absDoAcceptButton(delta)
			return

func absDoAcceptButton(delta) :
	pass


func setSaveUI(show) :
	saveUI.visible = show
	saveUI.set_process(show)
	get_tree().paused = show
