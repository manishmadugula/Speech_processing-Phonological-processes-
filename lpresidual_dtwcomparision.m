function [minimum_distance,area,matrixX,matrixY,steps ] = lpresidual_dtwcomparision( y1,y2,Fs1,Fs2,Tw )
%DTW of Short time dct of Linear Prediction residual and finds the area and horizontal and vertical segments
%y1 AND y2 are 2 signals and Fs1 and Fs2 are their sampling frequency,Tw-window length,Ts-window Shift
%area is the area between y=x and the minimum path curve
%matrixX and matrixY has 3 columns the length of the horizontal segment and
%starting and ending co-ordinates of the segment in other 2 columns

    
    Ts = Tw/2;
    lporder = 16;
    preempflag = 1;
    a = 1;
    plotflag = 1;
    
    
    
    
    [residual1,LPCoeffs1] = LPresidual_v4(y1,Tw,Ts,lporder,preempflag,a,plotflag);;
    [residual2,LPCoeffs2] = LPresidual_v4(y2,Tw,Ts,lporder,preempflag,a,plotflag);
    
    Nw1 = round( 1E-3*Tw*Fs1 );    % frame duration (samples)
    Ns1 = round( 1E-3*Ts*Fs1 );    % frame shift (samples)

    framevect1=vec2frames( residual1, Nw1, Ns1);
    framevect1=framevect1';

    [r1,c1] = size(framevect1);

    matrix_dct1=[];
    for iter = 1:r1
        segment = framevect1(iter,1:end);
        X=dct(segment);
        matrix_dct1=[matrix_dct1;X];
    end
    
    Nw2 = round( 1E-3*Tw*Fs2 );    % frame duration (samples)
    Ns2 = round( 1E-3*Ts*Fs2 );    % frame shift (samples)

    framevect2=vec2frames( residual2, Nw2, Ns2);
    framevect2=framevect2';

    [r2,c2] = size(framevect2);

    matrix_dct2=[];
    for iter = 1:r2
        segment = framevect2(iter,1:end);
        Y=dct(segment);
        matrix_dct2=[matrix_dct2;Y];
    end
    [ minimum_distance,area,matrixX,matrixY,steps ] = dtwFeatureExtraction( matrix_dct1.',matrix_dct2.',Tw );

    


end

