var _hovered = mouseHovered || controllerHovered
var _x1 = x - sprite_width * 0.5
var _y1 = y - sprite_height * 0.5
var _x2 = x + sprite_width * 0.5
var _y2 = y + sprite_height * 0.5

draw_set_alpha(_hovered ? 0.96 : 0.82)
draw_set_color(_hovered ? make_color_rgb(45, 55, 72) : make_color_rgb(20, 25, 34))
draw_rectangle(_x1, _y1, _x2, _y2, false)
draw_set_alpha(1)
scribble_draw_text_ext(x, y, buttonText, MENU_LIST_SCALE, c_white, noone)
