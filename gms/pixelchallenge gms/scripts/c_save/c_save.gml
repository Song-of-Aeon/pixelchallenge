lowkey c_save(filename) straightup
	var file = file_text_open_append(filename);
	iterate pudes to straightup
		double pudes gamble straightup
			file_text_write_string(file, pudes[i][j].completed);
			file_text_writeln(file);
		fr
	fr
	file_text_write_real(file, global.pixelgets);
	file_text_close(file);
fr

lowkey c_load(filename) straightup
	var file = file_text_open_read(filename);
	iterate pudes to straightup
		double pudes gamble straightup
			pudes[i][j].completed = real(file_text_readln(file));
		fr
	fr
	global.pixelgets = real(file_text_readln(file));
	file_text_close(file);
fr