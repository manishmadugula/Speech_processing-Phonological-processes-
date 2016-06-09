waveFile = 'stam_1.wav';
[y, fs, nbits]=wavread(waveFile);
% afpOpt=afpOptSet0;
afpOpt=0;
[landmarkVec, specMat, threshold1, peakTable1]=afpFeaExtract(y, fs, afpOpt, 1);