function c_updatedesc(type) {
	borderdesc = 0;
	diddesc = true;
	log(type);
	switch type {
		case DESC.PIXEL:
			if thepix.completed {
				description = thepix.comment;
			} else {
				description = "";
			}
			break;
		case DESC.ESCAPE:
			if cursor.x > global.dlccount {
				description = "Type \"save\" at any time to save, and \"load\" at any time to load.\nGet a certain amount of them correct, and unlock the next ten!\nPixels with stars are actually almost impossible, so don't worry about them much.";
			} else {
				description = "The plaque ends there.\nThere's an open box of nails and paint just below.";
			}
			break;
		case DESC.ECHOES:
			var echoes = [
				"I just can't help myself.\nForgive me, will you?",
				
				"\"What is this place?\n Some sort of gallery?\"", //11
				"\"Not sure if you can call it a gallery if it's just a single display floating in space.\nLet's see... \"The Impossible Pixel Challenge\".\"", //22
				"\"I don't really see where the challenge is, but it sure does have pixels.\nCan't recognize any of these characters, though.\"", //13
				"\"Neither do-\nOh wait, I know this one.\"", //24
				"\"Really? Are they from home?\"", //15
				"\"I think so. It might have been the one a few places back, though.\nHah, but the specifics don't matter.\nThis means...\"", //26
				"\"There's another person who can move like we can.\nWell, they can't be that bad if they're doing something like this.\nBut should we, like, do anything about it...?\"", //17
				"\"I don't think we can.\nThey're not here, and it looks like they only left this pixel thing behind.\"", //28
				"\"This has got to be the shortest adventure yet.\nNothing to do but look and leave.\nAnd I guess we just finished the first part.\"", //19
				"\"Oh, wait, let me take a picture first.\nMaybe we can guess the characters later?\"", //210
			]
			borderdesc = unlockstage;
			description = echoes[unlockstage];
			break;
		case DESC.AS_ABOVE:
			
			break;
		case DESC.SO_BELOW:
			
			break;
		case DESC.SAVE:
			
			break;
		case DESC.LOAD:
			
			break;
	}
}

enum DESC {
	PIXEL,
	ESCAPE,
	ECHOES,
	AS_ABOVE,
	SO_BELOW,
	SAVE,
	LOAD,
}