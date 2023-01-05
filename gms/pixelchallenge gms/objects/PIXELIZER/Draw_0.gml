
var xdraw = 270;
var ydraw = 144+6-72;

if !surface_exists(pixelsurf) {
	pixelsurf = surface_create(9000, 48*4);
}
surface_set_target(pixelsurf);
draw_clear_alpha(make_color_hsv((gc/2)%255, 150, 200), 1);
draw_sprite(bk_everything, 0, -548, 1);
var thelad;
iterate global.pixeldudes to {
	double global.pixeldudes gamble {
		pudes[i][j].draw(24, 72);
	}
}
draw_sprite_ext(s_cursor, 0, cursorvis.x+24, cursorvis.y+72, 3, 3, 0, c_white, 1);
surface_reset_target();
draw_surface(pixelsurf, xdraw-cursorvis.x+265, ydraw);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_rectangle(0, 0, 270, 350, false);
//draw_rectangle(90, 270, 100, 290, false);
draw_sprite_ext(s_asgore, 0, 0, 350, 1, abs(sin(gc/100)), 0, c_white, 1);
thepix.bigdraw();
draw_rectangle(88, 274, 88+131, 274+30, false);

draw_rectangle(0, 0, 36, 350, false);

draw_sprite(s_uilines, 0, 0, 0);
draw_set_color(c_white);
//draw_rectangle(xdraw+cursorvis.x-16, ydraw+cursorvis.y-16, xdraw+cursorvis.x+16, ydraw+cursorvis.y+16, true);
draw_set_font(ft_philosopher);
if thepix.completed draw_text(287, 285, description);
var thesources = "";
if thepix.completed {
	iterate thepix.source to {
		thesources += thepix.source[i] + "\n";
	}
} else {
	iterate thepix.hints to {
		thesources += thepix.hints[i] + "\n";
	}
}
draw_text(50, 5, thesources);

draw_set_font(ft_philosopher20);
draw_text(300, 25, thepix.completed ? name : string(cursor.x-global.dlccount) + chr(cursor.y+65));
draw_set_halign(fa_right);
draw_text(765, 25, string(global.pixelgets)+"/"+string(global.pixeltotal));
draw_set_halign(fa_left);
var thestring = guess;
if thestring != "" && gc%60 < 30 {
	thestring += "|";
} else thestring += " ";
while string_width(thestring) > 121 {
	thestring = string_delete(thestring, 1, 1);
}

draw_text(92, 276, thestring);

