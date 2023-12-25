extends Node3D
class_name DroneCamera

const MAX_VERT := 0.0
const MIN_VERT := -PI/2

@onready var _h := $h as Node3D
@onready var _v := $h/v as Node3D

var sens := 2.0
var hor_rotation: float:
    get:
        return _h.rotation.y
var ver_rotation: float:
    get:
        return _v.rotation.x


func _physics_process(delta: float) -> void:
    if Input.is_action_pressed("ui_up"):
        _v.rotation.x = clampf(_v.rotation.x + sens * delta,
            MIN_VERT, MAX_VERT)
    elif Input.is_action_pressed("ui_down"):
        _v.rotation.x = clampf(_v.rotation.x - sens * delta,
            MIN_VERT, MAX_VERT)
    else:
        _h.rotation.y -= Input.get_axis("ui_left", "ui_right")\
            * sens * delta
