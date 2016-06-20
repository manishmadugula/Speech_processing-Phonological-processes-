function [ ] = zfSig_energyTheshold( c1,c2,threshold,Tw )
%Add a threshold to the energy value and make it binary

c1_n=c1/max(c1)
c2_n=c2/max(c2);
c1_b=c1_n>threshold;
c2_b=c2_n>threshold;
figure;
subplot(2,1,1);
plot(c1_b);
subplot(2,1,2);
plot(c2_b);
figure;
[ minimum_distance,area,matrixX,matrixY,steps,path ] = dtwFeatureExtraction( c1_b,c2_b,Tw );
end

