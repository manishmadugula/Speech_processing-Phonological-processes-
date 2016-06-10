function demoLPR()

[x, fs, nbits] = wavread('aa_f.wav');

%x = x(1501:1660);
speech = x;

[zfSig, gci, slope]=epochExtract(x, fs);

len = length(gci);
k = ones(len);

    
figure;
hold on;
subplot(2,1,1)

t = (1/fs):(1/fs):(length(speech)/fs);
plot(t,speech);

set(0,'DefaultTextFontsize',11, ...
'DefaultTextFontname','Times New Roman', ...
'DefaultTextFontWeight','normal', ...
'DefaultAxesFontname','Times New Roman', ...
'DefaultLineLineWidth', 1)

title('(A) Original speech file','FontWeight','normal','FontSize',11)

xlabel('Time (in seconds)','FontWeight','normal','FontSize',11);
ylabel('Amplitude (dB)','FontWeight','normal','FontSize',11);
grid;

%z = xcorr(speech);


%gci = gci.';
%hStem = stem(gci,k,'ko');

subplot(2,1,2);
stem(gci,k,'bo');
hold on;
hLine = plot(t,speech);


%length(hStem)
%size(hLine)
%h = [hStem; hLine];

% plot(t,speech);
% hold on;
% stem(gci,k,'ko');
% %hold off;

title('(B) Glottal Closure Instants','FontWeight','normal','FontSize',11)

xlabel('Time (in seconds)','FontWeight','normal','FontSize',11);
ylabel('GCI','FontWeight','normal','FontSize',11);
grid;

hgexport(gcf, 'gci', hgexport('factorystyle'), 'Format', 'epsc');    

end