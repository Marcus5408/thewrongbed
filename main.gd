extends Node3D

@onready var PlaySubViewport = $PlaySubViewport
@onready var PlayViewportQuad = $ViewportQuad

func _ready():
    await RenderingServer.frame_post_draw
    # Clear the viewport.
    var viewport = PlaySubViewport
    PlaySubViewport.set_clear_mode(SubViewport.CLEAR_MODE_ONCE)

    # Retrieve the texture and set it to the viewport quad.
    # var surface_material = PlayViewportQuad.get_surface_override_material(0)
    PlayViewportQuad.set_surface_override_material(0, PlaySubViewport.get_texture())
