function [  ] = spect(y,Fs )
window=hamming(512);
noverlap=256;
nfft=1024;
[S,T,F,P]=spectrogram(y,window,noverlap,nfft,Fs,'yaxis');
surf(T,F,10*log10(P),'edgecolor','none');
axis tight;
view(0,90);
colormap(hot);
set(gca,'clim',[-80,-30]);


end

