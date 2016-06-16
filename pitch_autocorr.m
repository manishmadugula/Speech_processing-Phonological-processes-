function [ F0 ] = pitch_autocorr( y,Fs )
%calculates pitch from the segment of the sound by using autocorrelation
%method

%Compute Autocorrelation
[autocor, lag] = xcorr(y); 

%Find the center of the Autocorrelation Array
for j=1:length(lag)-1
    if(lag(j) == 0)
        idx_lag_0 = j;
        break;
    end;
end;

%Copy the Array from the Center 
lag_1 = lag(j:length(lag));
autocorr_1 = autocor(j:length(autocor));

%find the Peaks and their corrosponding location
[peaks,locs] = findpeaks(autocorr_1,'SORTSTR','descend');

%find the time sample difference between 2 peaks
T01 = locs(2)- locs(1);

%if time is negative make it positive
if(T01 < 0)
    T01 = -1 * T01;
end

%find the time from time samples
T0 = T01*(1/Fs);

%pitch from time
F0=1/T0;

%whole number
F0 = ceil(F0);


end

