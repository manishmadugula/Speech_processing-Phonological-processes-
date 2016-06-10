
function plotAll()

%{
Tw = 25;                % analysis frame duration (ms)
Ts = 10;                % analysis frame shift (ms)
alpha = 0.97;           % preemphasis coefficient
M = 20;                 % number of filterbank channels 
C = 12;                 % number of cepstral coefficients
L = 22;                 % cepstral sine lifter parameter
LF = 300;               % lower frequency limit (Hz)
HF = 3700;              % upper frequency limit (Hz)
%}

figure,


wav_file = 'InputFile.wav';

[x, fs, nbits] = wavread(wav_file);
time = (1/fs):(1/fs):((length(x)/fs));
subplot(3,1,1);
plot(time,x,'k');
length(x)/fs-0.6110;
xlim([0 60.9]); 
ylim([-1 1]);

set(0,'DefaultTextFontsize',10, ...
'DefaultTextFontname','Times New Roman', ...
'DefaultTextFontWeight','normal', ...
'DefaultAxesFontname','Times New Roman', ...
'DefaultLineLineWidth', 1)

xlabel('Time (in seconds)','FontWeight','normal','FontSize',10);
ylabel('Amplitude (dB)','FontWeight','normal','FontSize',10);



subplot(3,1,2);
signal_info = csvread('signal_b.csv');

seperation = csvread('seperation_b.csv');
%seperation = seperation.';

[r_s, c_s] = size(signal_info);

[r_f, c_f] = size(seperation);

fprintf('Size of Final_a is : %d %d',r_f,c_f);


point = 0;

fs = 44100;

count_1 = 0;
count_0 = 0;
for i = 1:r_s
    frame = signal_info(i,:);
    
    if seperation(i,1) == 1
        count_0 = 0;
        time = ((point+1)/fs):(1/fs):((point+length(frame))/fs);
        plot(time,frame,'k');
        hold on;
    else
        count_1 = 0;
        time = ((point+1)/fs):(1/fs):((point+length(frame))/fs);
        plot(time,frame,'w');
        hold on;
    end
    
    point = (point + length(frame));
end

xlim([0 60.9]); 
ylim([-1 1]);

xlabel('Time (in seconds)','FontWeight','normal','FontSize',10);
ylabel('Amplitude (dB)','FontWeight','normal','FontSize',10);



subplot(3,1,3);
signal_info = csvread('signal1.csv');

seperation = csvread('seperation1.csv');
seperation = seperation.';

[r_s, c_s] = size(signal_info);

[r_f, c_f] = size(seperation);

fprintf('Size of Final_a is : %d %d',r_f,c_f);


point = 0;

fs = 44100;

count_1 = 0;
count_0 = 0;
for i = 1:r_s
    frame = signal_info(i,:);
    
    if seperation(i,1) == 1
        count_0 = 0;
        time = ((point+1)/fs):(1/fs):((point+length(frame))/fs);
        plot(time,frame,'k');
        hold on;
        
        if (count_1 == 0)
            stem(time(1,1),-1,'bo');
            count_1 = count_1 + 1;
        end
    else
        count_1 = 0;
        time = ((point+1)/fs):(1/fs):((point+length(frame))/fs);
        plot(time,frame,'w');
        hold on;
    end
    
    point = (point + length(frame));
end


xlim([0 60.9]); 
ylim([-1 1]);

xlabel('Time (in seconds)','FontWeight','normal','FontSize',10);
ylabel('Amplitude (dB)','FontWeight','normal','FontSize',10);
fname = 'VocalRegions.eps';
hgexport(gcf, fname, hgexport('factorystyle'), 'Format', 'epsc');
end