if room != rGameRoom {
    var _fade = clamp(ui_room_enter, 0, 1)
    var _navy = make_color_rgb(9, 13, 21)
    var _panel = make_color_rgb(14, 19, 29)
    var _line = make_color_rgb(85, 104, 136)
    var _accent = make_color_rgb(115, 166, 242)
    var _text_dim = make_color_rgb(151, 163, 184)

    // Keep the room's checker/background visible while calming it down.
    draw_set_alpha(0.36 * _fade)
    draw_set_color(_navy)
    draw_rectangle(0, 0, BASE_W, BASE_H, false)

    // Slow ambient sweeps make the template feel alive without needing art assets.
    var _sweep = frac(ui_time * 0.0012)
    var _sx = lerp(-420, BASE_W + 420, _sweep)
    draw_set_alpha(0.035 * _fade)
    draw_set_color(_accent)
    draw_triangle(_sx - 360, 0, _sx + 80, 0, _sx - 120, BASE_H, false)

    // Top title rule.
    draw_set_alpha(0.42 * _fade)
    draw_set_color(_line)
    draw_line(640, 138, 1280, 138)
    draw_set_alpha(0.85 * _fade)
    draw_circle(BASE_W * 0.5, 138, 4, false)

    if room == rMainMenu {
        // Main navigation frame now fully contains every button.
        draw_set_alpha(0.28 * _fade)
        draw_set_color(c_black)
        draw_rectangle(64, 586, 474, 1040, false)

        draw_set_alpha(0.72 * _fade)
        draw_rectangle_color(52, 574, 462, 1028, make_color_rgb(22, 29, 42), _panel, _panel, make_color_rgb(22, 29, 42), false)

        draw_set_alpha(0.58 * _fade)
        draw_set_color(_line)
        draw_rectangle(52, 574, 462, 1028, true)
        draw_rectangle(60, 582, 454, 1020, true)

        // Ornamental rails.
        draw_set_alpha(0.80 * _fade)
        draw_set_color(_accent)
        draw_line(76, 604, 150, 604)
        draw_line(364, 604, 438, 604)
        draw_circle(257, 604, 4, false)

        draw_set_halign(fa_center)
        draw_set_valign(fa_middle)
        draw_set_alpha(0.75 * _fade)
        draw_set_color(_text_dim)
        draw_text(257, 638, "MAIN MENU")
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
    } else {
        // Unified settings work surface.
        draw_set_alpha(0.28 * _fade)
        draw_set_color(c_black)
        draw_rectangle(64, 286, 1226, 1038, false)

        draw_set_alpha(0.68 * _fade)
        draw_rectangle_color(52, 274, 1214, 1026, make_color_rgb(21, 28, 40), _panel, _panel, make_color_rgb(21, 28, 40), false)

        draw_set_alpha(0.48 * _fade)
        draw_set_color(_line)
        draw_rectangle(52, 274, 1214, 1026, true)
        draw_rectangle(60, 282, 1206, 1018, true)
        draw_line(520, 314, 520, 986)

        // Left navigation/content label.
        draw_set_alpha(0.82 * _fade)
        draw_set_color(_accent)
        draw_line(92, 326, 168, 326)
        draw_circle(178, 326, 3, false)
    }

    draw_set_alpha(1)

    scribble_draw_text_ext(BASE_W * 0.5, BASE_H * 0.072, locale("game_title"), MENU_TITLE_SCALE)

    if room == rSettings scribble_draw_text_ext(BASE_W * 0.5, BASE_H * 0.18, locale("settings"), MENU_SUBTITLE_SCALE)
    else if room == rAudio scribble_draw_text_ext(BASE_W * 0.5, BASE_H * 0.18, locale("audio"), MENU_SUBTITLE_SCALE)
    else if room == rVideo scribble_draw_text_ext(BASE_W * 0.5, BASE_H * 0.18, locale("video"), MENU_SUBTITLE_SCALE)
    else if room == rGameplay scribble_draw_text_ext(BASE_W * 0.5, BASE_H * 0.18, locale("gameplay"), MENU_SUBTITLE_SCALE)
    else if room == rControls scribble_draw_text_ext(BASE_W * 0.5, BASE_H * 0.18, locale("controls"), MENU_SUBTITLE_SCALE)

    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    draw_set_color(_text_dim)

    if room == rSettings {
        draw_text(92, 348, "SETTINGS")
        draw_set_color(make_color_rgb(113, 126, 149))
        draw_text(548, 326, "Choose a category. Changes are saved when you leave a settings screen.")
    }

    if room == rAudio {
        draw_text(92, 348, "AUDIO MIX")
        draw_set_color(make_color_rgb(113, 126, 149))
        draw_text(548, 326, "Three-stage mixer with independent master, music, and sound-effect levels.")
        draw_text(548, 364, "Tip: keep music below master so effects remain readable during gameplay.")
    }

    if room == rVideo {
        draw_text(92, 348, "DISPLAY")
        draw_set_color(make_color_rgb(113, 126, 149))
        draw_text(548, 326, "Resolution controls the actual render output in both windowed and fullscreen modes.")

        var _sizes = ["1280 x 720", "1600 x 900", "1920 x 1080", "2560 x 1440", "3840 x 2160"]
        var _res_text = _sizes[clamp(global.resolution, 0, array_length(_sizes) - 1)]
        draw_set_color(make_color_rgb(194, 205, 224))
        draw_text(548, 408, "PENDING OUTPUT")
        draw_set_color(c_white)
        draw_text(548, 448, _res_text)
        draw_set_color(make_color_rgb(151, 163, 184))
        draw_text(548, 492, global.fullscreen ? "Fullscreen" : "Windowed")
        draw_text(548, 532, "16:9 authored layout - 1920 x 1080 GUI space")

        if global.videoDirty {
            draw_set_color(make_color_rgb(240, 194, 112))
            draw_text(548, 594, "Changes pending - select APPLY to rebuild the output.")
        } else {
            draw_set_color(make_color_rgb(124, 190, 146))
            draw_text(548, 594, "Display settings applied.")
        }
    }

    if room == rGameplay {
        draw_text(92, 348, "GAMEPLAY")
        draw_set_color(make_color_rgb(113, 126, 149))
        draw_text(548, 326, "Template-level gameplay preferences. Add project-specific options here later.")
    }

    if room == rControls {
        draw_text(92, 348, "CONTROLS")
        draw_set_color(make_color_rgb(113, 126, 149))
        draw_text(1060, 326, "Select an action, then press the new input.")
    }

    // Footer hints.
    draw_set_alpha(0.74)
    draw_set_color(make_color_rgb(126, 139, 162))
    draw_set_halign(fa_left)
    draw_set_valign(fa_bottom)
    draw_text(34, BASE_H - 24, "F2  DEBUG")
    draw_set_halign(fa_right)
    draw_text(BASE_W - 34, BASE_H - 24, "TEMPLATE " + TEMPLATE_VERSION)
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    draw_set_alpha(1)
}
