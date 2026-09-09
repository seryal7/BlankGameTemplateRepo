var _track_h = 12
var _yy = y - _track_h * 0.5
var _thumb_x = x + sprite_width * value
var _accent = make_color_rgb(115, 166, 242)

// Outer trough.
draw_set_alpha(0.82)
draw_set_color(make_color_rgb(9, 12, 18))
draw_rectangle(x - 3, _yy - 3, x + sprite_width + 3, _yy + _track_h + 3, false)
draw_set_alpha(0.72)
draw_set_color(make_color_rgb(72, 84, 105))
draw_rectangle(x - 3, _yy - 3, x + sprite_width + 3, _yy + _track_h + 3, true)

// Track and fill.
draw_set_alpha(0.90)
draw_set_color(make_color_rgb(26, 32, 44))
draw_rectangle(x, _yy, x + sprite_width, _yy + _track_h, false)
draw_set_color(_accent)
draw_rectangle(x, _yy, _thumb_x, _yy + _track_h, false)

// Tick marks make values easier to read.
draw_set_alpha(0.28)
draw_set_color(c_white)
for (var _i = 1; _i < 10; _i++) {
    var _tx = x + sprite_width * (_i / 10)
    draw_line(_tx, _yy + 2, _tx, _yy + _track_h - 2)
}

// Diamond-style thumb.
draw_set_alpha(1)
draw_set_color(make_color_rgb(232, 238, 247))
draw_triangle(_thumb_x, y - 12, _thumb_x + 12, y, _thumb_x, y + 12, false)
draw_triangle(_thumb_x, y - 12, _thumb_x - 12, y, _thumb_x, y + 12, false)
draw_set_color(_accent)
draw_circle(_thumb_x, y, 4, false)
