function [ matrix_pitch ] = mean_normalization( matrix1,matrix2 )
%if you want to normalize just single sound matrix1=matrix2
%if you want to normalize over several sounds spoken by speaker
%matrix1=sound,matrix2=concatenation of all the sounds
Tw=30;
Ts=20;
S0=std(matrix2);
A0=mean2(matrix2);
matrix_pitch=(matrix1-A0)/S0;

end

