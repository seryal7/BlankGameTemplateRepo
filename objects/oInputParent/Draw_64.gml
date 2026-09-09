event_inherited()

var _binding = input_binding_get(action, 0, 0)
var _icon = input_binding_get_icon(_binding)

if !is_string(_icon) {
    draw_sprite(_icon, 0, x + sprite_width * 0.5 + sprite_get_width(_icon) * 0.45, y - sprite_get_height(_icon) * 0.5)
}

if input_binding_scan_in_progress() {
    var _cx = BASE_W * 0.5
    var _cy = BASE_H * 0.5
    var _w = 700
    var _h = 300
    var _x1 = _cx - _w * 0.5
    var _y1 = _cy - _h * 0.5
    var _x2 = _cx + _w * 0.5
    var _y2 = _cy + _h * 0.5

    draw_set_alpha(0.72)
    draw_set_color(c_black)
    draw_rectangle(0, 0, BASE_W, BASE_H, false)

    draw_set_alpha(0.96)
    draw_rectangle_color(_x1, _y1, _x2, _y2,
        make_color_rgb(25, 32, 45), make_color_rgb(12, 16, 24),
        make_color_rgb(12, 16, 24), make_color_rgb(25, 32, 45), false)

    draw_set_alpha(0.82)
    draw_set_color(make_color_rgb(115, 166, 242))
    draw_rectangle(_x1, _y1, _x2, _y2, true)
    draw_rectangle(_x1 + 7, _y1 + 7, _x2 - 7, _y2 - 7, true)

    draw_set_alpha(1)
    scribble_draw_text_ext(_cx, _cy - 44, locale("new_input"), MENU_LIST_SCALE)
    scribble_draw_text_ext(_cx, _cy + 48, string(ceil(input_binding_scan_time_remaining() / 1000)), MENU_SMALL_SCALE)
}
