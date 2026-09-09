var _track_h = 8
var _yy = y - _track_h * 0.5

// Track
draw_set_alpha(0.72)
draw_set_color(make_color_rgb(13, 17, 24))
draw_rectangle(x, _yy, x + sprite_width, _yy + _track_h, false)

// Fill
draw_set_alpha(1)
draw_set_color(make_color_rgb(111, 160, 235))
draw_rectangle(x, _yy, x + sprite_width * value, _yy + _track_h, false)

// Thumb
var _thumb_x = x + sprite_width * value
draw_set_color(make_color_rgb(232, 238, 247))
draw_circle(_thumb_x, y, 9, false)
draw_set_color(make_color_rgb(111, 160, 235))
draw_circle(_thumb_x, y, 5, false)

draw_set_alpha(1)
