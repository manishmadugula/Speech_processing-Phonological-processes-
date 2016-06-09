function [ minimum_distance,area,matrixX,matrixY,steps ] = jitter_dtwcomparision( y1,y2,Fs1,Fs2,Tw,Ts )
%DTW of Jitter and finds the area and horizontal and vertical segments
%y1 AND y2 are 2 signals and Fs1 and Fs2 are their sampling frequency,Tw-window length,Ts-window Shift
%area is the area between y=x and the minimum path curve
%matrixX and matrixY has 3 columns the length of the horizontal segment and
%starting and ending co-ordinates of the segment in other 2 columns


    jitter1=calcJitterFeatures(y1,Fs1,Tw,Ts);
    jitter2=calcJitterFeatures(y2,Fs2,Tw,Ts);
    
    [ minimum_distance,area,matrixX,matrixY,steps ] = dtwFeatureExtraction( jitter1,jitter2,Tw );



end

