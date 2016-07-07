function [ minimum_distance,area,matrixX,matrixY,steps ] = zfSig_dtwcomparision( y1,y2,Fs1,Fs2,Tw,Ts )
%DTW of glottal closure instant and finds the area and horizontal and vertical segments
%y1 AND y2 are 2 signals and Fs1 and Fs2 are their sampling frequency,Tw-window length,Ts-window Shift
%area is the area between y=x and the minimum path curve
%matrixX and matrixY has 3 columns the length of the horizontal segment and
%starting and ending co-ordinates of the segment in other 2 columns

    [zfSig1, gci1, slope1]=epochExtract(y1, Fs1,Tw,Ts);
    [zfSig2, gci2, slope2]=epochExtract(y2, Fs2,Tw,Ts);
    subplot(2,2,1);
    plot((zfSig1));
    Frame_size=20/1000;
    Frame_shift=10/1000;                             %so that x axis is time not samples
    %% perform short term energy calculation of zfSig1
    window_length=Frame_size*Fs1;
    window_shift=floor(Frame_shift*Fs1);
    sum1=0;
    energy1=0;
    w = window(@rectwin,window_length);
    jj=1;
    y=(zfSig1);
    for i=1:(floor(length(y)/window_shift)-ceil(window_length/window_shift))        %1 to 
        for j=((i-1)*window_shift+1):(((i-1)*window_shift+1)+window_length-1)
                y(j)=y(j)*w(jj);
                jj=jj+1;
                yy=y(j)*y(j);
                sum1=sum1+yy;
        end
        energy1(i)=sum1;
        sum1=0;
        jj=1;
    end
    c1=energy1;
    subplot(2,2,3);
    plot(c1);
    
    subplot(2,2,2);
    plot((zfSig2));
    Frame_size=Tw/1000;
    Frame_shift=Ts/1000;                             %so that x axis is time not samples
    %% perform short term energy calculation of zfSig1
    window_length=Frame_size*Fs2;
    window_shift=floor(Frame_shift*Fs2);
    sum2=0;
    energy2=0;
    w = window(@rectwin,window_length);
    jj=1;
    y=(zfSig2);
    for i=1:(floor(length(y)/window_shift)-ceil(window_length/window_shift))        %1 to 
        for j=((i-1)*window_shift+1):(((i-1)*window_shift+1)+window_length-1)
                y(j)=y(j)*w(jj);
                jj=jj+1;
                yy=y(j)*y(j);
                sum2=sum2+yy;
        end
        energy2(i)=sum2;
        sum2=0;
        jj=1;
    end
    c2=energy2;
    subplot(2,2,4);
    plot(c2);
    figure
    [c1,c2]=duration_normalization(c1.',c2.');
    [ minimum_distance,area,matrixX,matrixY,steps ] = dtwFeatureExtraction( c1.',c2.',Tw );

    
end

