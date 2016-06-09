   
function [MFCCs] = addShimmerFeatures(MFCCs, n, Fs, Tw, Ts)
        
    %fprintf('K value is : %d',k);
    
    [sh_val] = calcShimmerFeatures(n, Fs, Tw, Ts);
    
    [r_sh c_sh] = size(sh_val);
    [r_MFCCs c_MFCCs] = size(MFCCs);

    for q_1 = 1: r_sh
        MFCCs(r_MFCCs+q_1, :) = sh_val(q_1, :); 
    end;  
end