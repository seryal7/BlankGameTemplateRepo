// Inherit the parent event
event_inherited()

// Display this text on the button
buttonText = locale("difficulty")

// Create list of available difficulties in strings
diffList = [locale("easy"), locale("normal"), locale("hard")]

// Default Selection
position = clamp(global.difficulty, 0, array_length(diffList) - 1)

// Default selection for controller navigation
controllerHovered = true
controllerHoveredBase = true

// Init item to create 
item = 0

// Init item array
items = []