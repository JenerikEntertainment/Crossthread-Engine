class_name AbsBattleEntity
extends Node

@export var playerEntity : Node3D

@export var hp = 1

@export var defaultAttackIndex : int = 0

@export var skills = []


func doDamage(damage) :
	hp -= damage
	if(hp <= 0) :
		doDeath()

func doDeath() :
	print("you died idiot lol")
	playerEntity.queue_free()
	
func defaultAttack() :
	var skill = skills[defaultAttackIndex].instantiate()
	skill.user = self
	add_child(skill)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#Definable for anything under "Players" Node
func OnSave(saveData)  -> Dictionary :
	saveData[playerEntity.name + "_hp"] = hp
	return saveData

#Definable for anything under "Players" Node
func OnLoad(loadedData) :
	hp = loadedData[playerEntity.name + "_hp"]
