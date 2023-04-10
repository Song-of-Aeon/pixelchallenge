function c_shadowdrawing() {
	var xdraw = 270;
	var ydraw = 144+6-72;
	var greatoffset = 548;
	var flipSurf = surface_create(room_width*1.5,room_height);
	var flopSurf = surface_create(room_width*1.5,room_height);
	var blurRadius = 1;
	var color = 0;

	var uniRez = shader_get_uniform(z_gauss13,"resolution")
	var uniDir = shader_get_uniform(z_gauss13,"direction")


	surface_set_target(flopSurf);
	draw_clear_alpha(c_black,0);
	//var spinfo = sprite_get_info(sprite)
	//var xscale = width/sprite_get_width(sprite);
	//var yscale = height/sprite_get_height(sprite);
	iterate global.pixeldudes to {
		double global.pixeldudes gamble {
			with pudes[i][j] {
				if x+xoffset+greatoffset+24 > -PIXELIZER.camerapos && x+xoffset+greatoffset+24 < -PIXELIZER.camerapos+1000 {
					//draw(24+greatoffset+PIXELIZER.camerapos, 72);
					draw(24+greatoffset+PIXELIZER.camerapos, 72);
				}
			}
		}
	}
	//draw_sprite_tiled(s_susie, 0, 2, 2);
	surface_reset_target();

	shader_set(z_gauss13)
	gpu_set_blendmode(bm_add);
	gpu_set_blendmode_ext(bm_one,bm_src_alpha_sat)
	var iterations = 10;
	//gpu_set_blendmode_ext_sepalpha(bm_src_alpha,bm_dest_alpha,bm_src_alpha,bm_dest_alpha)
	for(var i = 0; i < iterations; i++){
		surface_set_target(i%2 ? flopSurf : flipSurf);
		draw_clear_alpha(c_black,0);
	
		var len = blurRadius;
		var d = distabs((360/iterations)*i,len)
	
		shader_set_uniform_f(uniRez,room_width,room_height);
		shader_set_uniform_f(uniDir,d.x,d.y);

		draw_surface(i%2 ? flipSurf : flopSurf,0,0);

		surface_reset_target()
	}
	gpu_set_blendmode(bm_normal)

	//gpu_set_blendmode(bm_normal)
	shader_reset()

	shader_set(z_colorify);
	shader_set_uniform_f(shader_get_uniform(z_colorify,"color"),color_get_red(color),color_get_green(color),color_get_blue(color));
	//draw_surface_stretched(flopSurf,x-margin,y-margin,width+margin*2,height+margin*2);
	log(surface_get_target());
	draw_surface(flopSurf, -camerapos, 0);
	//draw_sprite(s_completed, 0, );
	shader_reset();
	surface_free(flipSurf);
	surface_free(flopSurf);
}