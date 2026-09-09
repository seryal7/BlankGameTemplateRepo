function updateVideo() {
    var _sizes = [
        [1280, 720],
        [1600, 900],
        [1920, 1080],
        [2560, 1440],
        [3840, 2160]
    ]

    global.resolution = clamp(global.resolution, 0, array_length(_sizes) - 1)

    var _target_w = _sizes[global.resolution][0]
    var _target_h = _sizes[global.resolution][1]

    global.width = _target_w
    global.height = _target_h

    // The game always renders against the same 1920x1080 UI/game coordinate space.
    display_set_gui_size(BASE_W, BASE_H)

    if global.fullscreen {
        window_set_fullscreen(true)
    } else {
        window_set_fullscreen(false)
        window_set_size(_target_w, _target_h)
        window_center()
    }

    // Keep the application surface at the authored resolution. GameMaker handles
    // scaling to the actual window/display without changing gameplay coordinates.
    if surface_exists(application_surface) {
        surface_resize(application_surface, BASE_W, BASE_H)
    }
}
