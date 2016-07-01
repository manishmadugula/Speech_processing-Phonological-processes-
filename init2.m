close all   
clear
clc
% str2='total\bhachanikeyinda\incorrect\bhachanigeyinda.wav'
% str1='total\bhachanikeyinda\correct\bhachanikeyinda.wav'

% str1='total\ektari\correct\ektari.wav';
% str2='total\ektari\incorrect\ekdari_2.wav';

% str2='total\maditu\correct\maditu.wav'
% % str2='total\maditu\incorrect\madidu_denoised.wav'
% 
% % str1='total\m_1.wav';
% str1='total\m_2.wav';

% str1='total\aditya\correct\aditya.wav';%?
% str2='total\aditya\incorrect\adittta.wav';

% str1='total\aitihasika\correct\aitihazika.wav';%da
% str2='total\aitihasika\incorrect\adihasika.wav';

% str1='total\akarshaka\correct\akashaka.wav';%gd
% str2='total\akarshaka\incorrect\agadshaka_2.wav';

%  str1='total\anchige\correct\anchage.wav';%gd
%  str2='total\anchige\incorrect\panchage.wav';

 str1='total\atttake\correct\attakke_2.wav';%?
 str2='total\atttake\incorrect\attage.wav';

%  str1='total\avignawagi\correct\avignawagi_2_denoised.wav';%gd
%  str2='total\avignawagi\incorrect\avishyawagi_denoised.wav';

%  str1='total\avignawagi\correct\avignawagi_3.wav';%not good
%  str2='total\avignawagi\incorrect\havignawagi.wav';

% str1='total\balipetadamele\correct\balipeethada_(2).wav';%gd
% str2='total\balipetadamele\incorrect\balibeethada_2.wav';

% str1='total\bhachanikeyinda\correct\bhachanikeyinda.wav';%gd
% str2='total\bhachanikeyinda\incorrect\bhachanigeyinda.wav'

% str1='total\daguttade\correct\aguttade_2.wav';%not good 
% str2='total\daguttade\incorrect\atuttade.wav';

% str1='total\deepagamba\correct\deepagamba.wav';%gd
% str2='total\deepagamba\incorrect\deepakamba_denoised.wav';

% str1='total\dhanasannu\correct\shivadhanasannu.wav';%gd
% str2='total\dhanasannu\incorrect\shivadhasasannu.wav'

% str1='total\dharawahi\correct\daravahi_3.wav';%gd
% str2='total\dharawahi\incorrect\dharavagi.wav';

% str1='total\duryodhana\correct\duryodhana.wav';%gd
% str2='total\duryodhana\incorrect\duryodtana_2.wav';

% str1='total\egarisida\incorrect\hegarisida_4.wav';%not good
% str2='total\egarisida\correct\egarisida_5.wav';

%  str1='total\ektari\correct\ektari_denoised.wav';%gd
%  str2='total\ektari\incorrect\ekdari_4.wav';

% str1='total\galante\correct\galante.wav';%gd
% str2='total\galante\incorrect\galive.wav';

% str1='total\gonda_hole\correct\gonda.wav';%not good
% str2='total\gonda_hole\incorrect\konda.wav';














[y1,Fs1,bit1]=wavread(str1);
[y2,Fs2,bit2]=wavread(str2);
plot(y1);
figure
plot(y2);
Tw = 30;                % analysis frame duration (ms)
Ts = 15;                % analysis frame shift (ms)
player1=audioplayer(y1,Fs1);
player2=audioplayer(y2,Fs2);
