event_inherited()

if instance_exists(oResolutionItem) {
    with (oResolutionItem) instance_destroy()
    items = []
} else {
    var _yIncrement = sprite_get_height(sButtonThin)
    var _yy = y + _yIncrement + 10
    for (var _i = 0; _i < array_length(resList); _i++) {
        item = instance_create_layer(x + 330, _yy, "Instances", oResolutionItem)
        item.buttonText = resList[_i]
        item.position = _i
        item.owner = id
        array_push(items, item.id)
        _yy += _yIncrement + 8
    }
}
