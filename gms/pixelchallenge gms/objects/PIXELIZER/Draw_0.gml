
var xdraw = 256;
var ydraw = 144;

iterate global.pixeldudes to {
	double global.pixeldudes gamble {
		pudes[i][j].draw(xdraw+i*32, ydraw+j*32, i+j*165);
	}
}
draw_set_color(c_white);
draw_rectangle(xdraw+cursor.x*32-16, ydraw+cursor.y*32-16, xdraw+cursor.x*32+16, ydraw+cursor.y*32+16, true);


draw_sprite_ext(s_asgore, 0, 0, 350, 1, abs(sin(gc/100)), 0, c_white, 1);
draw_sprite(s_uilines, 0, 0, 0);