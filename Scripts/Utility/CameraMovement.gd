extends Node3D

var rotationSpeed : float = 1.3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	global_rotate(Vector3.UP, Input.get_axis("CameraRight", "CameraLeft") * delta * rotationSpeed)
