function c_updatedesc(type) {
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
				description = "the tutorial";
			} else {
				description = "";
			}
			break;
		case DESC.ECHOES:
			var echoes = [
			"",
			]
			description = echoes;
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