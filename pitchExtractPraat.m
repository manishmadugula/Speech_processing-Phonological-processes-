function [ matrix_pitch ] = pitchExtractPraat( str1)
str0=pwd;
C1=strsplit(str1,'\');
sound_name1=C1(end);
str_dir1=str0;
for i=1:(length(C1)-1)
    
str_dir1=strcat(str_dir1,'\ ',C1(i));

end
pitch_name1=strsplit(strjoin(sound_name1),'.');
pitch_name1=strjoin(pitch_name1(1));
pitch_name1=strcat(pitch_name1,'_pitch.csv ');

command_cell=strcat('praatcon.exe',{' '},'pitchextract.praat',{' '},sound_name1,{' '} ,pitch_name1,{' '},str_dir1,'\')

command_string=strjoin(command_cell);
[status]=system(command_string);

csv_dir1='';
for i=1:(length(C1)-1)
    
csv_dir1=strcat(csv_dir1,C1(i),'\');

end
csv_dir1=strjoin(csv_dir1);
csv_dir1=strcat(csv_dir1,pitch_name1);
matrix_pitch=csvread(csv_dir1);

end

