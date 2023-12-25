extends CharWithCamera
class_name Drone

const SPEED := 90.0
const UP_SPEED := 70.0

@onready var _camera := $viewport/camera_root as DroneCamera


func _physics_process(delta: float) -> void:
    if !is_on_floor():
        var s := Input.get_axis("rotate_right", "rotate_left")
        rotate_y(delta * s)

        var dir := Input.get_vector(
            "left", "right", "forward", "back").rotated(-_camera.hor_rotation)
        velocity = (transform.basis *\
            Vector3(dir.x, 0, dir.y)).normalized() * SPEED * delta

    if Input.is_action_pressed("up"):
        velocity.y += delta * UP_SPEED
    elif Input.is_action_pressed("down"):
        velocity.y -= delta * UP_SPEED
    move_and_slide()
    camera.position = position
