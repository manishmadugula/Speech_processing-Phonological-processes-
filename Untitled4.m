%reference sounds
str1='total\shatapadi\correct\shatapadi_(3).wav'
str2='total\shatapadi\correct\shatapadi_(2).wav'
str3='total\shatapadi\correct\shatapadi_1.wav'
str4='total\shatapadi\incorrect\shadapadi.wav'
str5='total\shatapadi\incorrect\shatapati.wav'
str0='total\shatapadi\incorrect\shadapadi_(2).wav'
[y1,Fs1,bit1]=wavread(str1);
[y2,Fs2,bit2]=wavread(str2);
[y3,Fs3,bit3]=wavread(str3);
[y4,Fs4,bit4]=wavread(str4);
[y5,Fs5,bit5]=wavread(str5);
[y0,Fs0,bit0]=wavread(str0);
%test sound

[ matrix_pitch1 ] = pitchExtractPraat( str1);
[ matrix_pitch2 ] = pitchExtractPraat( str2);
[ matrix_pitch3 ] = pitchExtractPraat( str3);
[ matrix_pitch4 ] = pitchExtractPraat( str4);
[ matrix_pitch5 ] = pitchExtractPraat( str5);
[ matrix_pitch0 ] = pitchExtractPraat( str0);



matrix_1=[matrix_pitch1(:,2).',matrix_pitch2(:,2).',matrix_pitch3(:,2).',matrix_pitch4(:,2).',matrix_pitch5(:,2).'];
matrix_2=matrix_pitch0(:,2).';
[ matrix ] = cdf_normalization( matrix_1,matrix_2,30,15 );
