extends CharacterBody3D
class_name CharWithCamera


@export var camera: Camera3D
@export var current_view: bool:
    get:
        if camera:
            return camera.current
        return false
    set(value):
        if camera:
            camera.current = value
        else:
            push_error("Camera not set")
