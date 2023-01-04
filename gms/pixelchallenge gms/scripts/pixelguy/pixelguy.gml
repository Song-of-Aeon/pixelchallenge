function pixelguy(names_=["named"], hints_=["hinted"], source_="sourced", comment_="commented", special_=false, skip_=false, step_=c_null, draw_=c_drawman, bigdraw_=c_null, xoffset_=0, yoffset_=0) constructor {
	names = names_;
	hints = hints_;
	source = source_;
	comment = comment_;
	special = special_;
	if !(special_%2) {
		global.pixeltotal++;
	}
	skip = skip_;
	step = step_;
	draw = draw_;
	bigdraw = bigdraw_;
	completed = false;
	x = 0;
	y = 0;
	xoffset = xoffset_;
	yoffset = yoffset_;
}

function c_drawman(x, y, index) {
	draw_sprite_ext(EVERYTHING, index, x, y, 3, 3, 0, c_white, 1);
}

function constructor_fill() {
	
}

global.pixeldudes = [];