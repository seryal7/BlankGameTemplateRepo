#region Delta, Background Update, FPS Update
// Delta Time Update
global.deltaActual = delta_time / 1000000
global.deltaMulti = global.deltaActual / global.deltaTarget

// Background Animation Delta
var _bg = layer_get_id("Background")
var _dt = global.deltaMulti
if layer_get_hspeed(_bg) != 0 or layer_get_vspeed(_bg) != 0 {
	layer_hspeed(_bg, 0.5 * _dt)
	layer_vspeed(_bg, 0.5 * _dt)
}

// Update FPS
game_set_speed(global.gamespeed, gamespeed_fps)
#endregion

#region Music Control
// Mixer owns volume. Individual sounds are played at unity gain to avoid double scaling.
audio_master_gain(global.masterVolume)
if audio_group_is_loaded(agSoundFX) audio_group_set_gain(agSoundFX, global.sfxVolume, 0)
if audio_group_is_loaded(agMusic) {
    audio_group_set_gain(agMusic, global.musicVolume, 0)

    if musicInstance == noone || !audio_is_playing(musicInstance) {
        var _previous = randSong
        if array_length(playlist) > 1 {
            repeat (8) {
                randSong = irandom_range(0, array_length(playlist) - 1)
                if randSong != _previous break
            }
        }
        musicInstance = audio_play_sound(playlist[randSong], 1, false)
    }

    if musicInstance != noone {
        if !window_has_focus() && !audio_is_paused(musicInstance) audio_pause_sound(musicInstance)
        if window_has_focus() && audio_is_paused(musicInstance) audio_resume_sound(musicInstance)
    }
}
#endregion

#region Controller / KBM Detection

// Draw custom mouse cursor or not
/*if global.input == KBM cursor_sprite = sCursor
else if global.input == CONTROLLER cursor_sprite = cr_none*/

// Switch back to KBM if the mouse moves or any keyboard key is pressed
if ((mouse_x != xx) 
	or (mouse_y != yy) 
	or keyboard_check_pressed(vk_anykey)) 
	and global.input == CONTROLLER {
		global.input = KBM
		with (oButtonParent) controllerHovered = controllerHoveredBase
}
// Update previous mouse position to the new current position
xx = mouse_x;
yy = mouse_y;

// Find and ID the controller
var _controller = input_source_detect_input(INPUT_GAMEPAD)

// Turn the global controller flag on when the controller is used, if it's off already
if _controller and global.input == KBM global.input = CONTROLLER 


#endregion

#region Controller Navigation
if global.input == CONTROLLER {
	
	#region Main Menu
		if room == rMainMenu { // If the controller is active in the main menu

			if oButtonPlay.controllerHovered == true and input_check_pressed("down") { // Play
				oButtonPlay.controllerHovered = false
				oButtonSettings.controllerHovered = true
			}
			else if oButtonSettings.controllerHovered == true and input_check_pressed("up") { // Settings
				oButtonSettings.controllerHovered = false
				oButtonPlay.controllerHovered = true
		
			}
			else if oButtonSettings.controllerHovered == true and input_check_pressed("down") { // Settings
				oButtonSettings.controllerHovered = false
				oButtonQuit.controllerHovered = true
			}
			else if oButtonQuit.controllerHovered == true and input_check_pressed("up") { // Quit
				oButtonQuit.controllerHovered = false
				oButtonSettings.controllerHovered = true
			}
			else if oLanguageList.controllerHovered == true and input_check_pressed("left") { // Language List
				oLanguageList.controllerHovered = false
				with oLanguageItem instance_destroy()
				oButtonPlay.controllerHovered = true
			}
			else if oButtonPlay.controllerHovered == true and input_check_pressed("right") { // Play
				oButtonPlay.controllerHovered = false
				oLanguageList.controllerHovered = true
			}
			else if oButtonSettings.controllerHovered == true and input_check_pressed("right") { // Settings
				oButtonSettings.controllerHovered = false
				oLanguageList.controllerHovered = true
		
			}
			else if oButtonQuit.controllerHovered == true and input_check_pressed("right") { // Quit
				oButtonQuit.controllerHovered = false
				oLanguageList.controllerHovered = true
			}
			
			
			// Language selection
			if instance_exists(oLanguageItem) {
				
				if oLanguageList.controllerHovered == true and input_check_pressed("up") { // Language List
					oLanguageList.controllerHovered = false
					oLanguageList.items[0].controllerHovered = true
				}

				else if oLanguageList.items[0].controllerHovered == true and input_check_pressed("down") { // Item 0
					oLanguageList.items[0].controllerHovered = false
					oLanguageList.controllerHovered = true
				}

				else if oLanguageList.items[0].controllerHovered == true and input_check_pressed("up") { // Item 0
					oLanguageList.items[0].controllerHovered = false
					oLanguageList.items[1].controllerHovered = true
				}
			
				else if oLanguageList.items[1].controllerHovered == true and input_check_pressed("down") { // Item 1
					oLanguageList.items[1].controllerHovered = false
					oLanguageList.items[0].controllerHovered = true
				}

				else if oLanguageList.items[1].controllerHovered == true and input_check_pressed("up") { // Item 1
					oLanguageList.items[1].controllerHovered = false
					oLanguageList.items[2].controllerHovered = true
				}
			
				else if oLanguageList.items[2].controllerHovered == true and input_check_pressed("down") { // Item 2
					oLanguageList.items[2].controllerHovered = false
					oLanguageList.items[1].controllerHovered = true
				}

				else if oLanguageList.items[2].controllerHovered == true and input_check_pressed("up") { // Item 2
					oLanguageList.items[2].controllerHovered = false
					oLanguageList.items[3].controllerHovered = true
				}
				
				else if oLanguageList.items[3].controllerHovered == true and input_check_pressed("down") { // Item 3
					oLanguageList.items[3].controllerHovered = false
					oLanguageList.items[2].controllerHovered = true
				}

				else if oLanguageList.items[3].controllerHovered == true and input_check_pressed("up") { // Item 3
					oLanguageList.items[3].controllerHovered = false
					oLanguageList.items[4].controllerHovered = true
				}
				
				else if oLanguageList.items[4].controllerHovered == true and input_check_pressed("down") { // Item 4
					oLanguageList.items[4].controllerHovered = false
					oLanguageList.items[3].controllerHovered = true
				}

				else if oLanguageList.items[4].controllerHovered == true and input_check_pressed("up") { // Item 4
					oLanguageList.items[4].controllerHovered = false
					oLanguageList.items[5].controllerHovered = true
				}
			
				else if oLanguageList.items[5].controllerHovered == true and input_check_pressed("down") { // Item 5
					oLanguageList.items[5].controllerHovered = false
					oLanguageList.items[4].controllerHovered = true
				}
				
				else if input_check_pressed("left") or input_check_pressed("back") { // Play
					oLanguageList.controllerHovered = false
					with oLanguageItem instance_destroy()
					oButtonPlay.controllerHovered = true
				}
			}
		}
	#endregion

	#region Settings
		if room == rSettings { // If the controller is active in the main menu
		
			if oButtonAudio.controllerHovered == true and input_check_pressed("down") { // Audio
				oButtonAudio.controllerHovered = false
				oButtonVideo.controllerHovered = true
			}
			else if oButtonVideo.controllerHovered == true and input_check_pressed("up") { // Video
				oButtonVideo.controllerHovered = false
				oButtonAudio.controllerHovered = true
			}
			else if oButtonVideo.controllerHovered == true and input_check_pressed("down") { // Video
				oButtonVideo.controllerHovered = false
				oButtonGameplay.controllerHovered = true
			}
			else if oButtonGameplay.controllerHovered == true and input_check_pressed("up") { // Difficulty
				oButtonGameplay.controllerHovered = false
				oButtonVideo.controllerHovered = true
			}
			else if oButtonGameplay.controllerHovered == true and input_check_pressed("down") { // Difficulty
				oButtonGameplay.controllerHovered = false
				oButtonControls.controllerHovered = true
			}
			else if oButtonControls.controllerHovered == true and input_check_pressed("up") { // Controls
				oButtonControls.controllerHovered = false
				oButtonGameplay.controllerHovered = true
			}
			else if oButtonControls.controllerHovered == true and input_check_pressed("down") { // Controls
				oButtonControls.controllerHovered = false
				oButtonBackMenu.controllerHovered = true
			}
			else if oButtonBackMenu.controllerHovered == true and input_check_pressed("up") { // Back
				oButtonBackMenu.controllerHovered = false
				oButtonControls.controllerHovered = true
			}

		}
	#endregion

	#region Audio
		if room == rAudio { // If the controller is active in the main menu
			
			if oMasterVol.controllerHovered == true and input_check_pressed("down") { // MasterVol
				oMasterVol.controllerHovered = false
				oMusicVol.controllerHovered = true
			}
			else if oMusicVol.controllerHovered == true and input_check_pressed("up") { // MusicVol
				oMusicVol.controllerHovered = false
				oMasterVol.controllerHovered = true
			}
			else if oMusicVol.controllerHovered == true and input_check_pressed("down") { // MusicVol
				oMusicVol.controllerHovered = false
				oSoundVol.controllerHovered = true
			}
			else if oSoundVol.controllerHovered == true and input_check_pressed("up") { // SoundVol
				oSoundVol.controllerHovered = false
				oMusicVol.controllerHovered = true
			}
			else if oSoundVol.controllerHovered == true and input_check_pressed("down") { // SoundVol
				oSoundVol.controllerHovered = false
				oButtonBackSettings.controllerHovered = true
			}
			else if oButtonBackSettings.controllerHovered == true and input_check_pressed("up") { // Back
				oButtonBackSettings.controllerHovered = false
				oSoundVol.controllerHovered = true
			}
			
			var _left = input_check_pressed("left")
			var _right = input_check_pressed("right")
			var _leftHeld = input_check_long("left")
			var _rightHeld = input_check_long("right")
			if _leftHeld _left = 1
			else if _rightHeld _right = 1
			
			if oMasterVol.controllerHovered == true
				and _right
				and oMasterVol.slider.value < 1
					oMasterVol.slider.value += 0.01
					
			else if oMasterVol.controllerHovered == true
				and _left
				and oMasterVol.slider.value > 0
					oMasterVol.slider.value -= 0.01
			
			else if oMusicVol.controllerHovered == true
				and _right
				and oMusicVol.slider.value < 1
					oMusicVol.slider.value += 0.01
					
			else if oMusicVol.controllerHovered == true
				and _left
				and oMusicVol.slider.value > 0
					oMusicVol.slider.value -= 0.01
			
			else if oSoundVol.controllerHovered == true
				and _right
				and oSoundVol.slider.value < 1
					oSoundVol.slider.value += 0.01
					
			else if oSoundVol.controllerHovered == true
				and _left
				and oSoundVol.slider.value > 0
					oSoundVol.slider.value -= 0.01

		}
	#endregion

	#region Video
		if room == rVideo { // If the controller is active in the main menu
			
			if oResolutionList.controllerHovered == true and input_check_pressed("down") { // Resolution List
				oResolutionList.controllerHovered = false
				oToggleFullscreen.controllerHovered = true
			}
			else if oToggleFullscreen.controllerHovered == true and input_check_pressed("up") { // Toggle Fullscreen
				oToggleFullscreen.controllerHovered = false
				oResolutionList.controllerHovered = true
			}
			else if oToggleFullscreen.controllerHovered == true and input_check_pressed("down") { // Toggle Fullscreen
				oToggleFullscreen.controllerHovered = false
				oButtonBackSettings.controllerHovered = true
			}
			else if oButtonBackSettings.controllerHovered == true and input_check_pressed("up") { // Button Back Settings
				oButtonBackSettings.controllerHovered = false
				oToggleFullscreen.controllerHovered = true
			}
			else if oApply.controllerHovered == true and input_check_pressed("left") { // Button Back Settings
				oApply.controllerHovered = false
				oButtonBackSettings.controllerHovered = true
			}
			else if oApply.controllerHovered == true and input_check_pressed("up") { // Button Back Settings
				oApply.controllerHovered = false
				oToggleFullscreen.controllerHovered = true
			}
			else if input_check_pressed("right") { // Apply
				oResolutionList.controllerHovered = false
				oToggleFullscreen.controllerHovered = false
				oButtonBackSettings.controllerHovered = false
				with oResolutionItem instance_destroy()
				oApply.controllerHovered = true
			}
			
			// Item selection
			if instance_exists(oResolutionItem) {
				
				if oResolutionList.controllerHovered == true and input_check_pressed("up") { // Resolution List
					oResolutionList.controllerHovered = false
					oResolutionList.items[0].controllerHovered = true
				}

				else if oResolutionList.items[0].controllerHovered == true and input_check_pressed("down") { // Item 0
					oResolutionList.items[0].controllerHovered = false
					oResolutionList.controllerHovered = true
				}

				else if oResolutionList.items[0].controllerHovered == true and input_check_pressed("up") { // Item 0
					oResolutionList.items[0].controllerHovered = false
					oResolutionList.items[1].controllerHovered = true
				}
			
				else if oResolutionList.items[1].controllerHovered == true and input_check_pressed("down") { // Item 1
					oResolutionList.items[1].controllerHovered = false
					oResolutionList.items[0].controllerHovered = true
				}

				else if oResolutionList.items[1].controllerHovered == true and input_check_pressed("up") { // Item 1
					oResolutionList.items[1].controllerHovered = false
					oResolutionList.items[2].controllerHovered = true
				}
			
				else if oResolutionList.items[2].controllerHovered == true and input_check_pressed("down") { // Item 2
					oResolutionList.items[2].controllerHovered = false
					oResolutionList.items[1].controllerHovered = true
				}

				else if oResolutionList.items[2].controllerHovered == true and input_check_pressed("up") { // Item 2
					oResolutionList.items[2].controllerHovered = false
					oResolutionList.items[3].controllerHovered = true
				}
				
				else if oResolutionList.items[3].controllerHovered == true and input_check_pressed("down") { // Item 3
					oResolutionList.items[3].controllerHovered = false
					oResolutionList.items[2].controllerHovered = true
				}

				else if oResolutionList.items[3].controllerHovered == true and input_check_pressed("up") { // Item 3
					oResolutionList.items[3].controllerHovered = false
					oResolutionList.items[4].controllerHovered = true
				}
				
				else if oResolutionList.items[4].controllerHovered == true and input_check_pressed("down") { // Item 4
					oResolutionList.items[4].controllerHovered = false
					oResolutionList.items[3].controllerHovered = true
				}

				else if oResolutionList.items[4].controllerHovered == true and input_check_pressed("up") { // Item 4
					oResolutionList.items[4].controllerHovered = false
					oResolutionList.items[5].controllerHovered = true
				}
			
				else if oResolutionList.items[5].controllerHovered == true and input_check_pressed("down") { // Item 5
					oResolutionList.items[5].controllerHovered = false
					oResolutionList.items[4].controllerHovered = true
				}
				
				else if input_check_pressed("right") { // Apply
					oResolutionList.controllerHovered = false
					oToggleFullscreen.controllerHovered = false
					oButtonBackSettings.controllerHovered = false
					with oResolutionItem instance_destroy()
					oApply.controllerHovered = true
				}
			}
		}
	#endregion

	#region Gameplay
		if room == rGameplay { // If the controller is active in the main menu
		
			if oDifficultyList.controllerHovered == true and input_check_pressed("down") { // Difficulty List
				oDifficultyList.controllerHovered = false
				oButtonBackSettings.controllerHovered = true
			}
			else if oButtonBackSettings.controllerHovered == true and input_check_pressed("up") { // Button Back Settings
				oButtonBackSettings.controllerHovered = false
				oDifficultyList.controllerHovered = true
			}
			
			// Item selection
			if instance_exists(oDifficultyItem) {
				
				if oDifficultyList.controllerHovered == true and input_check_pressed("right") { // Resolution List
					oDifficultyList.controllerHovered = false
					oDifficultyList.items[0].controllerHovered = true
				}
				else if oDifficultyList.items[0].controllerHovered == true and input_check_pressed("left") { // Item 0
					oDifficultyList.items[0].controllerHovered = false
					oDifficultyList.controllerHovered = true
				}
				else if oDifficultyList.items[0].controllerHovered == true and input_check_pressed("right") { // Item 0
					oDifficultyList.items[0].controllerHovered = false
					oDifficultyList.items[1].controllerHovered = true
				}
				else if oDifficultyList.items[1].controllerHovered == true and input_check_pressed("left") { // Item 1
					oDifficultyList.items[1].controllerHovered = false
					oDifficultyList.items[0].controllerHovered = true
				}
				else if oDifficultyList.items[1].controllerHovered == true and input_check_pressed("right") { // Item 1
					oDifficultyList.items[1].controllerHovered = false
					oDifficultyList.items[2].controllerHovered = true
				}
				else if oDifficultyList.items[2].controllerHovered == true and input_check_pressed("left") { // Item 2
					oDifficultyList.items[2].controllerHovered = false
					oDifficultyList.items[1].controllerHovered = true
				}
				else if input_check_pressed("down") { // Apply
					oDifficultyList.controllerHovered = false
					oButtonBackSettings.controllerHovered = false
					with oDifficultyItem instance_destroy()
					oButtonBackSettings.controllerHovered = true
				}
				
				// Controller Accept
				if input_check_pressed("accept") {
					if oDifficultyList.items[0].controllerHovered == true global.difficulty = DIFFICULTY_EASY
					else if oDifficultyList.items[1].controllerHovered == true global.difficulty = DIFFICULTY_NORM
					else if oDifficultyList.items[2].controllerHovered == true global.difficulty = DIFFICULTY_HARD
				}
			}
		}
	#endregion

	#region Controls
		if room == rControls { // If the controller is active in the main menu
			
			if oUp.controllerHovered == true and input_check_pressed("down") { // Up
				oUp.controllerHovered = false
				oLeft.controllerHovered = true
			}
			else if oUp.controllerHovered == true and input_check_pressed("right") { // Up
				oUp.controllerHovered = false
				oInteract.controllerHovered = true
			}
			else if oLeft.controllerHovered == true and input_check_pressed("up") { // Left
				oLeft.controllerHovered = false
				oUp.controllerHovered = true
			}
			else if oLeft.controllerHovered == true and input_check_pressed("down") { // Left
				oLeft.controllerHovered = false
				oDown.controllerHovered = true
			}
			else if oLeft.controllerHovered == true and input_check_pressed("right") { // Left
				oLeft.controllerHovered = false
				oJump.controllerHovered = true
			}
			else if oDown.controllerHovered == true and input_check_pressed("up") { // Down
				oDown.controllerHovered = false
				oLeft.controllerHovered = true
			}
			else if oDown.controllerHovered == true and input_check_pressed("down") { // Down
				oDown.controllerHovered = false
				oRight.controllerHovered = true
			}
			else if oDown.controllerHovered == true and input_check_pressed("right") { // Down
				oDown.controllerHovered = false
				oRun.controllerHovered = true
			}
			else if oRight.controllerHovered == true and input_check_pressed("up") { // Right
				oRight.controllerHovered = false
				oDown.controllerHovered = true
			}
			else if oRight.controllerHovered == true and input_check_pressed("down") { // Right
				oRight.controllerHovered = false
				oButtonBackSettings.controllerHovered = true
			}
			else if oRight.controllerHovered == true and input_check_pressed("right") { // Right
				oRight.controllerHovered = false
				oInventory.controllerHovered = true
			}
			else if oInteract.controllerHovered == true and input_check_pressed("left") { // Interact
				oInteract.controllerHovered = false
				oUp.controllerHovered = true
			}
			else if oInteract.controllerHovered == true and input_check_pressed("down") { // Interact
				oInteract.controllerHovered = false
				oJump.controllerHovered = true
			}
			else if oJump.controllerHovered == true and input_check_pressed("up") { // Jump
				oJump.controllerHovered = false
				oInteract.controllerHovered = true
			}
			else if oJump.controllerHovered == true and input_check_pressed("left") { // Jump
				oJump.controllerHovered = false
				oLeft.controllerHovered = true
			}
			else if oJump.controllerHovered == true and input_check_pressed("down") { // Jump
				oJump.controllerHovered = false
				oRun.controllerHovered = true
			}
			else if oRun.controllerHovered == true and input_check_pressed("up") { // Run
				oRun.controllerHovered = false
				oJump.controllerHovered = true
			}
			else if oRun.controllerHovered == true and input_check_pressed("left") { // Run
				oRun.controllerHovered = false
				oDown.controllerHovered = true
			}
			else if oRun.controllerHovered == true and input_check_pressed("down") { // Run
				oRun.controllerHovered = false
				oInventory.controllerHovered = true
			}
			else if oInventory.controllerHovered == true and input_check_pressed("up") { // Inventory
				oInventory.controllerHovered = false
				oRun.controllerHovered = true
			}
			else if oInventory.controllerHovered == true and input_check_pressed("left") { // Inventory
				oInventory.controllerHovered = false
				oRight.controllerHovered = true
			}
			else if oInventory.controllerHovered == true and input_check_pressed("down") { // Inventory
				oInventory.controllerHovered = false
				oButtonBackSettings.controllerHovered = true
			}
			else if oButtonBackSettings.controllerHovered == true and input_check_pressed("up") { // Back
				oButtonBackSettings.controllerHovered = false
				oRight.controllerHovered = true
			}
			else if oButtonBackSettings.controllerHovered == true and input_check_pressed("right") { // Back
				oButtonBackSettings.controllerHovered = false
				oInventory.controllerHovered = true
			}
		}
	#endregion
	
	#region Backing up anywhere in the menus
		if input_check_pressed("back") and room == rSettings room_goto(rMainMenu)
		if input_check_pressed("back") and room == rAudio {
			room_goto(rSettings)
			saveGame()
		}
		if input_check_pressed("back") and room == rVideo room_goto(rSettings)
		if input_check_pressed("back") and room == rGameplay room_goto(rSettings)
		if input_check_pressed("back") and room == rControls room_goto(rSettings)
	#endregion

}
#endregion

