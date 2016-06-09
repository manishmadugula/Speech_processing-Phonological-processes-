function [peaks, locations, r_peaks, c_peaks] = lpcspecDemo( speech, fs, Tw, Ts)
   
    Nw = round( 1E-3*Tw*fs );
    Ns = round( 1E-3*Ts*fs );
    
    window = @hamming;
    
            frames = vec2frames( speech, Nw, Ns, 'cols', window, false);  
            frames = frames.';
   
            [r, c] = size(frames);

            peaks(:,:) = 0;
            locations(:,:) = 0;
            frequency(:,:) = 0;
            
%             figure,
%             hold on;

            for i = 1:r
                [freq, lpc_logmag] = lpcspec(frames(i,:), fs);
                %[pks,locs] = findpeaks(lpc_logmag,'SORTSTR','descend');
                [pks, locs] = findpeaks(lpc_logmag);
                
                num = 2;
                
                pks = pks(:, 1:num);
                locs = locs(:, 1:num);
                %plot(freq(locs), pks);
%                 plot(freq(locs), pks,'r*');
    
                locs1 = freq(locs);
%                 plot(freq,lpc_logmag,'b');
%                 %hold off
%                 xlabel('Frequency (Hz)');
%                 ylabel('Magnitude (dB)');
                
                for k = 1:length(pks)
                    peaks(i,k) = pks(1,k);
                    locations(i,k) = locs1(1,k);
                end

                for k = 1:length(freq)
                    frequency(i,k) = freq(1,k);
                end
            end
%             hold off;
 
            peaks = transpose(peaks);
            locations = transpose(locations);
            
            [r_peaks c_peaks] = size(peaks);
            [r_locations c_locations] = size(locations);
            
%             save work.mat;
%             load('work.mat');
end