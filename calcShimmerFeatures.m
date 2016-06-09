function [sh_val] = calcShimmerFeatures(speech, Fs, Tw, Ts)

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
        
        [T0, F0, a] = Pitch_Calculation(segment, Fs);
        
        
         [r_T0, c_T0] = size(a);
         
         N = c_T0;
         
         if ( N > 2 )
            abs1 = 0;
            for ind = 1:N-1
                abs1 = abs1 + abs(20 * log10(a(ind+1)/a(ind)));
            end
            sh_abs(iter) = (1/(N-1)) * abs1;
            sh_val(1, iter) = sh_abs(iter);
            
           avg1 = 0;
           sum1 = 0;

           for ind = 1:N
               sum1 = sum1 + a(ind);
           end
           avg1 = (1/N) * sum1;

           rel1 = 0;
           for ind = 1:N-1
               rel1 = rel1 + abs(a(ind) - a(ind+1));
           end
           rel1 = (1/(N-1)) * rel1;

           sh_rel(iter) = rel1/avg1;
           sh_val(2, iter) = sh_rel(iter);
           
           apq3 = 0;

           for ind = 2:N-1
               apq3 = apq3 + abs(a(ind) - ((a(ind) + a(ind-1) + a(ind+1))/3));
           end

           apq3 = (1/(N-2)) * apq3;

           sh_apq3(iter) = apq3/avg1;
            
         elseif (N == 1)
%              sh_abs(iter)  = a(1);
%              sh_rel(iter)  = a(1);
%              sh_apq3(iter) = a(1);
             
             sh_val(1, iter) = a(1);
             sh_val(2, iter) = a(1);            
         else
%              sh_abs(iter)  = 0;
%              sh_rel(iter)  = 0;
%              sh_apq3(iter) = 0;  
             
             sh_val(1, iter) = 0;
             sh_val(2, iter) = 0;                          
         end  
    end
    
end