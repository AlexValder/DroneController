extends Node3D


func _ready() -> void:
    var mon := $level/monitor as MeshInstance3D
    var mat := mon.get_active_material(0) as StandardMaterial3D

    var drone := get_tree().get_nodes_in_group("drone")[0] as Drone
    var viewport := drone.get_node("viewport") as Viewport
    mat.albedo_texture = viewport.get_texture()
