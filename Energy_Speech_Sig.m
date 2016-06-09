%function [store_min_distance_frm_wise, store_min_distance_frm_wise_after_thr, speech, y] = Energy_Speech_Sig(filename, S)

%function [store_min_distance_frm_wise] = Energy_Speech_Sig(filename)

function Energy_Speech_Sig

%[y,Fs,bits]=wavread('D:/wrkshp/Exercise8/New_mfcc_comp_14/data_files/test_sam.wav');

[y,Fs,bits]=wavread('ga_mono.wav');

%[y,Fs,bits]=wavread(filename);
Frame_size = 20;
Frame_shift = Frame_size/2;
Frame_Size = Frame_size/1000;
Frame_Shift = Frame_shift/1000;
 
% %eval(sprintf('y_%s = y',S));

%Compute length of Audio Signal
t=(1/Fs:1/Fs:(length(y)/Fs));
%t = [0:length(y)-1]/Fs;

%Plot a waveform of Audio Signal 

subplot(2,1,1);
plot(t,y);
title('Input Signal');
xlabel('Time (s)');
ylabel('Amplitude (dB)');

%Compute Window Length and Sample Shift of Signal Frame
window_length = Frame_Size*Fs;
sample_shift = Frame_Shift*Fs;

% %Window Length
% %w = rectwin(window_length);
% %w = hamming(window_length);
% %w = hann(window_length);
% w = hanning(window_length);

Total_Frames = floor(length(y)/sample_shift);
No_of_Sample_Shift_per_Frame = ceil(window_length/sample_shift);
c = Total_Frames-1;
jj = 1;
Sum = 0; Energy = 0;

tt = 1/Fs:(Frame_shift/1000):(length(Energy)*(Frame_shift/1000));
 
subplot(2,1,2);
plot(tt,C);
title('Input Signal');
xlabel('Time (s)');
ylabel('Energy');

% Define variables
    Tw = 20;                % analysis frame duration (ms)
    Ts = 10;                % analysis frame shift (ms)
    alpha = 0.97;           % preemphasis coefficient
    M = 20;                 % number of filterbank channels 
    C = 12;                 % number of cepstral coefficients
    L = 22;                 % cepstral sine lifter parameter
    LF = 300;               % lower frequency limit (Hz)
    HF = 3700;              % upper frequency limit (Hz)

[pitch_val, r_pitch, c_pitch] = calcPitchFeatures(y, Fs, bits, Tw, Ts);
[MFCCs, FBEs, frames ] = mfcc( y, Fs, Tw, Ts, alpha, @hamming, [LF HF], M, C+1, L );

%plot(peaks, locations);

% for i=1:p-1
%     x = new_locs(i+1) - new_locs(i);
%     z = 0;
%     x1 = 0;
%     if(x > 10)
%         x1 = 0;
%        for l = new_locs(o, i): new_locs(o, i+1)
%            for j = (l-1)*sample_shift+1:(l-1)*sample_shift+window_length
%              z = z+1;
%              y1(j) = y(j);
%              x1(z)= y(j); 
%            end;
%            z = z - sample_shift;
%        end;
%        [MFCCs, FBEs, frames ] = mfcc( x1, Fs, Tw, Ts, alpha, @hamming, [LF HF], M, C+1, L );
%        eval(sprintf('MFCCs%d=MFCCs',i));
%        store_frame_no(u) = i;
%        %eval(sprintf('M%d=transpose(MFCCs%d)',i,i));
%        %eval(['MFCCs', num2str(i), ' = ', num2str(i)]);
%        u = u+1;
%     end;    
% end;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure;
% plot(y1); hold('on'); %plot(new_locs, new_pks, 'r*');
% hold('off');
% xlabel('quefrency samples');
% ylabel('log magnitude spectrum');
% 
% wavwrite(y1,16000,'ooo.wav');
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% speech = zeros(size(y));
%      
% adjustment_window_size=20;
% 
% [o p] = size(new_pks);
% 
% [a b] = size(store_frame_no);
% 
% for x=1:b-1
%     k = store_frame_no(x);
%     c = new_locs(o, k);
%     m = (c-1)*sample_shift+1;
%     time_in_ms_first = (m*1000)/Fs;   
%      
%     z = 0;
%     x1 =0;
%     
%     ct = k;
%     ct_1 = k+1;
%        
%     if((k-1) > 1)
%        x2 = new_locs(k) - new_locs(k-1);
%        if(x2 < 10)
%            ct = k-1;
%        end;
%     end;
%        
%     if((k+2) <= p && (k+1) <= p)
%        x3 = new_locs(k+2) - new_locs(k+1);
%        if(x3 < 10)
%             ct_1 = k+2;
%        end;           
%     end;
%     
%     for l = new_locs(o, ct): new_locs(o, ct_1)
%          for m = (l-1)*sample_shift+1:(l-1)*sample_shift+window_length
% %         for m = (l)*sample_shift+1:(l)*sample_shift+window_length
%               z = z+1;
%               x1(z) = y(m);                    
%           end;
%            z = z - sample_shift;
%     end;  
%     %z = z - sample_shift;    
%     ct_t = 0;
%     ct_t_1 = 0;
%     
%     for w = (x+1):b
%         k_1 = store_frame_no(w);
%         l = new_locs(o, k_1);        
%         j =(l-1)*sample_shift+window_length;
%         time_in_ms_second = (j*1000)/Fs;
%      
%         z_1 = 0;
%         x1_1 =0;     
%         
%         ct_t = k_1;
%         ct_t_1 = k_1+1;       
%         
%         if((k_1-1) > 1)
%             x2 = new_locs(k_1) - new_locs(k_1-1);
%             if(x2 < 10)
%                 ct_t = k_1-1;
%             end;
%         end;
%        
%         if((k_1+2) <= p && (k_1+1) <= p)
%             x3 = new_locs(k_1+2) - new_locs(k_1+1);
%             if(x3 < 10)
%                 ct_t_1 = k_1+2;
%             end;           
%         end;
%         
%         for l_1 = new_locs(o, ct_t): new_locs(o, ct_t_1)
%             for m_1 = (l_1-1)*sample_shift+1:(l_1-1)*sample_shift+window_length 
%                 z_1 = z_1+1;
%                 x1_1(z_1) = y(m_1);   
%             end;
%             z_1 = z_1 - sample_shift;
%         end;
%        
%         time_in_ms = time_in_ms_second - time_in_ms_first;
%         
%         [aa bb] = size(x1);
%         [cc dd] = size(x1_1);
% 
%         time_of_first = (bb*1000)/Fs;
%         time_of_second = (dd*1000)/Fs;
%         
% %         if((time_of_first <= 350) && (time_of_second <= 350) && (time_in_ms < 1000))
%         if(((time_of_first/2) <= time_of_second) && time_in_ms < 1000)  
%             
%             [c_1, n_1] = sm_lrg(x1,x1_1);
%             
%             [MFCCs, FBEs, frames ] = mfcc( c_1, Fs, Tw, Ts, alpha, @hamming, [LF HF], M, C+1, L );
%             [peaks, locations, r_peaks, c_peaks] = lpcspecDemo( c_1, Fs, Tw, Ts);
% %             [pitch_val, r_pitch, c_pitch] = calcPitchFeatures(c_1, Fs, bits, Tw, Ts);
%             [r_MFCCs c_MFCCs] = size(MFCCs);
%             
%             for q = 1: r_peaks
%                 MFCCs(r_MFCCs+q, :) = peaks(q, :); 
%             end;
%             
% %             [MFCCs] = addShimmerFeatures(MFCCs, c_1, Fs, Tw, Ts);
%             
%             [MFCCs] = addJitterFeatures(MFCCs, c_1, Fs, Tw, Ts);
%             
% %             %%%%%%%%%%%%%%%%%%%%%%  Pitch feature addn %%%%%%%%%%%%%%%%%%%%
% %             r_MFCCs = 0; c_MFCCs = 0;
% %             [r_MFCCs c_MFCCs] = size(MFCCs);
% %             
% %             for q_1 = 1: r_pitch
% %                 MFCCs(r_MFCCs+q_1, :) = pitch_val(q_1, :); 
% %             end;            
% %             %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             
%             [MFCCs_1, FBEs_1, frames_1 ] = mfcc( n_1, Fs, Tw, Ts, alpha, @hamming, [LF HF], M, C+1, L );
%             [peaks_1, locations_1, r_peaks_1, c_peaks_1] = lpcspecDemo( n_1, Fs, Tw, Ts);
% %             [pitch_val_1, r_pitch_1, c_pitch_1] = calcPitchFeatures(n_1, Fs, bits, Tw, Ts);
%             [r_MFCCs_1 c_MFCCs_1] = size(MFCCs_1);
%             
%             for q = 1: r_peaks_1
%                 MFCCs_1(r_MFCCs_1+q, :) = peaks_1(q, :); 
%             end; 
%             
% %             [MFCCs_1] = addShimmerFeatures(MFCCs_1, n_1, Fs, Tw, Ts);
%             
%             [MFCCs_1] = addJitterFeatures(MFCCs_1, n_1, Fs, Tw, Ts);          
%            
% %             %%%%%%%%%%%%%%%%%%%%%% Pitch feature addn %%%%%%%%%%%%%%%%%%%%%
% %             r_MFCCs_1 = 0; c_MFCCs_1 = 0;
% %             [r_MFCCs_1 c_MFCCs_1] = size(MFCCs_1);
% %  
% %             for q_1 = 1: r_pitch_1
% %                 MFCCs_1(r_MFCCs_1+q_1, :) = pitch_val_1(q_1, :); 
% %             end;                  
% %             %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%            
%             
%             [minimum_distance, d, g, path] = dtw(MFCCs, ...
%                                             MFCCs_1, ...
%                                             adjustment_window_size);
%                                      
%             store_min_distance_frm_wise(x, w) = minimum_distance;
%         else
%             
% %             if(time_in_ms < 800)
% %                 [x1, x1_1] = sm_lrg(x1,x1_1);
% %                 
% %                 [MFCCs, FBEs, frames ] = mfcc( x1, Fs, Tw, Ts, alpha, @hamming, [LF HF], M, C+1, L );
% %        
% %                 [MFCCs_1, FBEs_1, frames_1 ] = mfcc( x1_1, Fs, Tw, Ts, alpha, @hamming, [LF HF], M, C+1, L );
% %             
% %                 [minimum_distance, d, g, path] = dtw(MFCCs, ...
% %                                             MFCCs_1, ...
% %                                             adjustment_window_size);  
% %                 store_min_distance_frm_wise(x, w) = minimum_distance;               
% %            end; 
%         end;
%     end;  
% end;
% 
% store_min_distance_frm_wise
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% % adjustment_window_size=20;
% % 
% % [a b] = size(store_frame_no);
% % 
% % for x=1:b-1
% %     k = store_frame_no(x);
% %     eval(sprintf('curr_frm = MFCCs%d',k));
% %     curr_frm_1 = curr_frm(2:13,:);
% %     size(curr_frm_1);
% %     c = new_locs(o, k);
% %     m = (c-1)*sample_shift+1;
% %     time_in_ms_first = (m*1000)/Fs;
% %     for w = (x+1):b
% %         i = store_frame_no(w);
% %         l = new_locs(o, i);
% %         j =(l-1)*sample_shift+window_length;
% %         time_in_ms_second = (j*1000)/Fs;
% %         eval(sprintf('nxt_frm = MFCCs%d',i));
% %         nxt_frm_1 = nxt_frm(2:13,:);
% %         
% %         time_in_ms = time_in_ms_second - time_in_ms_first;
% %         [aa bb] = size(nxt_frm_1);
% %         [cc dd] = size(curr_frm_1);
% %         
% %         ee = abs(bb-dd);
% %         
% %         if((ee > bb) || (ee > dd))         
% %             % do nothing            
% %         else
% %             [c_1, n_1, Z_1] = sm_lrg(curr_frm_1, nxt_frm_1);
% %         
% %             if(time_in_ms < 800)
% %                 [minimum_distance, d, g, path] = dtw(c_1, ...
% %                                             n_1, ...
% %                                             adjustment_window_size);  
% %                 store_min_distance_frm_wise(x, w) = minimum_distance;
% %             end;
% %         end;
% %     end;
% % end;
% 
% [r, c] = size(store_min_distance_frm_wise);
% 
% store_min_distance_frm_wise_after_thr = store_min_distance_frm_wise;
% 
% thr = 500.00;
% 
% for i = 1:c
%    for j = 1:r;
%      if((store_min_distance_frm_wise(j, i)<= thr) && (store_min_distance_frm_wise(j, i) > 0))
%          store_min_distance_frm_wise_after_thr(j,i) = -1; 
%      end;
%    end;
% end;
%      
% speech = zeros(size(y));
%      
% [o p] = size(new_pks);
% 
% for i = 1:r
%    for j = 1:c;
% %      if((j-i) > 0)
%        if(store_min_distance_frm_wise_after_thr(i,j) < 0)
%            
%                 k = store_frame_no(i); 
%                 
%                 ddd = 0;
%                 ddd_1 = 0;
%                 
%                 for l = new_locs(o, k): new_locs(o, k+1)
%                     for m = (l-1)*sample_shift+1:(l-1)*sample_shift+window_length
%                         if(ddd == 0)
%                             ddd = m;
%                         end;
%                         ddd_1 = ddd_1 + 1;
%                         speech(m) = y(m);                    
%                     end;
%                     ddd_1 = ddd_1 - sample_shift;
%                 end;
%                 ddd_1 = ddd_1 + sample_shift;
%                 
%                 k_1 = store_frame_no(j); 
% 
%                 ccc = 0;
%                 ccc_1 = 0;
%                 
%                 for l_1 = new_locs(o, k_1): new_locs(o, k_1+1)
%                     for m_1 = (l_1-1)*sample_shift+1:(l_1-1)*sample_shift+window_length
%                         if(ccc == 0)
%                             ccc = m_1;
%                         end;
%                         ccc_1 = ccc_1 + 1;
%                         speech(m_1) = y(m_1);   
%                     end;
%                     ccc_1 = ccc_1 - sample_shift;
%                 end;
%                 ccc_1 = ccc_1 + sample_shift;
%                 
%                 time_of_f = (ddd_1*1000)/Fs;
%                 time_of_s = (ccc_1*1000)/Fs;
%                 
%                 if(time_of_f < (time_of_s/2))
%                     for g = ccc : (ccc+ccc_1+sample_shift)
%                         speech(g) = 0;
%                     end;
%                 end;
%                 
%                 store_min_distance_frm_wise_after_thr(j, 1:end) = 0;      
%        end;
%     end;
% end;
% 
% store_min_distance_frm_wise_after_thr
% 
% figure;
% plot(speech); hold('on'); %plot(new_locs, new_pks, 'r*');
% hold('off');
% xlabel('Time (S)');
% ylabel('Amplitude (dB)');
% 
% wavwrite(speech,16000,'ooo1.wav');
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% function [c_1, n_1] = sm_lrg(X,Y)
% 
%     [aa bb] = size(X);
%     [cc dd] = size(Y);
%     
%     if bb < dd
% %         Z_1 = -1;
%         u = dd - bb;
%         Y1 = ret_arr(Y, u); 
%         n_1 = Y1;
%         c_1 = X;                    
%     else
%         if bb > dd
% %             Z_1 = 1;
%             u = bb - dd;
%             X1 = ret_arr_1(Y, u); 
%             n_1 = X1;
%             c_1 = X;            
%         else
% %             Z_1 = 0;
%             n_1 = Y;
%             c_1 = X;
%         end;
%     end;
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% % function [Y1] = ret_arr(Y, u)
% % 
% % [x dd] = size(Y);
% % Y1 = zeros(x, dd+u);
% % 
% % cnt =1;
% % z_cnt = 1;
% % an_cnt = 0;
% % 
% %   for i = 1:dd+u
% %       if(z_cnt <= dd-u/2)
% %           Y1(:,i) = Y(:,z_cnt);
% %           if(cnt <= u)
% %               if(mod(cnt, 2) == 0)                     
% %                   Y1(:,i) = Y(:,z_cnt);
% %                   z_cnt = z_cnt +1;          
% %                   cnt = cnt+1;
% %               else
% %                   Y1(:,dd+u-(i-1)) = Y(:,dd-an_cnt);
% %                   Y1(:,dd+u-i) = Y(:,dd-an_cnt);                       
% %                   an_cnt = an_cnt+1;        
% %                   cnt = cnt+1;                    
% %               end;
% %           else
% %               z_cnt = z_cnt +1;
% %           end;
% %      end;
% %   end;
%   
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function [Y1] = ret_arr(Y, u)
% 
%     [x dd] = size(Y);
%     Y1 = zeros(x, dd);  
%     cnt =1;   
%     test = zeros(x, 1);
%     
%         for i = 1:dd
%             if(cnt <= u)
%                 if(mod(cnt, 2) == 0)            
%                     Y(1:end,i) = 0;
%                     cnt = cnt+1;
%                 else
%                     md = mod(cnt, 2);
%                     Y(1:end, dd-(i-1)) = 0;
%                     cnt = cnt+1;
%                 end;
%             end;
%         end; 
%         
%         cnt = 0;
%         z=0;
%         for i = 1:dd
%             demo = Y(:, i);       
%             if (demo == test)
% 
%             else
%                 cnt = cnt +1;
%                 Y1(:, cnt) = Y(:, i); 
%             end;
%         end;
%         Y1 = Y1(:, 1:(dd-u)); 
%         
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function [Y1] = ret_arr_1(Y, u)
% 
% [x dd] = size(Y);
% Y1 = zeros(x, dd+u);
% 
% cnt =1;
% z_cnt = 1;
% an_cnt = 0;
% 
%   for i = 1:dd+u
%       if(z_cnt <= dd-u/2)
%           Y1(:,i) = Y(:,z_cnt);
%           if(cnt <= u)
%               if(mod(cnt, 2) == 0)                     
%                   Y1(:,i) = Y(:,z_cnt);
%                   z_cnt = z_cnt +1;          
%                   cnt = cnt+1;
%               else
%                   Y1(:,dd+u-(i-1)) = Y(:,dd-an_cnt);
%                   Y1(:,dd+u-i) = Y(:,dd-an_cnt);                       
%                   an_cnt = an_cnt+1;        
%                   cnt = cnt+1;                    
%               end;
%           else
%               z_cnt = z_cnt +1;
%           end;
%      end;
%   end;