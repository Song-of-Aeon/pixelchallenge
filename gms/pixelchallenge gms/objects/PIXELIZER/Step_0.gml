gc++;
c_inputupdate();
c_input();
do {
	if pgup.hit {
		cursor.x -= 10;
		cursor.y = 0;
	}
	if pgdown.hit {
		cursor.x += 10;
		cursor.y = 2;
	}
	if home.hit {
		if cursor.x > global.dlccount+1 {
			cursor.x = global.dlccount+1;
		} else if cursor.x == global.dlccount+1 {
			cursor.x = global.dlccount-1;
		} else {
			cursor.x = 1;
		}
	}
	if zend.hit {
		if cursor.x < global.dlccount-1 {
			cursor.x = global.dlccount-1;
		} else if cursor.x == global.dlccount-1 {
			cursor.x = global.dlccount+1;
		} else {
			cursor.x = array_length(global.pixeldudes)-1;
			
		}
	}
	cursor.x = clamp(cursor.x+(right.hit-left.hit)*(shift.hold*4+1), global.dlccount+1+leftprogress, global.dlccount+rightprogress);
	cursor.y = clamp(cursor.y+(down.hit-up.hit)*(shift.hold*4+1), 0, array_length(pudes[cursor.x])-1);
	thepix = pudes[cursor.x][cursor.y];
} until !thepix.skip;



cursorvis.x = lerp(cursorvis.x, thepix.x+thepix.xoffset, .2);
cursorvis.y = lerp(cursorvis.y, thepix.y+thepix.yoffset, .2);

iterate global.pixeldudes to {
	double global.pixeldudes gamble {
		pudes[i][j].step();
	}
}
if thepix.completed || true {
	description = thepix.comment;
}
name = thepix.names[0];

guess = keyboard_string;

if select.hit {
	if c_guess(thepix, guess, false) {
		keyboard_string = "";
	}
}