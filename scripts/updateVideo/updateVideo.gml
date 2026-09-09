function updateVideo() {
    var _sizes = [
        [1280, 720],
        [1600, 900],
        [1920, 1080],
        [2560, 1440],
        [3840, 2160]
    ]

    global.resolution = clamp(round(global.resolution), 0, array_length(_sizes) - 1)

    var _target_w = _sizes[global.resolution][0]
    var _target_h = _sizes[global.resolution][1]

    global.width = _target_w
    global.height = _target_h

    // UI and game code always use the authored 1920 x 1080 coordinate space.
    display_set_gui_size(BASE_W, BASE_H)

    // The selected resolution is the render/output resolution. This makes the
    // setting meaningful in both windowed and fullscreen modes.
    application_surface_enable(true)
    if surface_exists(application_surface) {
        if surface_get_width(application_surface) != _target_w || surface_get_height(application_surface) != _target_h {
            surface_resize(application_surface, _target_w, _target_h)
        }
    }

    // Rebuild the OS window cleanly. Going windowed first prevents GameMaker
    // from retaining a stale fullscreen/window size after a resolution change.
    window_set_fullscreen(false)
    window_set_size(_target_w, _target_h)
    window_center()

    if global.fullscreen {
        window_set_fullscreen(true)
    }

    // Record what was actually applied for the video screen and debugger.
    global.appliedResolution = global.resolution
    global.appliedFullscreen = global.fullscreen
    global.videoDirty = false
}
