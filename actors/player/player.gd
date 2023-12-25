extends CharWithCamera
class_name Player

const SPEED := 5.0
const JUMP_VELOCITY := 4.5

@onready var _camera := $camera_root as PlayerCamera
@onready var _shape := $shape as Node3D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity := ProjectSettings.get_setting("physics/3d/default_gravity") as float


func _process(_delta: float) -> void:
    _shape.rotation.y = _camera.hor_rotation


func _physics_process(delta: float) -> void:
    if not is_on_floor():
        velocity.y -= gravity * delta

    if Input.is_action_just_pressed("jump") and is_on_floor():
        velocity.y = JUMP_VELOCITY

    var input_dir := Input.get_vector(
        "left", "right", "forward", "back").rotated(-_camera.hor_rotation)
    var direction := (transform.basis *\
        Vector3(input_dir.x, 0, input_dir.y)).normalized()
    if direction:
        velocity.x = direction.x * SPEED
        velocity.z = direction.z * SPEED
    else:
        velocity.x = move_toward(velocity.x, 0, SPEED)
        velocity.z = move_toward(velocity.z, 0, SPEED)

    move_and_slide()
