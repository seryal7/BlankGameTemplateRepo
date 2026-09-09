var _originX = x - sprite_width * 0.5
var _originY = y - sprite_height * 0.5

#region Mouse Controls
if global.input == KBM {
    mouseHovered = mouse_x > _originX
        && mouse_x < _originX + sprite_width
        && mouse_y > _originY
        && mouse_y < _originY + sprite_height

    if mouseHovered {
        image_alpha = 1
        if !runOnce playSound(sndMenuHover)
        runOnce = true
    } else {
        image_alpha = MENU_BUTTON_ALPHA
        runOnce = false
    }

    if mouseHovered && input_check_pressed("leftclick") {
        ui_press = 1
        alarm[0] = 6
        playSound(sndMenuClick)
    }
}
#endregion

#region Controller Support
if global.input == CONTROLLER {
    if controllerHovered {
        image_alpha = 1
        if !runOnce playSound(sndMenuHover)
        runOnce = true
    } else {
        image_alpha = MENU_BUTTON_ALPHA
        runOnce = false
    }

    if controllerHovered && input_check_pressed("accept") {
        ui_press = 1
        alarm[0] = 6
        playSound(sndMenuClick)
    }
}
#endregion

var _selected = mouseHovered || controllerHovered
ui_hover = lerp(ui_hover, _selected ? 1 : 0, 0.18)
ui_press = lerp(ui_press, 0, 0.25)
if ui_intro_delay > 0 {
    ui_intro_delay -= 1
} else {
    ui_intro = lerp(ui_intro, 1, 0.18)
}
