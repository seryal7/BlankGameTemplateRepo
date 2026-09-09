// Shared menu-button state.
buttonText = ""
runOnce = false
mouseHovered = false
controllerHovered = false
controllerHoveredBase = controllerHovered

// Presentation state is deliberately independent of x/y so hover animation
// never moves the hitbox away from the cursor.
ui_hover = 0
ui_press = 0
ui_intro = 0
ui_intro_delay = clamp(y / 140, 0, 8)
ui_phase = random(1000)
