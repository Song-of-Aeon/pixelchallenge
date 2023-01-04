gc++;
c_inputupdate();
c_input();
cursor.x = clamp(cursor.x+right.hit-left.hit, leftprogress, rightprogress);
cursor.y = clamp(cursor.y+down.hit-up.hit, 0, array_length(pudes[cursor.x]));
log(cursor);

cursorvis.x = lerp(pudes[cursor.x][cursor.y].x, pudes[cursor.x][cursor.y].x, .1)

iterate global.pixeldudes to {
	double global.pixeldudes gamble {
		pudes[i][j].step();
	}
}