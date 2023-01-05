function c_input() {
	var i;
	var inputs = variable_struct_get_names(global.inputs);
	if typeof(self) == "struct" {
		for (i=0; i<array_length(inputs); i++) {
			variable_struct_set(self, inputs[i], global.inputs[$inputs[i]]);
		}
	} else {
		for (i=0; i<array_length(inputs); i++) {
			variable_instance_set(id, inputs[i], global.inputs[$inputs[i]]);
		}
	}
}

function c_inputupdate() {
	var inputs = variable_struct_get_names(global.inputs);
	for (i=0; i<array_length(inputs); i++) {
		global.inputs[$inputs[i]].update();
	}
}

function c_inputload() {
	nu kinput("left", [vk_left, vk_numpad4]);
	nu kinput("down", [vk_down, vk_numpad2, vk_numpad5]);
	nu kinput("up", [vk_up, vk_numpad8]);
	nu kinput("right", [vk_right, vk_numpad6]);
	
	nu kinput("select", [vk_enter]);
	nu kinput("back", [vk_escape]);
	nu kinput("shift", [vk_shift]);
	nu kinput("home", [vk_home, vk_numpad7]);
	nu kinput("zend", [vk_end, vk_numpad1]);
	nu kinput("pgup", [vk_pageup, vk_numpad9]);
	nu kinput("pgdown", [vk_pagedown, vk_numpad3]);
}

function kinput(name_, keys_) constructor {
	name = name_;
	key = keys_;
	hit = 0;
	hold = 0;
	drop = 0;
	
	update = function() {
		var i;
		hit = false;
		hold = false;
		drop = false;
		for (i=0; i<array_length(key); i++) {
			hit |= input_active(key[i], INPUT.PRESSED);
			hold |= input_active(key[i], INPUT.HELD);
			drop |= input_active(key[i], INPUT.RELEASED);
		}
	}
	global.inputs[$name] = self;
}

global.inputs = {};
c_inputload();