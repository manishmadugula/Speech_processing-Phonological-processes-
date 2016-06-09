function [ minimum_distance,area,matrixX,matrixY,steps ] = shimmer_dtwcomparision( y1,y2,Fs1,Fs2,Tw,Ts )
%DTW of Shimmer and finds the area and horizontal and vertical segments
%y1 AND y2 are 2 signals and Fs1 and Fs2 are their sampling frequency,Tw-window length,Ts-window Shift
%area is the area between y=x and the minimum path curve
%matrixX and matrixY has 3 columns the length of the horizontal segment and
%starting and ending co-ordinates of the segment in other 2 columns


    shimmer1=calcShimmerFeatures(y1,Fs1,Tw,Ts); 
    shimmer2=calcShimmerFeatures(y2,Fs2,Tw,Ts);
    
    [ minimum_distance,area,matrixX,matrixY,steps ] = dtwFeatureExtraction( shimmer1,shimmer2,Tw );



end

