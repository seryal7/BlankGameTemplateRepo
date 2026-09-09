// Inherit the parent event
event_inherited()

buttonText = locale("resolution")

// 16:9-only options keep the authored 1920x1080 layout from stretching.
resList = ["1280x720", "1600x900", "1920x1080", "2560x1440", "3840x2160"]
position = clamp(global.resolution, 0, array_length(resList) - 1)

controllerHovered = true
controllerHoveredBase = true
item = noone
items = []
