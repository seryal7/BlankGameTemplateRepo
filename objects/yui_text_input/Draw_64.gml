/// @description draw alpha + highlight

// Inherit the parent event
event_inherited()

var show_highlight = (highlight || focused)
	&& highlight_color != undefined
	&& enabled;
	
if show_highlight {
	if highlight_alpha > 0 {
		if viewport_size {
			if viewport_part.visible {
				draw_sprite_ext(
					yui_white_pixel, 0,
					viewport_part.x, viewport_part.y, viewport_part.w, viewport_part.h,
					0, highlight_color, highlight_alpha);
			}
		}
		else {
			draw_sprite_ext(
				yui_white_pixel, 0,
				draw_size.x, draw_size.y, draw_size.w, draw_size.h,
				0, highlight_color, highlight_alpha);
		}
	}
}

if focused && (current_time div 500 mod 2) == 1 {
	
	if isPointVisible(caret_x, caret_y) {
		draw_sprite_ext(
			yui_white_pixel, 0,
			caret_x, caret_y, 1, caret_h,
			0, caret_color, 1);
	}
}






