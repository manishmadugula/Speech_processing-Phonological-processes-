%% PLOT the 2 waveforms
[y1,Fs1,bit1]=wavread('3.wav');
[y2,Fs2,bit2]=wavread('4.wav');

Frame_size = 20;
Frame_shift = Frame_size/2;
Frame_Size = Frame_size/1000;
Frame_Shift = Frame_shift/1000;
 

%Compute length of Audio Signal
t1=(1/Fs1:1/Fs1:(length(y1)/Fs1));
t2=(1/Fs2:1/Fs2:(length(y2)/Fs2));
%Plot a waveform of Audio Signal 

subplot(3,2,1);
plot(t1,y1);
subplot(3,2,2);
plot(t2,y2)

%Compute Window Length and Sample Shift of Signal Frame
Nw = Frame_Size*Fs1;
Ns = Frame_Shift*Fs1;

% %Window Length
% %w = rectwin(window_length);
% %w = hamming(window_length);
% %w = hann(window_length);
% w = hanning(window_length);

%% FIND THE DTW PLOT

   % Tw = 30;                % analysis frame duration (ms)
   % Ts = 15;                % analysis frame shift (ms)
    alpha = 0.97;           % preemphasis coefficient
    M = 20;                 % number of filterbank channels 
    C = 12;                 % number of cepstral coefficients
    L = 22;                 % cepstral sine lifter parameter
    LF = 300;               % lower frequency limit (Hz)
    HF = 3700;              % upper frequency limit (Hz)

%[pitch_val, r_pitch, c_pitch] = calcPitchFeatures(y, Fs, bits, Tw, Ts);
[MFCCs1, FBEs, frames ] = mfcc( y1, Fs1, Tw, Ts, alpha, @hamming, [LF HF], M, C+1, L );
[MFCCs2, FBEs, frames ] = mfcc( y2, Fs2, Tw, Ts, alpha, @hamming, [LF HF], M, C+1, L );

[minimum_distance, dist, g, path] = dtw(MFCCs1,MFCCs2,20);
subplot(3,2,[3,4,5,6]);
X=path;
X(:,2)=[];
Y=path;
Y(:,1)=[];
plot(X,Y);
hold on;
plot(X,X,'r');
hold off;


%% AREA OF THE CURVE
area=abs(trapz(X,Y)-trapz(X,X))


%% FIND THE HORIZONTAL AND VERTICAL SEGMENTS OF THE CURVE

sizeX=0;
matrixX=[];
startX=0;
flagX=0;
for(i=1:length(X)-1)
        if((X(i+1)-X(i))==0)
            if(flagX==0)
            flagX=1;
            startX=i;
            end
            sizeX=sizeX+1;
        end
        
        if(X(i+1)-X(i)~=0)
            if(flagX==1)
                end1=i;
                 A=[sizeX,startX,end1];
                matrixX=[matrixX ; A];
                startX=0;
                sizeX=0;
                flagX=0;
            end
        end
end


sizeY=0;
matrixY=[];
startY=0;
flagY=0;
for(i=1:length(Y)-1)
        if((Y(i+1)-Y(i))==0)
            if(flagY==0)
            flagY=1;
            startY=i;
            end
            sizeY=sizeY+1;
        end
        
        if(Y(i+1)-Y(i)~=0)
            if(flagY==1)
                end1=i;
                 A=[sizeY,startY,end1];
                matrixY=[matrixY ; A];
                startY=0;
                sizeY=0;
                flagY=0;
            end
        end
end
%% FORMANT ESTIMATION
[y1,Fs1,bit1]=wavread('3.wav');
[y2,Fs2,bit2]=wavread('4.wav');
Tw = 30;                % analysis frame duration (ms)
Ts = 15;                % analysis frame shift (ms)
%[y,fs,bt]=wavread('mom1.wav');


[pks1,loc1,r_pks1,c_peaks1]=lpcspecDemo(y1,Fs1,Tw,Ts);
[pks2,loc2,r_pks2,c_peaks2]=lpcspecDemo(y2,Fs2,Tw,Ts);
[minimum_distance, dist, g, path] = dtw(pks1,pks2,Tw);
X=path;
X(:,2)=[];
Y=path;
Y(:,1)=[];
plot(X,Y);
hold on;
plot(X,X,'r');
hold off;




%<---------------Explaination-------------->
%pks gives a matrix where it calculates 4 formants for each frame
%loc gives us location of those 4 formants
%r peaks=number of formants for each frame
%c_peaks=number of frames the whole speech signal is divided into;


%% CALCULATE JITTER AND SHIMMER FEATURES


jitter1=calcJitterFeatures(y1,Fs1,Tw,Ts);
shimmer1=calcShimmerFeatures(y1,Fs1,Tw,Ts);

jitter2=calcJitterFeatures(y2,Fs2,Tw,Ts);
shimmer2=calcShimmerFeatures(y2,Fs2,Tw,Ts);
%% CALCULATE PITCH FEATURES
[y1,Fs1,bit1]=wavread('3.wav');
Tw = 30;                % analysis frame duration (ms)
Ts = 15;                % analysis frame shift (ms)
Nw = round( 1E-3*Tw*Fs1 );    % frame duration (samples)
Ns = round( 1E-3*Ts*Fs1 );    % frame shift (samples)---->for testing purpose, both initial window and shift must be of same number of frames
framevect1=vec2frames( y1, Nw, Ns);
framevect1=framevect1';
[r1,c1] = size(framevect1);
matrix_pitch=[];
for iter = 1:r1
    segment = framevect1(iter,1:end);
    [T0, F0, a1] = Pitch_Calculation(segment, Fs1);
    matrix_pitch=[matrix_pitch;F0(1)];
end  
%% SECTION TITLE
% DESCRIPTIVE TEXT
  
        

