// Creates Quad with two triangles. Used to make the shadows. 
// Z coordinate is used as a flag to determine if the vertex will be repositioned in the shader
function Quad(_vb,_x1,_y1,_x2,_y2){
	// Upper triangle
	vertex_position_3d(_vb,_x1,_y1,0)
	vertex_position_3d(_vb,_x1,_y1,2) // repositioned vertex
	vertex_position_3d(_vb,_x2,_y2,1)
	
	// Lower Triangle
	vertex_position_3d(_vb,_x1,_y1,2) // repositioned vertex
	vertex_position_3d(_vb,_x2,_y2,1)
	vertex_position_3d(_vb,_x2,_y2,3) // repositioned vertex
}


// Construct the vertex buffer with every wall
// Instead of using the four edges as the walls, we use the diagonals instead (Optimization)

vertex_begin(vb, vf)
var _vb = vb
var _tag = tag_get_asset_ids("solid", asset_object)
var _isize = array_length(_tag)

for (var _i = 0; _i < _isize; _i++) {
    var _object = _tag[_i]
    with (_object) {
        Quad(_vb, x, y, x + sprite_width, y + sprite_height)
        Quad(_vb, x + sprite_width, y, x, y + sprite_height)
    }
}
vertex_end(vb)

/*vertex_begin(vb,vf)
var _vb = vb
var _tag = tag_get_asset_ids("solid", asset_object)
var _i = 0
var _isize = array_length(_tag)
repeat(_isize) {
	var _object = _tag[_i]
	_i++
	with(_object) {
		Quad(_vb,x,y,x+sprite_width,y+sprite_height)
		Quad(_vb,x+sprite_width,y,x,y+sprite_height)
	}
}
vertex_end(vb)*/

