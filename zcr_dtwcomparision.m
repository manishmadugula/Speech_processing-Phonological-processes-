function [ minimum_distance,area,matrixX,matrixY,steps ] = zcr_dtwcomparision( y1,y2,Fs1,Fs2,Tw,Ts )
%DTW of ZCR and finds the area and horizontal and vertical segments
%y1 AND y2 are 2 signals and Fs1 and Fs2 are their sampling frequency,Tw-window length,Ts-window Shift
%area is the area between y=x and the minimum path curve
%matrixX and matrixY has 3 columns the length of the horizontal segment and
%starting and ending co-ordinates of the segment in other 2 columns

    
% y1 = y1.';
% 
% N = length(y1); % signal length
% n = 0:N-1;
% ts = n*(1/Fs1); % time for signal
% 
% % define the window
% wintype = 'rectwin';
% winlen = 1323;
% winamp = [0.5,1]*(1/winlen);
% 
% % find the zero-crossing rate
% zc1 = zerocross(y1,wintype,winamp(1),winlen);
% 
% 
% % time index for the ST-ZCR and STE after delay compensation
% out = (winlen-1)/2:(N+winlen-1)-(winlen-1)/2;
% t = (out-(winlen-1)/2)*(1/Fs1);
% 
% figure;
% subplot(2,1,1);
% plot(ts,y1); hold on;
% plot(t,zc1(out),'r','Linewidth',2); xlabel('t, seconds');
% title('Short-time Zero Crossing Rate');
% legend('signal','STZCR');
% 
% 
% 
% y2 = y2.';
% 
% N = length(y2); % signal length
% n = 0:N-1;
% ts = n*(1/Fs2); % time for signal
% 
% % define the window
% wintype = 'rectwin';
% winlen = 201;
% winamp = [0.5,1]*(1/winlen);
% 
% % find the zero-crossing rate
% zc2 = zerocross(y2,wintype,winamp(1),winlen);
% 
% 
% % time index for the ST-ZCR and STE after delay compensation
% out = (winlen-1)/2:(N+winlen-1)-(winlen-1)/2;
% t = (out-(winlen-1)/2)*(1/Fs2);
% 
% subplot(2,1,2);
% plot(ts,y2); hold on;
% plot(t,zc2(out),'r','Linewidth',2); xlabel('t, seconds');
% title('Short-time Zero Crossing Rate');
% legend('signal','STZCR');



%custom zcr
figure;
[ zc1 ] = stzcr( y1,Fs1,Tw,Ts );
[ zc2 ] = stzcr( y2,Fs2,Tw,Ts );
[ minimum_distance,area,matrixX,matrixY,steps ] = dtwFeatureExtraction( zc1,zc2,Tw );

    


end

