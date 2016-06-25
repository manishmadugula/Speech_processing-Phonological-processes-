form PitchExtractor
sentence sound_file_name
sentence pitch_file_name
sentence Directory
endform

echo Reading from 'Directory$''sound_file_name$'
Read from file... 'Directory$''sound_file_name$'
To Pitch... 0.0 75 600

pitchID = selected("Pitch");
num_points = Get number of frames

filedelete 'Directory$''pitch_file_name$'
echo Writing to 'Directory$''pitch_file_name$'
for i to num_points
frame1=i
hertz=Get value in frame...  i Hertz
if hertz = undefined
    hertz=0
endif
fileappend "'Directory$''pitch_file_name$'" 'frame1','hertz' 'newline$'

endfor