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
		if string_contains(guess, guy.names[i]) {
			global.pixelgets++;
			guy.completed = true;
			return true;
		}
	}
	return false;
}