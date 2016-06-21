%correct with correct

% %    different speaker-1
%         [y1,Fs1,bit1]=wavread('total/shatapadi/correct/shatapadi.wav');
%         [y2,Fs2,bit2]=wavread('total/shatapadi/correct/shatapadi_2.wav');

    %different speaker-2
%          [y1,Fs1,bit1]=wavread('total/shatapadi/correct/shatapadi.wav');
%          [y2,Fs2,bit2]=wavread('total/shatapadi/correct/shatapadi (2).wav');

    %different speaker-3
%           [y1,Fs1,bit1]=wavread('total/shatapadi/correct/shatapadi (2).wav');
%           [y2,Fs2,bit2]=wavread('total/shatapadi/correct/shatapadi_1.wav');

    %same speaker
%            [y1,Fs1,bit1]=wavread('total/shatapadi/correct/shatapadi (3).wav');
%            [y2,Fs2,bit2]=wavread('total/shatapadi/correct/shatapadi_1.wav');

%incorrect with incorrect
    
    %same word-1
%              [y1,Fs1,bit1]=wavread('total/shatapadi/incorrect/shadapadi.wav');
%              [y2,Fs2,bit2]=wavread('total/shatapadi/incorrect/shadapadi_3.wav');

    %same word-2(same speaker)
%              [y1,Fs1,bit1]=wavread('total/shatapadi/incorrect/shatapati.wav');
%              [y2,Fs2,bit2]=wavread('total/shatapadi/incorrect/shatapati_3.wav');

    %different word (same speaker)
%              [y1,Fs1,bit1]=wavread('total/shatapadi/incorrect/shadapadi.wav');
%              [y2,Fs2,bit2]=wavread('total/shatapadi/incorrect/shatapati.wav');

    %different word (same speaker)
%              [y1,Fs1,bit1]=wavread('total/shatapadi/incorrect/shadapadi_3.wav');
%              [y2,Fs2,bit2]=wavread('total/shatapadi/incorrect/shatapati.wav');


%correct with incorrect
     
%first mistake
     
    %(same speaker)
%          [y1,Fs1,bit1]=wavread('total/shatapadi/correct/shatapadi.wav');
%          [y2,Fs2,bit2]=wavread('total/shatapadi/incorrect/shadapadi.wav');

    %(different speaker)
%          [y1,Fs1,bit1]=wavread('total/shatapadi/correct/shatapadi.wav');
%          [y2,Fs2,bit2]=wavread('total/shatapadi/incorrect/shadapadi_3.wav');

    %(same speaker)
%          [y1,Fs1,bit1]=wavread('total/shatapadi/correct/shatapadi (3).wav');
%          [y2,Fs2,bit2]=wavread('total/shatapadi/incorrect/shadapadi_3.wav');

     %(different speaker)
%          [y1,Fs1,bit1]=wavread('total/shatapadi/correct/shatapadi (2).wav');
%          [y2,Fs2,bit2]=wavread('total/shatapadi/incorrect/shadapadi_3.wav');
%     
%second mistake

     %(same speaker)
%          [y1,Fs1,bit1]=wavread('total/shatapadi/correct/shatapadi (3).wav');
%          [y2,Fs2,bit2]=wavread('total/shatapadi/incorrect/shatapati_3.wav');

      %(different speaker)
%          [y1,Fs1,bit1]=wavread('total/shatapadi/correct/shatapadi (3).wav');
%          [y2,Fs2,bit2]=wavread('total/shatapadi/incorrect/shatapati.wav');

%        different words
          [y1,Fs1,bit1]=wavread('total/shatapadi/correct/shatapadi (3).wav');
          [y2,Fs2,bit2]=wavread('total/akarshaka/correct/akashaka.wav');









% [y1,Fs1,bit1]=wavread('total/shatapadi/correct/shatapadi.wav');
%  [y2,Fs2,bit2]=wavread('total/shatapadi/correct/shatapadi_2.wav');
% [y1,Fs1,bit1]=wavread('total/shatapadi/incorrect/shatapati.wav');
%  [y2,Fs2,bit2]=wavread('total/shatapadi/incorrect/shatapati_2.wav');
%[y2,Fs2,bit2]=wavread('total/sampadakaru/incorrect/sampachakaru.wav');
% [y1,Fs1]=wavread('1.wav');
% [y2,Fs2]=wavread('2.wav');
%[y1,Fs1]=wavread('ka.wav');

Tw = 30;                % analysis frame duration (ms)
Ts = 15;                % analysis frame shift (ms)
y1 = y1 / max(abs(y1));
y2 = y2 / max(abs(y2));
subplot(1,2,1);
plot(y1);
subplot(1,2,2);
plot(y2);
player1=audioplayer(y1,Fs1);
player2=audioplayer(y2,Fs2);

%Enable filtering
% y1=wcmvn(y1.',661,true);
% y2=wcmvn(y2.',661,true);
% y1=y1.'
% y2=y2.'


% Max value 100: 
% y = y / max(y) * 100;
% Max absolute value 8: 
% y = y / max(abs(y)) * 8;
% Energy normalization: 
% y = y / sum(y.^2); 