extends Node3D

@onready var character: Player = $Player
@onready var target: Node3D = $Target
@onready var camera: Camera3D = $Camera3D
@onready var ray_cast: RayCast3D = $RayCast3D

func _physics_process(delta):
	if character:
		character.set_target_position(target.global_transform.origin)
		
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed:
			var mouse_position = get_viewport().get_mouse_position()
			ray_cast.global_transform.origin = camera.project_ray_origin(mouse_position)
			ray_cast.target_position = camera.project_ray_normal(mouse_position) * 1000
			
			ray_cast.force_raycast_update()
			
			var destination = ray_cast.get_collision_point()
			destination.y = 1
			
			print(ray_cast.get_collider())
			
			target.global_transform.origin = destination
			
			print(destination)
