function [jitt_val] = calcJitterFeatures(speech, Fs,  Tw, Ts)

%     Tw = 25;                % analysis frame duration (ms)
%     Ts = 10;                % analysis frame shift (ms)
    alpha = 0.97;           % preemphasis coefficient
    M = 20;                 % number of filterbank channels 
    C = 13;                 % number of cepstral coefficients
    L = 22;                 % cepstral sine lifter parameter
    LF = 300;               % lower frequency limit (Hz)
    HF = 3700;              % upper frequency limit (Hz)

    Nw = round( 1E-3*Tw*Fs );    % frame duration (samples)
    Ns = round( 1E-3*Ts*Fs );    % frame shift (samples)---->for testing purpose, both initial window and shift must be of same number of frames

    framevect=vec2frames( speech, Nw, Ns);

    framevect=framevect';

    [r,c] = size(framevect);
    
    for iter = 1:r
        
        segment = framevect(iter,1:end);
        
        [T0, F0, pks1] = Pitch_Calculation(segment, Fs);
        
        T0 = F0;
         [r_T0, c_T0] = size(T0);
         
         N = c_T0;
         
         if ( N > 2 )
            sum = 0;
            for k=1:N
                sum = sum + T0(k);
            end
            
            denum = (1/N) * sum;

            sum = 0;
            for k = 1:N-1
                sum = sum + (abs(T0(k) - T0(k+1)));
            end

            rel = (1/(N-1)) * sum;

            j_abs(iter) = rel;
            jitt_val(1, iter) = rel;
            %j_abs(iter) = 1/j_abs(iter);
            
            j_rel(iter) = (rel/denum);
            jitt_val(2, iter) = (rel/denum);
            %j_rel(iter) = 1/j_rel(iter);

            sum = 0;

            for k = 2:N-1
                sum = sum + (abs(T0(k) - ((T0(k) + T0(k-1) + T0(k+1))/3)));
            end

            rap = (1/(N-2)) * sum;

            j_rap(iter) = (rap/denum);
            %j_rap(iter) = 1/j_rap(iter);

            sum = 0;

            for k = 3:N-2
                sum = sum + (abs(T0(k) - ((T0(k) + T0(k-2) + T0(k-1) + T0(k+1) + T0(k+2))/5)));
            end

            ppq5 = (1/(N-4)) * sum;

            j_ppq5(iter) = (ppq5/denum);
            %j_ppq5(iter) = 1/j_ppq5(iter);
            
         elseif (N == 1)
%              j_abs(iter)  = F0(1);
%              j_rel(iter)  = F0(1);
%              j_rap(iter)  = F0(1);
%              j_ppq5(iter) = F0(1);
             
             jitt_val(1, iter) = F0(1);
             jitt_val(2, iter) = F0(1);
         else
%              j_abs(iter) = 0;
%              j_rel(iter) = 0;
%              j_rap(iter) = 0;
%              j_ppq5(iter) = 0;
             
             jitt_val(1, iter) = 0;
             jitt_val(2, iter) = 0;
         end
         
    end
end