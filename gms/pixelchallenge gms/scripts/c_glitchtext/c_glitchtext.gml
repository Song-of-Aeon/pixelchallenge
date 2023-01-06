function c_glitchtext(str) {
	var stringly = "";
	for (var i=1; i<=string_length(str); i++) {
		if !random(1) {
			stringly += " ";
		}
		stringly += string_copy(str, i, 1);
		
	}
	return stringly;
}