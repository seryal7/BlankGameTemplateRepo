var _hovered = mouseHovered || controllerHovered
var _x1 = x - sprite_width * 0.5
var _y1 = y - sprite_height * 0.5
var _x2 = x + sprite_width * 0.5
var _y2 = y + sprite_height * 0.5

// Clean dark-glass button treatment. Sprite is retained only as the hitbox.
draw_set_alpha(_hovered ? 0.92 : 0.70)
draw_set_color(_hovered ? make_color_rgb(44, 53, 70) : make_color_rgb(24, 29, 39))
draw_rectangle(_x1, _y1, _x2, _y2, false)

draw_set_alpha(_hovered ? 1 : 0.75)
draw_set_color(_hovered ? make_color_rgb(128, 178, 255) : make_color_rgb(83, 98, 122))
draw_rectangle(_x1, _y1, _x1 + 5, _y2, false)

draw_set_alpha(1)
scribble_draw_text_ext(x, y, buttonText, MENU_BUTTON_SCALE, c_white, noone)
