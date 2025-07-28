extends AbsEntityMovement

func doMovement(delta):
	var moveDirection3D = Vector3(moveDirection.x, 0, moveDirection.y) * delta * moveSpeed
	
	global_translate(moveDirection3D)
