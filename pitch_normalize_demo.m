Tw=30;
Ts=20;
[y1,Fs1,bit1]=wavread('total/shatapadi/correct/shatapadi (3).wav');
 [y2,Fs2,bit2]=wavread('total/shatapadi/correct/shatapadi_2.wav');
 [y3,Fs3,bit3]=wavread('total/shatapadi/correct/shatapadi_1.wav');
 [ F1 ] = pitch_profile( y1,Fs1,Tw,Ts );
 [ F2 ] = pitch_profile( y2,Fs2 ,Tw,Ts);
 [ F3 ] = pitch_profile( y3,Fs3,Tw,Ts );
 F0=[F1;F2;F3];
 S0=std(F0);
 A0=mean2(F0);
 F1=(F1-A0)/S0;

  [ minimum_distance,area] = dtwFeatureExtraction( F1.',F2.',Tw );
 figure;
 [ minimum_distance2,area2 ] = pitch_dtwcomparision( y1,y2,Fs1,Fs2,Tw,Ts )l