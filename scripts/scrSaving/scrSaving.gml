function saveGame() {
	
	var _struct =
	{
		profile: global.profile,
		locale: global.languageIndex,
		masterVol: global.masterVolume,
		musicVol: global.musicVolume,
		soundVol: global.sfxVolume,
		resolution: global.resolution,
		fullscreen: global.fullscreen,
		difficulty: global.difficulty,
		controls: input_player_export(),
	}
	
	var _string = json_stringify(_struct)
	if (os_type == os_windows) {
		var _localAppdata = environment_get_variable("localappdata")
		global.saveDir = _localAppdata + "/BlankGame/"
	}
	var _path = global.saveDir+"BlankGame"+string(global.profile)+".sav"
	var _file = file_text_open_write(_path)
	file_text_write_string(_file, _string)
	file_text_close(_file)
	
	// Show saving
	if (!instance_exists(oSaving)) instance_create_layer(room_width - (sprite_get_width(sSaving) * 1.5), sprite_get_height(sSaving), "GUI", oSaving)
}

function loadGame() {
	if (os_type == os_windows) {
		var _localAppdata = environment_get_variable("localappdata")
		global.saveDir = _localAppdata + "/BlankGame/"
	}
	var _path = global.saveDir+"BlankGame"+string(global.profile)+".sav"
	if file_exists(_path) {
		var _file = file_text_open_read(_path)
		var _json = file_text_read_string(_file)
		var _struct = json_parse(_json)

		global.profile = _struct.profile
		global.languageIndex = _struct.locale
		global.masterVolume = _struct.masterVol
		global.musicVolume = _struct.musicVol
		global.sfxVolume = _struct.soundVol
		global.resolution = clamp(_struct.resolution, 0, 4)
		global.fullscreen = _struct.fullscreen
		global.difficulty = _struct.difficulty
		input_player_import(_struct.controls)
		
		file_text_close(_file)
		
		// Update language and display settings after load
		loadLang(global.languageIndex)
		updateVideo()
	}
}