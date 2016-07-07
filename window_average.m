function [ sequence_avg ] = window_average( sequence,window_length,time_shift,Fs )
arr=[];
frame_length=((window_length)/1000)*Fs;
frame_shift    =((time_shift)/1000)*Fs;
for i=round(1:frame_shift:(length(sequence)-frame_length))
m=0;

for(j=i:(i+frame_length))
if(sequence(j)>0)
    m=m+1;
end
end
arr=[arr m];
end
sequence_avg=arr;

end

