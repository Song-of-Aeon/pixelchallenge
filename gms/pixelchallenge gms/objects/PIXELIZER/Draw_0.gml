
var xdraw = 256+32+9+48;
var ydraw = 144+6;

iterate global.pixeldudes to {
	double global.pixeldudes gamble {
		pudes[i][j].draw(xdraw+i*48, ydraw+j*48, i+j*165);
	}
}



draw_set_valign(fa_top);
draw_set_color(c_black);
draw_rectangle(88, 274, 88+131, 274+30, false);
draw_rectangle(0, 0, 270, 350, false);
draw_rectangle(0, 0, 36, 350, false);
draw_sprite_ext(s_asgore, 0, 0, 350, 1, abs(sin(gc/100)), 0, c_white, 1);
draw_sprite(s_uilines, 0, 0, 0);
draw_set_color(c_white);
//draw_rectangle(xdraw+cursorvis.x-16, ydraw+cursorvis.y-16, xdraw+cursorvis.x+16, ydraw+cursorvis.y+16, true);
draw_sprite_ext(s_cursor, 0, xdraw+cursorvis.x, ydraw+cursorvis.y, 3, 3, 0, c_white, 1);
draw_set_font(ft_philosopher);
if thepix.completed draw_text(287, 300, description);
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
draw_text(50, 20, thesources);

draw_set_font(ft_philosopher20);
draw_text(300, 45, thepix.completed ? name : string(cursor.x-global.dlccount) + chr(cursor.y+65));
draw_set_halign(fa_right);
draw_text(765, 45, string(global.pixelgets)+"/"+string(global.pixeltotal));
draw_set_halign(fa_left);
draw_text(92, 295, string_copy(guess, string_length(guess)-16, 16));

