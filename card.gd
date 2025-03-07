extends CSGBox3D

var original_position: Vector3
var dragging: bool = false

func _ready():
    original_position = global_transform.origin

func _input(event):
    if event is InputEventMouseButton:
        if event.button_index == MOUSE_BUTTON_LEFT:
            if event.pressed:
                dragging = true
            else:
                dragging = false
                if global_transform.origin.x < original_position.x + 0.70:
                    # snap back to original position
                    global_transform.origin = original_position

func _process(delta):
    if dragging:
        var mouse_pos = get_viewport().get_mouse_position()
        # translate mouse x to 3D space
        var ray = get_viewport().get_camera_3d().project_ray_origin(mouse_pos)
        var ray_direction = get_viewport().get_camera_3d().project_ray_normal(mouse_pos)
        var distance = (original_position - ray).length()
        var new_position = ray + ray_direction * distance
        new_position.y = original_position.y
        new_position.z = original_position.z
        # constrain the x position to be within the original and original x + 10
        new_position.x = clamp(new_position.x, original_position.x, original_position.x + 0.72)
        # set the new position
        global_transform.origin = new_position
