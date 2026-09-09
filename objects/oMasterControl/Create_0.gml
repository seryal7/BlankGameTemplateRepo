#region Music Control
randomize()
playlist = [sndMazeDensityTime, sndAdhesiveWombatNightShade, sndKubbiDigestiveBiscuit]
randSong = irandom_range(0, array_length(playlist) - 1)
musicInstance = noone
#endregion

#region Presentation
ui_time = 0
ui_room_enter = 0
ui_last_room = room
debugEnabled = false
debugRoom = ""
debugWindow = ""
debugSurface = ""
debugFPS = 0
debugInput = "KBM"

if !variable_global_exists("appliedResolution") global.appliedResolution = global.resolution
if !variable_global_exists("appliedFullscreen") global.appliedFullscreen = global.fullscreen
if !variable_global_exists("videoDirty") global.videoDirty = false
#endregion

#region Debug Control
show_debug_overlay(false)

applyVideoDebug = function() {
    updateVideo()
    saveGame()
}

toggleFullscreenDebug = function() {
    global.fullscreen = !global.fullscreen
    global.videoDirty = true
}

resetAudioDebug = function() {
    global.masterVolume = MASTER_VOL
    global.musicVolume = MUSIC_VOL
    global.sfxVolume = SOUND_VOL
}

resetTemplateSettingsDebug = function() {
    global.masterVolume = MASTER_VOL
    global.musicVolume = MUSIC_VOL
    global.sfxVolume = SOUND_VOL
    global.fullscreen = FULLSCREEN
    global.resolution = 2
    global.difficulty = DIFFICULTY_EASY
    updateVideo()
    saveGame()
}

dbg_view("Template", true, 18, 40, 390, 650)
    dbg_section("Runtime", true)
        dbg_text_input(ref_create(self, "debugRoom"), "Room: ", "r")
        dbg_text_input(ref_create(self, "debugFPS"), "FPS: ", "r")
        dbg_text_input(ref_create(self, "debugInput"), "Input: ", "r")
    dbg_section("Display", true)
        dbg_drop_down(ref_create(global, "resolution"), "1280x720, 1600x900, 1920x1080, 2560x1440, 3840x2160", "Resolution: ")
        dbg_text_input(ref_create(global, "fullscreen"), "Fullscreen: ", "r")
        dbg_text_input(ref_create(self, "debugWindow"), "Window: ", "r")
        dbg_text_input(ref_create(self, "debugSurface"), "Surface: ", "r")
        dbg_button("Toggle Fullscreen", toggleFullscreenDebug, 120, 22)
        dbg_same_line()
        dbg_button("Apply Video", applyVideoDebug, 90, 22)
    dbg_section("Audio", true)
        dbg_slider(ref_create(global, "masterVolume"), 0, 1, "Master: ", 0.01)
        dbg_slider(ref_create(global, "musicVolume"), 0, 1, "Music: ", 0.01)
        dbg_slider(ref_create(global, "sfxVolume"), 0, 1, "SFX: ", 0.01)
        dbg_button("Reset Audio", resetAudioDebug, 100, 22)
    dbg_section("Game", true)
        dbg_drop_down(ref_create(global, "difficulty"), "Easy, Normal, Hard", "Difficulty: ")
        dbg_slider(ref_create(global, "gamespeed"), 1, 240, "Game Speed: ", 1)
        dbg_drop_down(ref_create(global, "profile"), "P1, P2, P3", "Profile: ")
    dbg_section("Actions", true)
        save = function() {saveGame()}
        dbg_button("Save", save, 60, 22)
        dbg_same_line()
        load = function() {loadGame()}
        dbg_button("Load", load, 60, 22)
        dbg_same_line()
        dbg_button("Reset Settings", resetTemplateSettingsDebug, 110, 22)
        dbg_same_line()
        quit = function() {game_end()}
        dbg_button("Quit", quit, 50, 22)
#endregion

#region Navigation Control
xx = mouse_x
yy = mouse_y
#endregion

#region Locale Control
global.languages = []
global.languageIndex = 0
global.localeMap = ds_map_create()

var _defaultLocaleCode = "en"
var _defaultLocaleIndex = 0
var _nativeLocaleCode = os_get_language()
var _nativeLocaleIndex = 0

var _localeFileName = file_find_first("locale_*.json", 0)
if _localeFileName == "" {
    show_error("No locale files found!", 1)
    return
}
while _localeFileName != "" {
    show_debug_message("Loading locale file: " + _localeFileName)
    var _localeFile = file_text_open_read(_localeFileName)
    if _localeFile == -1 show_error("Error reading locale file " + _localeFileName, 1)

    var _jsonStr = ""
    var _j = 0
    while !file_text_eof(_localeFile) {
        _jsonStr += file_text_read_string(_localeFile)
        file_text_readln(_localeFile)
        _j++
    }
    file_text_close(_localeFile)

    var _localeMap = json_decode(_jsonStr)
    if _localeMap == -1 || !ds_map_exists(_localeMap, "locale_code") {
        show_error("Invalid locale data inside: " + _localeFileName, 1)
        return
    }

    var _localeCode = _localeMap[? "locale_code"]
    ds_map_add(global.localeMap, _localeCode, _localeMap)

    if _localeCode == _nativeLocaleCode _nativeLocaleIndex = global.languageIndex
    else if _localeCode == _defaultLocaleCode _defaultLocaleIndex = global.languageIndex

    global.languages[global.languageIndex] = _localeCode
    global.languageIndex++
    _localeFileName = file_find_next()
}
file_find_close()

if ds_map_exists(global.localeMap, _nativeLocaleCode) {
    global.localeWords = global.localeMap[? _nativeLocaleCode]
    global.languageIndex = _nativeLocaleIndex
} else if ds_map_exists(global.localeMap, _defaultLocaleCode) {
    global.localeWords = global.localeMap[? _defaultLocaleCode]
    global.languageIndex = _defaultLocaleIndex
} else {
    global.languageIndex = 0
    global.localeWords = global.localeMap[? global.languages[0]]
}
#endregion
