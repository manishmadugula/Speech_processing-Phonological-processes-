function [ minimum_distance,area,matrixX,matrixY,steps ] = gci_dtwcomparision( y1,y2,Fs1,Fs2,Tw,Ts )
%DTW of glottal closure instant and finds the area and horizontal and vertical segments
%y1 AND y2 are 2 signals and Fs1 and Fs2 are their sampling frequency,Tw-window length,Ts-window Shift
%area is the area between y=x and the minimum path curve
%matrixX and matrixY has 3 columns the length of the horizontal segment and
%starting and ending co-ordinates of the segment in other 2 columns

    [zfSig1, gci1, slope1]=epochExtract(y1, Fs1,Tw,Ts);
    [zfSig2, gci2, slope2]=epochExtract(y2, Fs2,Tw,Ts);
    
    a1=size(y1);
    first_sequence=zeros(a1(1),1);
    b1=size(gci1);
    for(i=1:b1(1))
        first_sequence(gci1(i))=1;
    end
    
        a2=size(y2);
    second_sequence=zeros(a2(1),1);
    b2=size(gci2);
    for(i=1:b2(1))
        second_sequence(gci2(i))=1;
    end
    
    [ minimum_distance,area,matrixX,matrixY,steps ] = pitch_dtwcomparision( first_sequence,second_sequence,Fs1,Fs2,Tw,Ts );


end