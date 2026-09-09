event_inherited()

var _state_x = x + sprite_width * 0.5 + 42
var _on = global.fullscreen
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_color(_on ? make_color_rgb(132, 203, 154) : make_color_rgb(180, 188, 202))
draw_text(_state_x, y, _on ? "ON  -  FULLSCREEN" : "OFF  -  WINDOWED")
draw_set_halign(fa_left)
draw_set_valign(fa_top)
