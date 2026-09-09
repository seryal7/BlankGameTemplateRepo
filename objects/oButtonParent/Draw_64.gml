var _hovered = mouseHovered || controllerHovered
var _intro_y = (1 - ui_intro) * 18
var _press_y = ui_press * 3
var _draw_y = y + _intro_y + _press_y
var _grow = ui_hover * 6

var _x1 = x - sprite_width * 0.5 - _grow
var _y1 = _draw_y - sprite_height * 0.5
var _x2 = x + sprite_width * 0.5 + _grow
var _y2 = _draw_y + sprite_height * 0.5

var _ink = make_color_rgb(13, 16, 24)
var _ink_hi = make_color_rgb(26, 33, 46)
var _steel = make_color_rgb(82, 96, 119)
var _silver = make_color_rgb(167, 182, 207)
var _accent = make_color_rgb(115, 166, 242)

// Soft shadow.
draw_set_alpha(0.30 * ui_intro)
draw_set_color(c_black)
draw_rectangle(_x1 + 8, _y1 + 10, _x2 + 8, _y2 + 10, false)

// Layered plate.
draw_set_alpha((0.84 + ui_hover * 0.10) * ui_intro)
draw_rectangle_color(_x1, _y1, _x2, _y2, _ink_hi, _ink, _ink, _ink_hi, false)

draw_set_alpha((0.44 + ui_hover * 0.35) * ui_intro)
draw_set_color(_hovered ? _accent : _steel)
draw_rectangle(_x1, _y1, _x2, _y2, true)
draw_rectangle(_x1 + 4, _y1 + 4, _x2 - 4, _y2 - 4, true)

// Ornate corner cuts and selection spine.
var _c = 15
draw_set_alpha((0.68 + ui_hover * 0.30) * ui_intro)
draw_set_color(_hovered ? _accent : _silver)
draw_line(_x1, _y1 + _c, _x1 + _c, _y1)
draw_line(_x2 - _c, _y1, _x2, _y1 + _c)
draw_line(_x1, _y2 - _c, _x1 + _c, _y2)
draw_line(_x2 - _c, _y2, _x2, _y2 - _c)

draw_set_alpha((0.30 + ui_hover * 0.70) * ui_intro)
draw_set_color(_accent)
draw_rectangle(_x1 + 8, _y1 + 10, _x1 + 12, _y2 - 10, false)

// A restrained animated glint only appears while selected.
if ui_hover > 0.01 {
    var _travel = frac(current_time * 0.00028 + ui_phase * 0.001)
    var _gx = lerp(_x1 + 22, _x2 - 22, _travel)
    draw_set_alpha(0.20 * ui_hover * ui_intro)
    draw_set_color(c_white)
    draw_line(_gx, _y1 + 8, _gx + 24, _y2 - 8)
}

draw_set_alpha(ui_intro)
var _text_color = merge_color(make_color_rgb(220, 226, 236), c_white, ui_hover * 0.75)
scribble_draw_text_ext(x + ui_hover * 5, _draw_y, buttonText, MENU_BUTTON_SCALE, _text_color, noone)

draw_set_alpha(1)
