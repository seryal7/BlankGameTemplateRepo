// Inherit the parent event
event_inherited()

// Set the menu text to that of this menu item
owner.buttonText = buttonText
owner.position = position

// Destroy this item and all others after selection is made
with (oResolutionItem) instance_destroy()

// Clear array list of items after selection is made
with (oResolutionList) {
	items = []
	controllerHovered = true
}

// Set global resolution position
global.resolution = position
global.videoDirty = true