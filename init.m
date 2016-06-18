 [y1,Fs1,bit1]=wavread('total/nadiyitu/correct/nadiyitu.wav');
 [y2,Fs2,bit2]=wavread('total/nadiyitu/correct/nadiyitu_2.wav');
%[y2,Fs2,bit2]=wavread('total/sampadakaru/incorrect/sampachakaru.wav');
%[y1,Fs1]=wavread('1.wav');
%[y2,Fs2]=wavread('2.wav');

%[y1,Fs1]=wavread('ka.wav');

Tw = 30;                % analysis frame duration (ms)
Ts = 15;                % analysis frame shift (ms)
y1 = y1 / max(y1);
y2 = y2 / max(y2);
subplot(1,2,1);
plot(y1);
subplot(1,2,2);
plot(y2);
% Max value 100: 
% y = y / max(y) * 100;
% Max absolute value 8: 
% y = y / max(abs(y)) * 8;
% Energy normalization: 
% y = y / sum(y.^2); 