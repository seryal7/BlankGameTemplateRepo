event_inherited()

if !instance_exists(oResolutionItem) {
    var _label = resList[clamp(position, 0, array_length(resList) - 1)]
    draw_set_halign(fa_left)
    draw_set_valign(fa_middle)
    draw_set_color(make_color_rgb(176, 190, 212))
    draw_text(x + sprite_width * 0.5 + 38, y, _label)
    draw_set_color(make_color_rgb(104, 118, 142))
    draw_text(x + sprite_width * 0.5 + 210, y, "CLICK TO CHOOSE")
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
}
