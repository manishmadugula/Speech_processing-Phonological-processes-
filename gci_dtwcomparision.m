function [ minimum_distance,area,matrixX,matrixY,steps ] = gci_dtwcomparision( y1,y2,Fs1,Fs2,Tw,Ts )
%DTW of glottal closure instant and finds the area and horizontal and vertical segments
%y1 AND y2 are 2 signals and Fs1 and Fs2 are their sampling frequency,Tw-window length,Ts-window Shift
%area is the area between y=x and the minimum path curve
%matrixX and matrixY has 3 columns the length of the horizontal segment and
%starting and ending co-ordinates of the segment in other 2 columns

    [zfSig1, gci1, slope1]=epochExtract(y1, Fs1);
    [zfSig2, gci2, slope2]=epochExtract(y2, Fs2);
    
    [ minimum_distance,area,matrixX,matrixY,steps ] = dtwFeatureExtraction( gci1.',gci2.',Tw );


end