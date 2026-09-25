extends CPUParticles3D

func _ready() -> void:
	emitting = false
	one_shot = true
	
	get_tree().create_timer(2.0).timeout.connect(queue_free)

func setup(texture: Texture2D = null) -> void:
	if mesh and texture:
		var new_mesh : Mesh = mesh.duplicate()
		var new_mat : Mesh = new_mesh.material.duplicate()
		new_mat.albedo_texture = texture
		new_mesh.material = new_mat
		mesh = new_mesh
	
	restart()
	emitting = true
