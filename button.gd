extends Area3D

@export var ui_scene: PackedScene  # Assign the UI scene in the inspector

func _ready():
    connect("input_event", _on_input_event)

func _on_input_event(camera, event, position, normal, shape_idx):
    if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
        _show_ui()

func _show_ui():
    if ui_scene:
        var ui_instance = ui_scene.instantiate()
        get_tree().current_scene.add_child(ui_instance)