function [  minimum_distance,area,matrixX,matrixY,steps] = pitchtoBinary( str1,str2,Tw )
% figure
[ matrix_pitch1 ] = pitchExtractPraat( str1);
% plot(matrix_pitch1);
% figure
[ matrix_pitch2 ] = pitchExtractPraat( str2);
% plot(matrix_pitch2)
% figure
matrix_pitch1=matrix_pitch1(:,2);
matrix_pitch2=matrix_pitch2(:,2);
matrix_pitch1b=matrix_pitch1>0;
matrix_pitch2b=matrix_pitch2>0;

subplot(2,1,1);
plot(matrix_pitch1b);
subplot(2,1,2)
plot(matrix_pitch2b);
figure
[matrix_pitch1d,matrix_pitch2d]=duration_normalization(matrix_pitch1b,matrix_pitch2b)
[ minimum_distance,area,matrixX,matrixY,steps ] = dtwFeatureExtraction( matrix_pitch1d.',matrix_pitch2d.',Tw );

end

