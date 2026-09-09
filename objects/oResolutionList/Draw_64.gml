// Inherit themed button rendering.
event_inherited()

if !instance_exists(oResolutionItem) {
    var _label = resList[clamp(position, 0, array_length(resList) - 1)]
    draw_set_alpha(0.95)
    draw_set_color(make_color_rgb(214, 220, 232))
    draw_set_halign(fa_left)
    draw_set_valign(fa_middle)
    draw_text(x + sprite_width * 0.5 + 40, y, _label)
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    draw_set_alpha(1)
}
