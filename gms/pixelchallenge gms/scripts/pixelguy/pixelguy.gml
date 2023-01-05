function pixelguy(names_=["named"], hints_=["hinted"], source_="sourced", comment_="commented", special_=false, skip_=false, step_=c_null, draw_=c_drawman, bigdraw_=c_drawmanbig, xoffset_=0, yoffset_=0) constructor {
	names = names_;
	hints = hints_;
	source = source_;
	comment = comment_;
	special = special_;
	if !skip_ {
		global.pixeltotal++;
	}
	skip = skip_;
	step = method(self, step_);
	draw = method(self, draw_);
	bigdraw = method(self, bigdraw_);
	completed = false;
	x = 0;
	y = 0;
	index = 0;
	xoffset = xoffset_;
	yoffset = yoffset_;
}

function c_drawman(xoffsetwo, yoffsetwo) {
	draw_sprite_ext(EVERYTHING, index, x+xoffset+xoffsetwo, y+xoffset+yoffsetwo, 3, 3, 0, c_white, 1);
	if completed && ! ((PIXELIZER.cursor.x < 3) || (PIXELIZER.cursor.x > array_length(pudes)-4)) {
		draw_sprite_ext(s_completed, 0, x+xoffset+xoffsetwo, y+xoffset+yoffsetwo, 3, 3, 0, c_white, 1);
	}
	if special == 1 {
		draw_sprite_ext(s_impossiblestar, 0, x+xoffset+xoffsetwo, y+xoffset+yoffsetwo, 3, 3, 0, c_white, 1);
	}
}
function c_drawmanbig() {
	draw_sprite_ext(EVERYTHING, index, 90+64, 105+64, 8, 8, 0, c_white, 1);
}

function constructor_fill() {
	
}

global.pixeldudes = [];