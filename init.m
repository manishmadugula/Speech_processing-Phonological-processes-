[y1,Fs1,bit1]=wavread('total/puje/correct/puje.wav');
[y2,Fs2,bit2]=wavread('total/puje/incorrect/puche_2.wav');
Tw = 30;                % analysis frame duration (ms)
Ts = 15;                % analysis frame shift (ms)
y1 = y1 / max(y1);
y2 = y2 / max(y2);
subplot(1,2,1);
plot(y1);
subplot(1,2,2);
plot(y2);
figure;



% Max value 100: 
% y = y / max(y) * 100;
% Max absolute value 8: 
% y = y / max(abs(y)) * 8;
% Energy normalization: 
% y = y / sum(y.^2); 