gc++;
c_inputupdate();
c_input();
var a = global.pixelgets;
unlockstage = 1+(a>=5)+(a>=10)+(a>=20)+(a>=30)+(a>=40)+(a>=50)+(a>=65)+(a>=80)+(a>=100);
rightprogress = unlockstage*10;
leftprogress = -(a>150)*global.dlccount;

//rightprogress = 100;
//leftprogress = -global.dlccount-1;

do {
	if pgup.hit {
		cursor.x -= 10;
		cursor.y = 0;
		c_updatedesc(DESC.PIXEL);
	}
	if pgdown.hit {
		cursor.x += 10;
		cursor.y = 2;
		c_updatedesc(DESC.PIXEL);
	}
	if home.hit {
		if cursor.x > global.dlccount+1 {
			cursor.x = global.dlccount+1;
		} else if cursor.x == global.dlccount+1 {
			cursor.x = global.dlccount-1;
		} else {
			cursor.x = 1;
		}
		c_updatedesc(DESC.PIXEL);
	}
	if zend.hit {
		if cursor.x < global.dlccount-1 {
			cursor.x = global.dlccount-1;
		} else if cursor.x == global.dlccount-1 {
			cursor.x = global.dlccount+1;
		} else {
			cursor.x = array_length(global.pixeldudes)-1;
		}
		c_updatedesc(DESC.PIXEL);
	}
	cursor.x += (right.hit-left.hit)*(shift.hold*4+1);
	cursor.y += (down.hit-up.hit)*(shift.hold*4+1);
	
	if cursor.x < max(global.dlccount+leftprogress, 0) {
		cursor.x = max(global.dlccount+leftprogress, 0);
		c_updatedesc(DESC.ESCAPE);
	}
	if cursor.x > min(global.dlccount+rightprogress, array_length(pudes)-1) {
		cursor.x = min(global.dlccount+rightprogress, array_length(pudes)-1);
		c_updatedesc(DESC.ECHOES);
	}
	
	if cursor.y < 0 {
		cursor.y = 0;
		c_updatedesc(DESC.AS_ABOVE);
	}
	if cursor.y > array_length(pudes[cursor.x])-1 {
		cursor.y = array_length(pudes[cursor.x])-1;
		c_updatedesc(DESC.SO_BELOW);
	}
	thepix = pudes[cursor.x][cursor.y];
	if thepix.skip && cursor.y cursor.y--;
	thepix = pudes[cursor.x][cursor.y];
} until !thepix.skip;
if (right.hit || left.hit || down.hit || up.hit) && !diddesc {
	keyboard_string = "";
	c_updatedesc(DESC.PIXEL);
}
diddesc = false;


cursorvis.x = lerp(cursorvis.x, thepix.x+thepix.xoffset, .1);
cursorvis.y = lerp(cursorvis.y, thepix.y+thepix.yoffset, .1);

/*iterate global.pixeldudes to {
	double global.pixeldudes gamble {
		pudes[i][j].step();
	}
}*/
thepix.step();

alpher = lerp(alpher, (thepix.names[0] != "Lain Iwakura")/*-abs(cursorvis.x-(thepix.x+thepix.xoffset))/48*/, .1);

if cursor.x > global.dlccount {
	if cursor.x <= 93+global.dlccount {
		//camerapos = lerp(camerapos, clamp(-thepix.xoffset-thepix.x-24, -5300, -pudes[26][0].x-23), .2);
		camerapos = lerp(camerapos, clamp(-thepix.xoffset-thepix.x-24, max(-5300, -pudes[global.dlccount+rightprogress][0].x+218), -pudes[26][0].x-23), .2);
	} else {
		camerapos = lerp(camerapos, clamp(-thepix.xoffset-thepix.x-24, -6011, -pudes[26][0].x-24), .2);
	}
} else {
	if cursor.x >= 3 {
		camerapos = lerp(camerapos, clamp(-thepix.xoffset-thepix.x-24, -pudes[15][0].x-24, -358), .2);
	} else if cursor.x {
		camerapos = lerp(camerapos, clamp(-thepix.xoffset-thepix.x-24, -pudes[15][0].x-24, 94), .2);
	} else {
		camerapos = lerp(camerapos, clamp(-thepix.xoffset-thepix.x-24, -pudes[15][0].x-24, 300), .2);
	}
}
log(camerapos);
log(thepix.x);



/*if thepix.completed || true {
	description = thepix.comment;
}*/

guess = keyboard_string;

if select.hit {
	if c_guess(thepix, guess, true) {
		keyboard_string = "";
	}
}