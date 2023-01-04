gc++;
c_inputupdate();
c_input();
cursor.x = clamp(cursor.x+right.hit-left.hit, leftprogress, rightprogress);
cursor.y = clamp(cursor.y+down.hit-up.hit, 0, array_length(pudes[cursor.x])-1);
thepix = pudes[cursor.x][cursor.y];

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

key = chr(keyboard_key);
guess += key;