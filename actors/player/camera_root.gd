extends Node3D
class_name PlayerCamera

const VERT_MAX = 5*PI/12.0
const VERT_MIN = -5*PI/12.0

@onready var _h := $h as Node3D
@onready var _v := $h/v as Node3D
#@onready var _camera := $h/v/camera as Camera3D

var mouse_sens := 2 / 1000.0
var hor_rotation: float:
    get:
        return _h.rotation.y
var ver_rotation: float:
    get:
        return _v.rotation.x


func _input(event: InputEvent) -> void:
    if event is InputEventMouseMotion:
        _process_mouse(event)


func _process_mouse(e: InputEventMouseMotion) -> void:
    _h.rotation.y -= e.relative.x * mouse_sens
    _v.rotation.x = clampf(_v.rotation.x - e.relative.y * mouse_sens,
        VERT_MIN, VERT_MAX)
