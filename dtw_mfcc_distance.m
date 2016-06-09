function [minimum_distance, dist]= dtw_mfcc_distance()
% % Load wave files and return minimal time normalized dtw mfcc distance.
% 
% % Matlab doesn't have real default arguments, use an ugly workaround
% if (nargin<3)
%     debug=false;
% else
%     debug=true;
% end
% 
% % get data and sampling rate from wav_file1 and wav_file2
% [data1, sr1] = wavread(wav_file1);
% [data2, sr2] = wavread(wav_file2);
% 
% assert(sr1==sr2, 'sampling rates of two compared files should be equal');
% 
% if (debug)
%     % play samples in stereo if we are in debug mode
%     len = max(length(data1), length(data2));
%     pad1 = len - length(data1);
%     pad2 = len - length(data2);
%     soundsc([padarray(data1, pad1, 0, 'post'), ...
%              padarray(data2, pad2, 0, 'post')],...
%             sr1);
% end
% 
% % get mfcc ceps feature vectors
% [ceps1,freqresp1,fb1,fbrecon1,freqrecon1] = mfcc(data1, sr1, 100);
% [ceps2,freqresp2,fb2,fbrecon2,freqrecon2] = mfcc(data2, sr2, 100);
% 
% % energy1 = get_power(freqresp1);
% % energy2 = get_power(freqresp2);
% 
% % discard the first row of the feature vector
% features1 = ceps1(2:8,:);
% features2 = ceps2(2:8,:);

% TODO: find a usable adjustment window size
adjustment_window_size=20;

% load('M1.mat', '-mat');
% load('M8.mat', '-mat');

load('d4.mat', '-mat');
d1 = d;
load('d5.mat', '-mat');
d5 = d;

M_1 = transpose(d1);
M_2 = transpose(d5);

%M_1 = transpose(MFCCs4);
%M_2 = transpose(MFCCs4);

% [w_1 y_1] = size(MFCCs4);
% [w_2 y_2] = size(MFCCs12);

% w_sh = 5;
% w_sz = 10;
% 
% for i=1:w_sh:y_1
%     if((i+w_sz) < y_1)
%         M_1_1 = MFCCs4(:, i : i + w_sz);
%     else
%         M_1_1 = MFCCs4(:, i : y_1);
%     end;
%     cc = 0;
%     for j=i:w_sh:y_2
%         cc = cc + 1;  
%         if(cc < 4)
%             if((j+w_sz) < y_2)
%                 M_2_1 = MFCCs12(:, j : j + w_sz);
%             else
%                 M_2_1 = MFCCs12(:, j : y_2);
%             end;
%             [minimum_distance, d, g, path] = dtw(M_1_1, ...
%                                              M_2_1, ...
%                                              adjustment_window_size);
%              minimum_distance
%         end;
%     end;
% end;

% [w_1_1 y_1_1] = size(M_1_2);
% 
% w_1_1
% y_1_1

% M_1_1 = MFCCs4(2:13,:);
% M_2_1 = M_2_2(2:13,:);

% [minimum_distance, d, g, path] = dtw(features1, ...
%                                      features2, ...
%                                      adjustment_window_size);

[minimum_distance, dist, g, path] = dtw(M_1, ...
                                     M_2, ...
                                     adjustment_window_size);

% if (debug)
%     % show local distance matrix
%     subplot(321);
%     show_distance_matrix(d, path);
% 
%     % show global distance matrix
%     subplot(322);
%     show_distance_matrix(g, path);
% 
%     % show feature 1 spectrogram
%     subplot(323);
%     show_mfcc_data(freqresp1);
%     
%     % show feature 2 spectrogram
%     subplot(324);
%     show_mfcc_data(freqresp2);        
%     
%     % show feature 1 data
%     subplot(325);
%     show_mfcc_data(features1);
%     
%     % show feature 2 data
%     subplot(326);
%     show_mfcc_data(features2);    
%     
% end