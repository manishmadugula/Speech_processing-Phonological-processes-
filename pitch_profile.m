function [ matrix_pitch ] = pitch_profile( y,Fs,Tw,Ts )


Nw = round( 1E-3*Tw*Fs );    % frame duration (samples)
Ns = round( 1E-3*Ts*Fs );    % frame shift (samples)

framevect=vec2frames( y, Nw, Ns);
framevect=framevect';

[r,c] = size(framevect);

matrix_pitch=[];

    for iter = 1:r
        segment = framevect(iter,1:end);
         [ F0 ] = pitch_autocorr( segment,Fs );
        matrix_pitch=[matrix_pitch;F0];
    end

  

end

