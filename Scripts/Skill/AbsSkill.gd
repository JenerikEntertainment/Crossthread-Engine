class_name AbsSkill
extends Node3D

var user : Node = null

@export var damage = 1
@export var skillDestroyTimeout = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(skillDestroyTimeout).timeout
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hitbox_body_entered(body : Node):
	var battleEntities = body.find_children("*", "AbsBattleEntity")
	
	for entity in battleEntities:
		if(user == null || entity.get_instance_id() != user.get_instance_id()) :
			entity.doDamage(damage)
