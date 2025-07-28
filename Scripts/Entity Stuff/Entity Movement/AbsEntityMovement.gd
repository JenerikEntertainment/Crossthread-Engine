class_name AbsEntityMovement
extends Node3D

@export var playerEntity : PlayerEntity
@export var moveSpeed: float = 1

var moveDirection : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	doMovement(delta)

func setMovementDirection(x, y):
	moveDirection = Vector2(x,y)
	#print ("I have moved by these little jiggys: ", x, " ", y)

func doMovement(delta) :
	pass

func getPosition() :
	return transform.origin
	
func setPosition(pos) :
	transform.origin = pos

func OnSave(saveData) -> Dictionary :
	saveData[playerEntity.name + "_playerPosition"] = getPosition()
	return saveData
	
func OnLoad(loadedData) :
	setPosition(loadedData[playerEntity.name + "_playerPosition"])
