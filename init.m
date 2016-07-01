clc;
clear;
%all the str1 andd str2 should be divided by"\" not "/"....and make sure
%there is no spaces in the file name or folder name



%shatapadi
%correct with correct

    % %    different speaker-1
%     str1='total\shatapadi\correct\shatapadi.wav'
%     str2='total\shatapadi\correct\shatapadi_2.wav'

        %different speaker-2
%             str1='total\shatapadi\correct\shatapadi.wav';
%             str2='total\shatapadi\correct\shatapadi_(2).wav';%may be
%             incorrect

        %different speaker-3
%         str1='total\shatapadi\correct\shatapadi_(2).wav';
%         str2='total\shatapadi\correct\shatapadi_1.wav';

        %same speaker
%               str1='total\shatapadi\correct\shatapadi_(3).wav'
%               str2='total\shatapadi\correct\shatapadi_1.wav'


%     incorrect with incorrect

        %same word-1
%               str1='total\shatapadi\incorrect\shadapadi.wav'
%               str2='total\shatapadi\incorrect\shadapadi_3.wav'

        %same word-2(same speaker)
%               str1='total\shatapadi\incorrect\shadapadi.wav'
%               str2='total\shatapadi\incorrect\shatapati_3.wav'


        %different word (same speaker)
%               str1='total\shatapadi\incorrect\shadapadi.wav'
%                str2='total\shatapadi\incorrect\shatapati.wav'


        %different word (same speaker)
%                str1='total\shatapadi\incorrect\shadapadi_3.wav'
%                str2='total\shatapadi\incorrect\shatapati.wav'

    

    %correct with incorrect

    %first mistake

        %(same speaker)
%         str1='total\shatapadi\correct\shatapadi.wav'
%         str2='total\shatapadi\incorrect\shadapadi.wav'

        %(different speaker)
%                str1='total\shatapadi\correct\shatapadi.wav'
%             str2='total\shatapadi\incorrect\shatapati_3.wav'


        %(same speaker)
%             str1='total\shatapadi\correct\shatapadi_(3).wav'
%             str2='total\shatapadi\incorrect\shadapadi_3.wav'
  

         %(different speaker)
%              str1='total\shatapadi\correct\shatapadi_(2).wav'
%             str2='total\shatapadi\incorrect\shadapadi_3.wav'
  
  

    %second mistake

         %(same speaker)
%              str1='total\shatapadi\correct\shatapadi_(3).wav'
%             str2='total\shatapadi\incorrect\shatapati_3.wav'


          %(different speaker)
%     str1='total\shatapadi\correct\shatapadi_(3).wav'
%     str2='total\shatapadi\incorrect\shatapati.wav'


           %        different words
%     str1='total\shatapadi\correct\shatapadi.wav'
%     str2='total\avignawagi\correct\avignawagi.wav'

    str1='total\shatapadi\correct\shatapadi.wav'
    str2='total\sampadakaru\incorrect\sampatakaru.wav'

%     str1='total\shatapadi\correct\shatapadi.wav'
%     str2='total\daguttade\incorrect\dakuttade.wav'

%     str1='total\shatapadi\correct\shatapadi.wav'
%     str2='total\dharawahi\correct\daravahi.wav'

%     str1='total\shatapadi\correct\shatapadi.wav'
%     str2='total\dharawahi\incorrect\dharawagi.wav'

%     str1='total\shatapadi\correct\shatapadi.wav'
%     str2='total\bhachanikeyinda\correct\bhachanikeyinda.wav'

%     str1='total\shatapadi\correct\shatapadi.wav'
%     str2='total\egarisida\correct\egarisida.wav'

%     str1='total\shatapadi\correct\shatapadi.wav'
%     str2='total\avignawagi\correct\avignawagi.wav'


%Extras

% str1='total\nadiyitu\correct\nadiyitu.wav'
% str2='total\nadiyitu\incorrect\nadiyidu.wav'

% str1='total\kachaguli\correct\kachaguli.wav'
% str2='total\kachaguli\incorrect\kachakuli.wav'

              [y1,Fs1,bit1]=wavread(str1);
              [y2,Fs2,bit2]=wavread(str2);

              
              
              
              
              %[y2,Fs2,bit2]=wavread('total/sampadakaru/incorrect/sampachakaru.wav');
% [y1,Fs1]=wavread('1.wav');
% [y2,Fs2]=wavread('2.wav');
%[y1,Fs1]=wavread('ka.wav');

Tw = 30;                % analysis frame duration (ms)
Ts = 15;                % analysis frame shift (ms)
y1 = y1 / max(abs(y1));
y2 = y2 / max(abs(y2));
% subplot(1,2,1);
% plot(y1);
% subplot(1,2,2);
% plot(y2);
player1=audioplayer(y1,Fs1);
player2=audioplayer(y2,Fs2);

%Enable filtering
% y1=wcmvn(y1.',661,true);
% y2=wcmvn(y2.',661,true);
% y1=y1.';
% y2=y2.';


% Max value 100: 
% y = y / max(y) * 100;
% Max absolute value 8: 
% y = y / max(abs(y)) * 8;
% Energy normalization: 
% y = y / sum(y.^2); 