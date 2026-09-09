// Shared menu presentation layer.
if room != rGameRoom {
    // Dim moving checkerboard into a restrained neutral background.
    draw_set_alpha(0.78)
    draw_set_color(make_color_rgb(9, 12, 18))
    draw_rectangle(0, 0, BASE_W, BASE_H, false)

    // Ambient bands.
    draw_set_alpha(0.18)
    draw_set_color(make_color_rgb(66, 95, 145))
    draw_rectangle(0, 0, BASE_W, 8, false)
    draw_rectangle(0, BASE_H - 8, BASE_W, BASE_H, false)

    // Main content plate on submenu screens.
    if room != rMainMenu {
        draw_set_alpha(0.62)
        draw_set_color(make_color_rgb(15, 19, 27))
        draw_rectangle(72, 260, 1000, 1030, false)
        draw_set_alpha(0.45)
        draw_set_color(make_color_rgb(95, 118, 155))
        draw_rectangle(72, 260, 76, 1030, false)
    } else {
        draw_set_alpha(0.55)
        draw_set_color(make_color_rgb(15, 19, 27))
        draw_rectangle(72, 620, 360, 1040, false)
    }

    draw_set_alpha(1)
}

// Title / subtitle / version.
if room != rGameRoom scribble_draw_text_ext(BASE_W / 2, BASE_H * 0.075, locale("game_title"), MENU_TITLE_SCALE)

if room == rSettings scribble_draw_text_ext(BASE_W / 2, BASE_H * 0.18, locale("settings"), MENU_SUBTITLE_SCALE)
else if room == rAudio scribble_draw_text_ext(BASE_W / 2, BASE_H * 0.18, locale("audio"), MENU_SUBTITLE_SCALE)
else if room == rVideo scribble_draw_text_ext(BASE_W / 2, BASE_H * 0.18, locale("video"), MENU_SUBTITLE_SCALE)
else if room == rGameplay scribble_draw_text_ext(BASE_W / 2, BASE_H * 0.18, locale("gameplay"), MENU_SUBTITLE_SCALE)
else if room == rControls scribble_draw_text_ext(BASE_W / 2, BASE_H * 0.18, locale("controls"), MENU_SUBTITLE_SCALE)

// Helpful section copy.
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(make_color_rgb(151, 162, 182))
if room == rVideo draw_text(112, 300, "DISPLAY\nChoose a 16:9 window size. Fullscreen uses your current display.")
if room == rAudio draw_text(112, 300, "AUDIO\nIndependent master, music, and sound-effect levels.")
if room == rSettings draw_text(112, 300, "SETTINGS\nConfigure presentation, audio, gameplay, and controls.")
if room == rGameplay draw_text(112, 300, "GAMEPLAY\nGame-facing preferences live here.")
if room == rControls draw_text(112, 300, "CONTROLS\nSelect an action to rebind it.")

draw_set_halign(fa_right)
draw_set_valign(fa_bottom)
draw_set_color(make_color_rgb(122, 132, 150))
draw_text(BASE_W - 36, BASE_H - 24, "TEMPLATE v0.0.7")
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_alpha(1)
