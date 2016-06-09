function [minimum_distance, area,matrixX,matrixY,steps ] = mfcc_dtwcomparision(y1,y2,Fs1,Fs2,Tw,Ts)
%DTW of MFCCs and finds the area and horizontal and vertical segments
%y1 AND y2 are 2 signals and Fs1 and Fs2 are their sampling frequency,Tw-window length,Ts-window Shift
%area is the area between y=x and the minimum path curve
%matrixX and matrixY has 3 columns the length of the horizontal segment and
%starting and ending co-ordinates of the segment in other 2 columns


    alpha = 0.97;           % preemphasis coefficient
    M = 20;                 % number of filterbank channels 
    C = 12;                 % number of cepstral coefficients
    L = 22;                 % cepstral sine lifter parameter
    LF = 300;               % lower frequency limit (Hz)
    HF = 3700;              % upper frequency limit (Hz)
    
    %find mfcc of 2 signals
    [MFCCs1, FBEs, frames ] = mfcc( y1, Fs1, Tw, Ts, alpha, @hamming, [LF HF], M, C+1, L );
    [MFCCs2, FBEs, frames ] = mfcc( y2, Fs2, Tw, Ts, alpha, @hamming, [LF HF], M, C+1, L );
    
    [ minimum_distance,area,matrixX,matrixY,steps] = dtwFeatureExtraction( MFCCs1,MFCCs2,Tw );
    
    
    


end

