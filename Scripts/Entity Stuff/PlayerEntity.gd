class_name PlayerEntity
extends Node

@export var entityMovement : AbsEntityMovement
@export var battleEntity : AbsBattleEntity

func _enter_tree() :
	set_multiplayer_authority(name.to_int())
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
