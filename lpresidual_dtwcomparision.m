function [minimum_distance,area,matrixX,matrixY,steps ] = lpresidual_dtwcomparision( y1,y2,Fs1,Fs2,Tw )
%DTW of Linear Prediction residual and finds the area and horizontal and vertical segments
%y1 AND y2 are 2 signals and Fs1 and Fs2 are their sampling frequency,Tw-window length,Ts-window Shift
%area is the area between y=x and the minimum path curve
%matrixX and matrixY has 3 columns the length of the horizontal segment and
%starting and ending co-ordinates of the segment in other 2 columns

    
    Ts = Tw/2;
    lporder = 16;
    preempflag = 1;
    a = 1;
    plotflag = 1;
    
    
    
    [residual1,LPCoeffs1] = LPresidual_v4(y1,Tw,Ts,lporder,preempflag,a,plotflag)
    [residual2,LPCoeffs2] = LPresidual_v4(y2,Tw,Ts,lporder,preempflag,a,plotflag)
    
    [ minimum_distance,area,matrixX,matrixY,steps] = dtwFeatureExtraction( residual1.',residual2.',Tw );
    
    



end

