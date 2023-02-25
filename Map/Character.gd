extends RigidBody3D
class_name Player

@onready var navigation_agent: NavigationAgent3D = $NavigationAgent3D

var target: Node3D
var speed: int = 5
	
func set_target_position(new_target_position: Vector3):
	navigation_agent.set_target_position(new_target_position)
	
func _integrate_forces(state):	
	var current_position = global_transform.origin
	var next_position = navigation_agent.get_next_path_position()
	var new_velocity = (next_position - current_position).normalized() * speed
	navigation_agent.set_velocity(new_velocity)
	

func _on_navigation_agent_3d_velocity_computed(safe_velocity):	
	set_linear_velocity(safe_velocity)
	


func _on_navigation_agent_3d_target_reached():
	pass # Replace with function body.
