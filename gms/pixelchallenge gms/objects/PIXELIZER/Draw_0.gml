
var xdraw = 270;
var ydraw = 144+6-72;
var greatoffset = 548

if !surface_exists(pixelsurf) {
	pixelsurf = surface_create(9000, 48*4);
}
surface_set_target(pixelsurf);
draw_clear_alpha(make_color_hsv((gc/2)%255, 150, 200), 1);
draw_sprite(bk_everything, 0, 0, 1);
draw_sprite(bk_everything, 1, 3412, 1);
var thelad;
iterate global.pixeldudes to {
	double global.pixeldudes gamble {
		pudes[i][j].draw(24+greatoffset, 72);
	}
}
if (cursor.x < 3) || (cursor.x > array_length(pudes)-4) {
	if thepix.special {
		draw_sprite_ext(s_impossiblestar, 1, cursorvis.x+24+greatoffset, cursorvis.y+72, 3, 3, 0, c_white, 1);
	}
	if thepix.completed {
		draw_sprite_ext(s_completed, 1, cursorvis.x+24+greatoffset, cursorvis.y+72, 3, 3, 0, c_white, 1);
	}
}
draw_sprite_ext(s_cursor, (cursor.x < 3) | (cursor.x > array_length(pudes)-4), cursorvis.x+24+greatoffset, cursorvis.y+72, 3, 3, 0, c_white, alpher);

surface_reset_target();

draw_surface(pixelsurf, camerapos+xdraw+265-greatoffset, ydraw);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_rectangle(0, 0, 270, 350, false);
//draw_rectangle(90, 270, 100, 290, false);
draw_sprite_ext(s_asgore, 0, 0, 350, 1, abs(sin(gc/100)), 0, c_white, 1);
draw_rectangle(88, 274, 88+131, 274+30, false);

draw_rectangle(0, 0, 36, 350, false);

draw_sprite(s_uilines, 0, 0, 0);
draw_set_color(c_white);
draw_set_font(ft_philosopher);
var thesources = "";
if thepix.completed {
	thesources = thepix.source;
} else {
	thesources = "From: ";
	iterate thepix.hints to {
		thesources += thepix.hints[i] + "\n";
	}
}
draw_text(50, 5, thesources);
thepix.bigdraw();

//draw_rectangle(xdraw+cursorvis.x-16, ydraw+cursorvis.y-16, xdraw+cursorvis.x+16, ydraw+cursorvis.y+16, true);
switch borderdesc {
	case 1:
	case 3:
	case 5:
	case 7:
	case 9:
		draw_set_color(c_roulette);
		break;
	
	case 2:
	case 4:
	case 6:
	case 8:
	case 10:
		draw_set_color(c_roboticist);
		break;
}
draw_text(287, 285, description);
draw_set_color(c_white);
draw_set_font(ft_philosopher20);
draw_text(300, 25, thepix.completed ? thepix.names[0] : (cursor.x ? string(cursor.x-global.dlccount) : "") + (cursor.x > 2 && cursor.x <= 93+global.dlccount && cursor.x != 82+global.dlccount ? chr(cursor.y+65) : ""));
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

