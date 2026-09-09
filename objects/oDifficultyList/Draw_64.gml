event_inherited()

if !instance_exists(oDifficultyItem) {
    var _label = diffList[clamp(global.difficulty, 0, array_length(diffList) - 1)]
    draw_set_halign(fa_left)
    draw_set_valign(fa_middle)
    draw_set_color(make_color_rgb(188, 200, 220))
    draw_text(x + sprite_width * 0.5 + 38, y, string_upper(_label))
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
}
