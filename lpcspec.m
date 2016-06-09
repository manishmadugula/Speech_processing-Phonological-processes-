function [freq, lpc_logmag] = lpcspec(x, rate, index)
    %clear all
    %[x,rate]=wavread('vocal.wav');
    %x=x(3201:3520);
    %x=x.*hamming(320);
    %hamming = @(N)(0.54-0.46*cos(2*pi*[0:N-1].'/(N-1)));
    p=32;
    a=lpc(x,p);
    nfft=2048;
    freq=linspace(0,rate/2,nfft/2+1);
    fft_logmag = 20 * log10 ( abs( fft( x, nfft ) ) );
    fft_logmag = fft_logmag(1:nfft/2+1);
    %plot(freq,fft_logmag,'k');
    lpc_logmag = -20 * log10 ( abs( fft( a, nfft ) ) );
    lpc_logmag = lpc_logmag(1:nfft/2+1);
%      hold on;
%     [pks, locs] = findpeaks(lpc_logmag);
% 
%     
%     %plot(freq(locs), pks);
%     plot(freq(locs), pks,'r*');
%     
%     locs1 = freq(locs)
%     plot(freq,lpc_logmag,'b');
%     %hold off
%     xlabel('Frequency (Hz)')
%     ylabel('Magnitude (dB)')
end