/// @param {real} sound The sound to play
/// @description Play a one-shot SFX. Volume is controlled by agSoundFX + master gain.
function playSound(sound) {
    if !global.sfxLoaded return noone
    return audio_play_sound(sound, 10, false)
}
