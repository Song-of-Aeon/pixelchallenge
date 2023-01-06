function c_guess(guy, guess, cheats=false) {
	guess = string_lower(guess);
	if cheats {
		switch guess {
			case "cheats":
				global.pixelgets = 666;
				return true;
		}
	}
	if guess == "save" {
		c_save("pixelsave.256");
		return true;
	}
	if guess == "load" {
		c_load("pixelsave.256");
		return true;
	}
	if guess == "reset" {
		iterate pudes to {
			double pudes gamble {
				pudes[i][j].completed = false;
			}
		}
		global.pixelgets = 0;
	}
	
	if guy.completed exit;
	iterate guy.names to {
		if string_contains(guess, string_lower(guy.names[i])) {
			global.pixelgets++;
			guy.completed = true;
			c_achievementcheck();
			c_updatedesc(DESC.PIXEL);
			return true;
		}
	}
	return false;
}