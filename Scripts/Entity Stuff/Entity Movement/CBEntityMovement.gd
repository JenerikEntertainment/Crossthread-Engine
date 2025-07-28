extends AbsEntityMovement

@export var cameraArm : Node3D
@export var camera : Camera3D

@export var characterBody : CharacterBody3D
@export var speedFactor: float = 250 #how much you have to increase the total speed for this movement style


@export var animationController : AnimationController

func _ready():
	pass
	
func process() :
	pass

func _physics_process(delta):
	doMovement(delta)

func doMovement(delta) :
	#assign move direction to animator if changed
	if animationController != null :
		if moveDirection.length() >= 0.003 :
			animationController.moving = true
			animationController.direction = moveDirection
		else :
			animationController.moving = false
		
	var cameraForward : Vector3 = (global_position - camera.global_position).normalized()
	var cameraRight : Vector3 = cameraArm.transform.basis.x
	
	var movement : Vector3 = (cameraForward * moveDirection.y + cameraRight * moveDirection.x).normalized()
	
	movement = movement * delta * moveSpeed * speedFactor
	movement.y = 0
	characterBody.velocity = movement
	
	# Add the gravity.
	if not characterBody.is_on_floor():
		characterBody.velocity += characterBody.get_gravity() * delta
	
	
		
	characterBody.move_and_slide()
	
func getPosition() :
	return characterBody.transform.origin
	
func setPosition(pos) :
	characterBody.transform.origin = pos
