var _hovered = mouseHovered || controllerHovered
var _x1 = x - sprite_width * 0.5
var _y1 = y - sprite_height * 0.5
var _x2 = x + sprite_width * 0.5
var _y2 = y + sprite_height * 0.5
var _accent = make_color_rgb(115, 166, 242)

// Compact submenu plate with the same visual language as primary buttons.
draw_set_alpha(0.30)
draw_set_color(c_black)
draw_rectangle(_x1 + 5, _y1 + 6, _x2 + 5, _y2 + 6, false)

draw_set_alpha(_hovered ? 0.96 : 0.90)
draw_rectangle_color(_x1, _y1, _x2, _y2,
    _hovered ? make_color_rgb(34, 43, 59) : make_color_rgb(20, 25, 35),
    make_color_rgb(12, 16, 23),
    make_color_rgb(12, 16, 23),
    _hovered ? make_color_rgb(34, 43, 59) : make_color_rgb(20, 25, 35), false)

draw_set_alpha(_hovered ? 0.92 : 0.46)
draw_set_color(_hovered ? _accent : make_color_rgb(85, 98, 120))
draw_rectangle(_x1, _y1, _x2, _y2, true)
draw_line(_x1 + 12, _y1 + 5, _x2 - 12, _y1 + 5)

draw_set_alpha(1)
scribble_draw_text_ext(x, y, buttonText, MENU_LIST_SCALE, c_white, noone)
