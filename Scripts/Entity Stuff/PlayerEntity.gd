class_name PlayerEntity
extends Node

@export var entityMovement : AbsEntityMovement
@export var battleEntity : AbsBattleEntity
@export var animationController : AnimationController

func _enter_tree() :
	set_multiplayer_authority(name.to_int())
	
# Called when the node enters the scene tree for the first time.
func _ready():
	animationController = $CharacterBody/SpriteBuilder/BodySprite/AnimationPlayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
