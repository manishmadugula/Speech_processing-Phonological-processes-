function [minimum_distance, area,matrixX,matrixY,steps  ] = pitch_dtwcomparision( str1,str2,Tw )
%%flag==1 if normalized flag==0 if normal else flag==anythingelse binary
%DTW of Pitch and finds the area and horizontal and vertical segments
%y1 AND y2 are 2 signals and Fs1 and Fs2 are their sampling frequency,Tw-window length,Ts-window Shift
%area is the area between y=x and the minimum path curve
%matrixX and matrixY has 3 columns the length of the horizontal segment and
%starting and ending co-ordinates of the segment in other 2 columns

% % Nw1 = round( 1E-3*Tw*Fs1 );    % frame duration (samples)
% % Ns1 = round( 1E-3*Ts*Fs1 );    % frame shift (samples)
% % 
% % framevect1=vec2frames( y1, Nw1, Ns1);
% % framevect1=framevect1';
% % 
% % [r1,c1] = size(framevect1);
% % 
% % matrix_pitch1=[];
% % 
% %     for iter = 1:r1
% %         segment = framevect1(iter,1:end);
% %          [ F0 ] = pitch_autocorr( segment,Fs1 );
% %         matrix_pitch1=[matrix_pitch1;F0];
% %     end
% % 
% %     Nw2 = round( 1E-3*Tw*Fs2 );    % frame duration (samples)
% %     Ns2 = round( 1E-3*Ts*Fs2 );    % frame shift (samples)---->for testing purpose, both initial window and shift must be of same number of frames
% % 
% %     framevect2=vec2frames( y2, Nw2, Ns2);
% %     framevect2=framevect2';
% % 
% %     [r2,c2] = size(framevect2);
% % 
% %     matrix_pitch2=[];
% % 
% %     for iter = 1:r2
% %         segment = framevect2(iter,1:end);
% %         [ F0 ] = pitch_autocorr( segment,Fs2 );
% %         matrix_pitch2=[matrix_pitch2;F0];
% %     end
% figure
close all;
[ matrix_pitch1 ] = pitchExtractPraat( str1);
% plot(matrix_pitch1);
% figure
[ matrix_pitch2 ] = pitchExtractPraat( str2);
% plot(matrix_pitch2)

matrix_pitch1=matrix_pitch1(:,2);
matrix_pitch2=matrix_pitch2(:,2);
mn=mean(matrix_pitch1);
% [ matrix_pitch1n ] = mean_normalization( matrix_pitch1,matrix_pitch1 );
% [ matrix_pitch2n ] = mean_normalization( matrix_pitch2,matrix_pitch2 );

[matrix_pitch1d,matrix_pitch2d]=duration_normalization(matrix_pitch1,matrix_pitch2);

[matrixpitch1s]=segment_normalization(matrix_pitch1d,mn);
[matrixpitch2s]=segment_normalization(matrix_pitch2d,mn);
for i=1:length(matrixpitch1s)
if ~isnan(matrixpitch1s(i))
    matrix_pitch1s(i)=matrixpitch1s(i);
else
    matrix_pitch1s(i)=0;
end
end
for i=1:length(matrixpitch2s)
if ~isnan(matrixpitch2s(i))
    matrix_pitch2s(i)=matrixpitch2s(i);
else
    matrix_pitch2s(i)=0;
end
end
plot(matrix_pitch1d);
figure
plot(matrix_pitch2d);
figure
% matrix_pitch1s
% matrix_pitch2s
% [ minimum_distance, area,matrixX,matrixY,steps ] = dtwFeatureExtraction( matrix_pitch1.',matrix_pitch2.',Tw );
[ minimum_distance, area,matrixX,matrixY,steps ] = dtwFeatureExtraction( matrix_pitch1s,matrix_pitch2s,Tw );     
%     [ minimum_distance2,area2] = dtwFeatureExtraction( matrix_pitch1n.',matrix_pitch2n.',Tw )
%     [  minimum_distance3,area3] = pitchtoBinary( str1,str2,Tw )
    
    


end

