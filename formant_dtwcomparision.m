function [ minimum_distance,area,matrixX,matrixY,steps ] = formant_dtwcomparision( y1,y2,Fs1,Fs2,Tw,Ts )
%DTW of formants and finds the area and horizontal and vertical segments
%y1 AND y2 are 2 signals and Fs1 and Fs2 are their sampling frequency,Tw-window length,Ts-window Shift
%area is the area between y=x and the minimum path curve
%matrixX and matrixY has 3 columns the length of the horizontal segment and
%starting and ending co-ordinates of the segment in other 2 columns

    %finds first 2 formants of the 2 signals for each frame
    [pks1,loc1,r_pks1,c_peaks1]=lpcspecDemo(y1,Fs1,Tw,Ts);
    [pks2,loc2,r_pks2,c_peaks2]=lpcspecDemo(y2,Fs2,Tw,Ts);

    %finds the dtw of formant information
    [ minimum_distance,area,matrixX,matrixY,steps ] = dtwFeatureExtraction( pks1,pks2,Tw );


end

