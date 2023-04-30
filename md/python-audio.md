# Credit: https://stackoverflow.com/questions/42492246/how-to-normalize-the-volume-of-an-audio-file-in-python-any-packages-currently-a#answer-42496373
# pip install pydub

from pydub import AudioSegment

def match_target_amplitude(sound, target_dBFS):
    change_in_dBFS = target_dBFS - sound.dBFS
    return sound.apply_gain(change_in_dBFS)

sound = AudioSegment.from_file("yourAudio.m4a", "m4a")
normalized_sound = match_target_amplitude(sound, -20.0)
normalized_sound.export("nomrmalizedAudio.m4a", format="mp4")