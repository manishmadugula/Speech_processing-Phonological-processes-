function demoLPR()
    
    [x, fs, nbits] = wavread('aa_f.wav');
    
    fs
    
    length(x) 
%     speech = x;
%     
%     Tw = 20;
%     Fs = 20;
%     
%     Nw = round( 1E-3*Tw*fs );    % frame duration (samples)
%     Ns = round( 1E-3*Tw*fs );    % frame shift (samples)---->for testing purpose, both initial window and shift must be of same number of frames
%     
%     Nw
%     Ns
%                      
%     framevect=vec2frames1( speech, Nw, Ns);
%             
%     framevect=framevect';
%     
%     [r, c] = size(framevect);
%     
%     framesize = 160;
%     
%     frameshift = 160;
%     lporder = 16;
%     preempflag = 1;
%     a = 1;
%     plotflag = 0;
%     
%     res1 = [];
%     temp = 0;
%     for i = 1:r
%         speech1 = framevect(i,:);
%         
%         [residual,LPCoeffs] = LPresidual_v4(speech,framesize,frameshift,lporder,preempflag,a,plotflag);
%         start = ((i-1)*160)+1;
%         end1 = ((i-1)*160)+160;
%         l = 1;
%         for k = start:end1
%             res1(k) = real(residual(l));
%             l = l+1;
%         end
%         %length(res1)
%         %length(speech1)
%     end
%     
%     length(x)
%     length(res1)
%     
%     
%     speech = x(1501:1660);
%     res2 = res1(1501:1660);
%     
%     wavwrite(res1,fs,'residual.wav');
%     figure;
% subplot(2,1,1)
% fs = 8000;
% t = (1/fs):(1/fs):(length(speech)/fs);
% plot(t,speech);
% 
% set(0,'DefaultTextFontsize',11, ...
% 'DefaultTextFontname','Times New Roman', ...
% 'DefaultTextFontWeight','normal', ...
% 'DefaultAxesFontname','Times New Roman', ...
% 'DefaultLineLineWidth', 1)
% 
% title('(A) Original speech file','FontWeight','normal','FontSize',11)
% 
% xlabel('Time (in seconds)','FontWeight','normal','FontSize',11);
% ylabel('Amplitude (dB)','FontWeight','normal','FontSize',11);
% grid;
% 
% %z = xcorr(speech);
% 
% [x,lag] = xcorr(speech);
% 
% for j=1:length(lag)-1
%     if(lag(j) == 0)
%         idx_lag_0 = j;
%         break;
%     end;
% end;
% 
% lag1 = lag(j:length(lag));
% x1 = x(j:length(x));
% %{
% subplot(3,1,2);
% plot(t,x1);
% title('(B) Auto Correlation','FontWeight','normal','FontSize',11)
% xlabel('Time (in seconds)','FontWeight','normal','FontSize',11);
% ylabel('Log Magnitude','FontWeight','normal','FontSize',11);
% grid;
% %}
% 
% subplot(2,1,2)
% plot(real(res2));
% title('(B) LP Residual','FontWeight','normal','FontSize',11)
% 
% xlabel('Time (in seconds)','FontWeight','normal','FontSize',11);
% ylabel('Amplitude (dB)','FontWeight','normal','FontSize',11);
% grid;
% 
% hgexport(gcf, 'lpresidual', hgexport('factorystyle'), 'Format', 'png');
    
    
    
    speech = x(1501:1660);
    length(speech)
    framesize = 160;
    
    frameshift = 160;
    lporder = 16;
    preempflag = 1;
    a = 1;
    plotflag = 1;
    
    
    
    [residual,LPCoeffs] = LPresidual_v4(speech,framesize,frameshift,lporder,preempflag,a,plotflag)
    
    
    
    
end