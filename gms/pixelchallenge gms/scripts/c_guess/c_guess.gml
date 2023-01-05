function c_guess(guy, guess, cheats=false) {
	if cheats {
		switch guess {
			case "cheats":
				
				return;
		}
	}
	
	if guy.completed return;
	guess = string_lower(guess);
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