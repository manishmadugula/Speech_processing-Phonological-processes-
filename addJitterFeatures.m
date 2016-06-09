   
function [MFCCs] = addJitterFeatures(MFCCs, n, Fs, Tw, Ts)
        
    %fprintf('K value is : %d',k);
    [jitt_val] = calcJitterFeatures(n, Fs, Tw, Ts);
    
    [r_MFCCs c_MFCCs] = size(MFCCs);
    [r_jitt c_jitt] = size(jitt_val);
    
    for q_1 = 1: r_jitt
        MFCCs(r_MFCCs+q_1, :) = jitt_val(q_1, :); 
    end;  
end