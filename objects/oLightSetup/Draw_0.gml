// Local variables setup
var _u_pos = u_pos
var _u_zz = u_zz
var _u_str = u_str
var _u_dir = u_dir
var _u_fov = u_fov
var _u_pos2 = u_pos2
var _vb = vb
var _vx = vx
var _vy = vy
var _u_nmap = u_nmap


// Shadow surface setup
if (!surface_exists(shad_surf)){
	shad_surf = surface_create(global.width, global.height)
}

matrix_set(matrix_world,matrix_build(-vx,-vy,0,0,0,0,1,1,1))

surface_set_target(shad_surf)
draw_clear_alpha(c_dkgray, 0)
draw_surface_ext(application_surface, _vx, _vy, 1, 1, 0, c_white, 0.2)

with(oLight){
	
	// Draw the shadows (AKA light blockers)
	gpu_set_blendmode_ext_sepalpha(bm_zero,bm_one,bm_one,bm_one)
	shader_set(shd_shadow)
	shader_set_uniform_f(_u_pos2,x,y)
	vertex_submit(_vb,pr_trianglelist,-1)
	
	// Draw the Light
	gpu_set_blendmode_ext_sepalpha(bm_inv_dest_alpha,bm_one,bm_zero,bm_zero)
	shader_set(shd_light)
	shader_set_uniform_f(_u_pos, x, y)
	shader_set_uniform_f(_u_zz, size)
	shader_set_uniform_f(_u_str, str)
	shader_set_uniform_f(_u_fov, fov)
	shader_set_uniform_f(_u_dir, dir)
	// texture_set_stage(_u_nmap,surface_get_texture(global.n_surf))
	draw_surface_ext(application_surface, _vx, _vy, 1, 1, 0,color, 1)

}

shader_reset()
gpu_set_blendmode_ext(bm_zero, bm_src_alpha)
draw_surface(application_surface, vx, vy)
surface_reset_target()
matrix_set(matrix_world,matrix_build(0,0,0,0,0,0,1,1,1))

// Draw and blend the shadow surface to the application surface
gpu_set_blendmode_ext(bm_dest_color, bm_inv_dest_alpha)
//gpu_set_blendmode_ext(bm_inv_src_alpha, bm_src_color)
draw_surface(shad_surf,vx,vy)

// reset shader and blendmode 
gpu_set_blendmode(bm_normal)