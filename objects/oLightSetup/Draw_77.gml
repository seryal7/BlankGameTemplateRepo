// draw the background then the application surface 
draw_clear_alpha(c_white, 1)

gpu_set_blendmode_ext(bm_one, bm_zero)
draw_surface_ext(application_surface,0,0,1,1,0,c_white,1)
gpu_set_blendmode(bm_normal)